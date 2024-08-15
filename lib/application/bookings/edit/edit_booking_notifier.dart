import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'edit_booking_state.dart';

class EditBookingNotifier extends StateNotifier<EditBookingState> {
  final BookingsFacade _bookingRepository;

  EditBookingNotifier(this._bookingRepository)
      : super(const EditBookingState());

  Future<void> fetchBookingDetails({
    required BuildContext context,
    required int? id,
    required ValueChanged<BookingData?>? onSuccess,
  }) async {
    state = state.copyWith(isLoading: true);
    final res = await _bookingRepository.fetchSingleBooking(id);
    res.when(success: (data) {
      state = state.copyWith(isLoading: false, bookingData: data.data);
      onSuccess?.call(data.data);
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  // Future<void> updateBooking(
  //   BuildContext context, {
  //   required String price,
  //   required String pause,
  //   required String interval,
  //   required String title,
  //   required int categoryId,
  //   String? description,
  //   ValueChanged<BookingData?>? updated,
  //   VoidCallback? failed,
  // }) async {
  //   state = state.copyWith(isUpdating: true);
  //   final response = await _bookingRepository.updateBooking(
  //     images: imageUrl,
  //     title: title,
  //     description: description,
  //     price: num.tryParse(price) ?? 0,
  //     pause: int.tryParse(pause) ?? 0,
  //     interval: int.tryParse(interval) ?? 0,
  //     categoryId: categoryId,
  //     id: state.BookingData?.id,
  //   );
  //   response.when(
  //     success: (data) {
  //       state = state.copyWith(images: [], isUpdating: false);
  //       updated?.call(data.data);
  //     },
  //     failure: (fail, status) {
  //       AppHelpers.errorSnackBar(
  //         context,
  //         text: fail,
  //       );
  //       state = state.copyWith(isUpdating: false);
  //       debugPrint('===> booking update fail $fail');
  //       failed?.call();
  //     },
  //   );
  // }
}
