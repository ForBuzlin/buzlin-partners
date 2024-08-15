import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'edit_service_master_state.dart';

class EditServiceExtrasNotifier extends StateNotifier<EditServiceExtrasState> {
  final ServiceExtrasFacade _serviceRepository;

  EditServiceExtrasNotifier(this._serviceRepository)
      : super(const EditServiceExtrasState());

  void changeActive(bool? active) {
    state = state.copyWith(active: !state.active);
  }

  void setImageFile(String? file) {
    state = state.copyWith(imageFile: file);
  }

  Future<void> fetchServiceDetails({
    required BuildContext context,
    required int? id,
    required ValueChanged<ServiceExtrasData?>? onSuccess,
  }) async {
    state = state.copyWith(isLoading: true);
    final res = await _serviceRepository.fetchSingleExtras(id);
    res.when(success: (data) {
      state = state.copyWith(
        isLoading: false,
        extrasData: data.data,
      );
      onSuccess?.call(data.data);
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> updateService(
    BuildContext context, {
    required ServiceExtraRequest request,
    ValueChanged<ServiceExtrasData?>? updated,
    VoidCallback? failed,
  }) async {
    state = state.copyWith(isUpdating: true);
    String? imageUrl;
    if (state.imageFile != null) {
      final imageResponse = await settingsRepository.uploadImage(
        state.imageFile!,
        UploadType.extras,
      );
      imageResponse.when(
        success: (data) {
          imageUrl = data.imageData?.title;
        },
        failure: (failure, status) {
          debugPrint('==> upload extras image fail: $failure');
          AppHelpers.errorSnackBar(context, text: failure);
        },
      );
    }
    final response = await _serviceRepository.updateExtras(
      id: state.extrasData?.id,
      request: request.copyWith(img: imageUrl ?? state.extrasData?.img),
    );
    response.when(
      success: (data) {
        state = state.copyWith(isUpdating: false);
        updated?.call(data.data);
      },
      failure: (fail, status) {
        AppHelpers.errorSnackBar(context, text: fail);
        state = state.copyWith(isUpdating: false);
        debugPrint('===> service update fail $fail');
        failed?.call();
      },
    );
  }

  Future<void> setDetails(ServiceExtrasData? extrasData) async {
    state = state.copyWith(
      extrasData: extrasData,
      imageFile: null,
      isUpdating: false,
      isLoading: false,
    );
  }
}
