import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'add_service_master_state.dart';

class AddServiceMasterNotifier extends StateNotifier<AddServiceMasterState> {
  final ServiceMasterFacade _serviceRepository;

  AddServiceMasterNotifier(this._serviceRepository)
      : super(const AddServiceMasterState());

  void setActive(bool? value) {
    state = state.copyWith(active: !state.active);
  }

  void clear() {
    state = state.copyWith(
      active: false,
      isLoading: false,
    );
  }

  Future<void> createService(
    BuildContext context, {
    required String price,
    required String pause,
    required String discount,
    required String interval,
    required String commissionFee,
    required int? masterId,
    required int serviceId,
    ValueChanged<ServiceData?>? created,
    VoidCallback? onError,
  }) async {
    state = state.copyWith(isLoading: true);

    final response = await _serviceRepository.createService(
      price: num.tryParse(price) ?? 0,
      commissionFee: num.tryParse(commissionFee) ?? 0,
      discount: num.tryParse(discount) ?? 0,
      pause: int.tryParse(pause) ?? 0,
      interval: int.tryParse(interval) ?? 0,
      masterId: masterId,
      serviceId: serviceId,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        created?.call(data.data);
      },
      failure: (failure, status) {
        debugPrint('===> create service fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
        onError?.call();
      },
    );
  }
}
