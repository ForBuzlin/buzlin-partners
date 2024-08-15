import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/app_helpers.dart';
import 'edit_service_master_state.dart';

class EditServiceMasterNotifier extends StateNotifier<EditServiceMasterState> {
  final ServiceMasterFacade _serviceRepository;

  EditServiceMasterNotifier(this._serviceRepository)
      : super(const EditServiceMasterState());

  void changeActive(bool? active) {
    state = state.copyWith(active: !state.active);
  }

  Future<void> fetchServiceDetails({
    required BuildContext context,
    required int? id,
    required ValueChanged<ServiceData?>? onSuccess,
  }) async {
    state = state.copyWith(isLoading: true);
    final res = await _serviceRepository.fetchSingleService(id);
    res.when(success: (data) {
      state = state.copyWith(
        isLoading: false,
        serviceData: data.data,
      );
      onSuccess?.call(data.data);
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> updateService(
    BuildContext context, {
    required String price,
    required String discount,
    required String commissionFee,
    required String pause,
    required String interval,
    required int serviceId,
    required int masterId,
    ValueChanged<ServiceData?>? updated,
    VoidCallback? failed,
  }) async {
    state=state.copyWith(isUpdating: true);
    final response = await _serviceRepository.updateService(
        price: num.tryParse(price) ?? 0,
        pause: int.tryParse(pause) ?? 0,
        interval: int.tryParse(interval) ?? 0,
        serviceId: serviceId,
        masterId: masterId,
        id: state.serviceData?.id,
        discount: num.tryParse(discount) ?? 0,
        commissionFee: num.tryParse(commissionFee) ?? 0);
    response.when(
      success: (data) {
        state = state.copyWith(isUpdating: false);
        updated?.call(data.data);
      },
      failure: (fail, status) {
        AppHelpers.errorSnackBar(
          context,
          text: fail,
        );
        state = state.copyWith(isUpdating: false);
        debugPrint('===> service update fail $fail');
        failed?.call();
      },
    );
  }

  Future<void> setDetails(ServiceData? serviceData) async {
    state = state.copyWith(serviceData: serviceData);
  }
}
