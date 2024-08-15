import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/domain/handlers/api_result.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'create_booking_state.dart';

class CreateBookingNotifier extends StateNotifier<CreateBookingState> {
  final BookingsFacade _bookingRepository;
  final ServiceFacade _serviceRepository;
  final PaymentsFacade _paymentsRepository;
  final ServiceMasterFacade _serviceMasterRepository;
  int _page = 0;

  CreateBookingNotifier(this._bookingRepository, this._serviceRepository,
      this._paymentsRepository, this._serviceMasterRepository)
      : super(const CreateBookingState());

  Future<void> createBooking(
    BuildContext context, {
    ValueChanged<List<BookingData>?>? created,
    VoidCallback? onError,
    DateTime? date,
  }) async {
    final payment = state.payments?.firstWhere(
        (element) => element.id == state.selectPayment,
        orElse: () => PaymentData());
    final wallet = state.selectUser?.wallet?.price ?? 0;
    if (payment?.tag == "wallet" &&
        wallet < (state.calculate?.totalPrice ?? 0)) {
      AppHelpers.errorSnackBar(
        context,
        text: AppHelpers.getTranslation(TrKeys.notEnoughMoney),
      );
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _bookingRepository.createBooking(
        serviceMasters: state.selectMasters.values.toList(),
        startDate: date,
        userId: state.selectUser?.id,
        paymentId: payment?.id);
    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          selectServices: [],
          selectUser: null,
        );
        created?.call(data.data);
      },
      failure: (failure, status) {
        debugPrint('===> create booking fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
        onError?.call();
      },
    );
  }

  checkTime({
    required BuildContext context,
    DateTime? startTime,
  }) async {
    state = state.copyWith(isLoading: true);

    final res = await _bookingRepository.checkTime(
      serviceId: state.selectMasters.values
          .map((e) => e.serviceMaster?.id ?? 0)
          .toList(),
      start: startTime ?? DateTime.now(),
    );
    res.when(success: (data) async {
      state = state.copyWith(
        isLoading: false,
        listDate: data.data ?? [],
        selectDateTime: DateTime.now(),
      );
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  selectBookingTime(String time) {
    state = state.copyWith(selectBookTime: time);
  }

  setUser(UserData user) {
    state = state.copyWith(selectUser: user);
  }

  selectExtraIndex(ServiceExtrasData? extra) {
    if (extra == null) return;
    List<ServiceExtrasData> extras = List.from(state.selectExtras);
    if (extras.any((e) => e.id == extra.id)) {
      extras.removeWhere((e) => e.id == extra.id);
    } else {
      extras.add(extra);
    }
    state = state.copyWith(selectExtras: extras);
  }

  selectDateTime(DateTime? date) {
    state = state.copyWith(selectDateTime: date);
  }

  selectPayment(int id) {
    state = state.copyWith(selectPayment: id);
  }

  calculateBooking({required BuildContext context, DateTime? date}) async {
    state = state.copyWith(isLoading: true);
    final res = await _bookingRepository.calculateBooking(
      serviceMasters: state.selectMasters,
      startDate: date,
      userId: state.selectUser?.id,
    );
    res.when(success: (success) async {
      state = state.copyWith(isLoading: false, calculate: success.data);
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  void clearSelect() {
    state = state.copyWith(
      selectServices: [],
      selectMasters: {},
    );
  }

  void setSelectedService({
    required ServiceData? service,
    ServiceExtrasData? extra,
    ValueChanged<List<ServiceData>>? onChange,
  }) {
    List<ServiceData> list = List.from(state.selectServices);
    if (extra != null) {
      List<ServiceExtrasData> extras = List.from(state.selectExtras);
      if (extras.any((e) => e.id == extra.id)) {
        extras.removeWhere((e) => e.id == extra.id);
      } else {
        extras.add(extra);
      }
      int index = list.map((e) => e.id).toList().indexOf(service?.id ?? 0);
      list[index] = list[index].copyWith(selectExtras: extras);
      state = state.copyWith(selectServices: list, selectExtras: extras);
      onChange?.call(list);
      return;
    }
    if (service == null) return;
    if (list.any((e) => e.id == service.id)) {
      list.removeWhere((e) => e.id == service.id);
    } else {
      list.add(service);
    }
    onChange?.call(list);
    state = state.copyWith(selectServices: list);
  }

  void setAllSelectedExtras(int? serviceId) {
    int index = state.selectServices.indexWhere((e) => e.id == serviceId);
    final extras =
        index == -1 ? null : state.selectServices[index].selectExtras;
    state = state.copyWith(selectExtras: extras ?? []);
  }

  void addNote({required String? note, required int index}) {
    List<ServiceData> list = List.from(state.selectServices);
    list[index] = list[index].copyWith(note: note);
    state = state.copyWith(selectServices: list);
  }

  void addAddress({required String? address, required int index}) {
    List<ServiceData> list = List.from(state.selectServices);
    list[index] = list[index].copyWith(address: address);
    state = state.copyWith(selectServices: list);
  }

  Future<void> fetchServices({
    required BuildContext context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(services: [], isLoading: true);
    }
    ApiResult<ServicePaginateResponse> res;
    if (AppHelpers.getUserRole == TrKeys.master) {
      res = await _serviceMasterRepository.getServices(
          page: ++_page, active: true);
    } else {
      res = await _serviceRepository.getServices(page: ++_page, active: true);
    }
    res.when(success: (data) {
      List<ServiceData> list = List.from(state.services);
      List<ServiceData> services;
      if (AppHelpers.getUserRole == TrKeys.master) {
        services = (data.data?.map(
                    (e) => e.copyWith(translation: e.service?.translation)) ??
                [])
            .toList();
      } else {
        services = data.data ?? [];
      }
      list.addAll(services);
      state = state.copyWith(isLoading: false, services: list);
      if (isRefresh ?? false) {
        controller?.refreshCompleted();
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

  selectMaster({int? serviceId, UserData? master}) {
    Map<int, UserData> maps = Map.from(state.selectMasters);
    List<ServiceData> service = List.from(state.selectServices);
    final extra = service.firstWhere((e) => e.id == serviceId).selectExtras;
    master = master?.copyWith(
        serviceMaster: master.serviceMaster?.copyWith(selectExtras: extra));
    maps.addAll({serviceId ?? 0: master ?? UserData()});
    state = state.copyWith(selectMasters: maps);
  }

  clearMaster() {
    state = state.copyWith(selectMasters: {});
  }

  selectAllMaster() {
    List<ServiceData> service = List.from(state.selectServices);
    Map<int, UserData> maps = {};
    for (var element in service) {
      maps[element.id ?? 0] = UserData(serviceMaster: element);
    }
    state = state.copyWith(selectMasters: maps);
  }

  Future<void> fetchPayments() async {
    state = state.copyWith(isPaymentLoading: true);
    final response = await _paymentsRepository.getPayments();
    response.when(
      success: (data) {
        final List<PaymentData> payments = data.data ?? [];
        List<PaymentData> filtered = [];
        if (AppHelpers.getUserRole != TrKeys.master) {
          for (final payment in payments) {
            if (payment.tag?.toLowerCase() == 'wallet' ||
                payment.tag?.toLowerCase() == 'cash') {
              filtered.add(payment);
            }
          }
        } else {
          final list = payments.where((e) => e.tag?.toLowerCase() == 'cash');
          if (list.isNotEmpty) {
            filtered.add(list.first);
          }
        }
        state = state.copyWith(
          payments: filtered,
          isPaymentLoading: false,
        );
      },
      failure: (error, status) {
        debugPrint('====> fetch payments fail $error');
        state = state.copyWith(isPaymentLoading: false);
      },
    );
  }
}
