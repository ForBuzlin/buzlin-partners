import 'dart:async';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'booking_state.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class BookingNotifier extends StateNotifier<BookingState> {
  final BookingsFacade _bookingRepository;
  int _page = 0;

  BookingNotifier(this._bookingRepository) : super(const BookingState());

  Future<void> fetchBookings({
    required BuildContext context,
    bool? isRefresh,
    RefreshController? controller,
    DateTime? startTime,
    DateTime? endTime,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(bookings: [], isLoading: true);
    }
    final res = await _bookingRepository.getBookings(
      page: ++_page,
      startDate: startTime ?? state.startDate,
      endDate: endTime ?? state.endDate,
      masterId: state.selectMaster == -1 ? null : state.selectMaster,
      status: state.status,
    );
    res.when(success: (data) {
      List<BookingData> list = List.from(state.bookings);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, bookings: list);
      if (isRefresh ?? false) {
        controller?.refreshCompleted();
        return;
      } else if (data.data?.isEmpty ?? true) {
        controller?.loadNoData();
        return;
      }
      controller?.loadComplete();
      return;
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> deleteBooking(BuildContext context, int? id) async {
    state = state.copyWith(isLoading: true);
    final response = await _bookingRepository.deleteBooking(id);
    response.when(
      success: (success) {
        List<BookingData> list = List.from(state.bookings);
        list.removeWhere((element) => element.id == id);
        state = state.copyWith(bookings: list);
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(
          context,
          text: failure,
        );
      },
    );
    state = state.copyWith(isLoading: false);
  }

  Future<void> addBooking(BookingData? booking) async {
    if (booking == null) return;
    List<BookingData> list = List.from(state.bookings);
    int? index;
    for (int i = 0; i < list.length; i++) {
      if (booking.id == list[i].id) {
        index = i;
      }
    }
    if (index != null) {
      list[index] = booking;
    } else {
      list.add(booking);
    }
    state = state.copyWith(bookings: list);
  }

  changeCalendarType({
    required int index,
    required BuildContext context,
  }) {
    DateTime? startDate;
    DateTime? endDate;
    switch (index) {
      case 0:
        startDate = DateTime.now();
        endDate = DateTime.now();
        break;
      case 1:
        startDate = DateTime.now().subtractDay(1);
        endDate = DateTime.now().addDay(1);
        break;
      case 2:
        startDate = DateTime.now().firstDayOfWeek();
        endDate = DateTime.now().lastDayOfWeek();
        break;
    }
    state = state.copyWith(
        startDate: startDate,
        endDate: endDate,
        calendarType: index,
        calendarZoom: 2.2);
    fetchBookings(
      context: context,
      isRefresh: true,
      startTime: startDate,
      endTime: endDate,
    );
    Navigator.pop(context);
  }

  changeMaster({required int? id, required BuildContext context}) {
    state = state.copyWith(selectMaster: id ?? -1);
    fetchBookings(context: context, isRefresh: true);
    Navigator.pop(context);
  }

  changeStatus({required String? status, required BuildContext context}) {
    state = state.copyWith(status: state.status == status? null:status);
    fetchBookings(context: context, isRefresh: true);
    Navigator.pop(context);
  }

  changeZoom({double? i}) {
    state = state.copyWith(calendarZoom: i ?? state.calendarZoom);
  }

  changeDate(BuildContext context, {DateTime? startDate}) {
    final endDate = state.calendarType == 0
        ? startDate
        : state.calendarType == 1
            ? startDate?.addDay(2)
            : startDate?.addDay(6);
    state = state.copyWith(startDate: startDate, endDate: endDate);
    Delayed(milliseconds: 300).run(() async {
      fetchBookings(
        context: context,
        isRefresh: true,
        startTime: startDate,
        endTime: endDate,
      );
    });
  }
}
