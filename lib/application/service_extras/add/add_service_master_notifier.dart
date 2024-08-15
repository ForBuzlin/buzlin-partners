import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'add_service_master_state.dart';

class AddServiceExtrasNotifier extends StateNotifier<AddServiceExtrasState> {
  final ServiceExtrasFacade _serviceRepository;

  AddServiceExtrasNotifier(this._serviceRepository)
      : super(const AddServiceExtrasState());

  void changeActive(bool? active) {
    state = state.copyWith(active: !state.active);
  }

  void clear() {
    state = state.copyWith(active: true, isLoading: false,imageFile: null);
  }

  void setImageFile(String? file) {
    state = state.copyWith(imageFile: file);
  }

  Future<void> createService(
    BuildContext context, {
    required ServiceExtraRequest request,
    ValueChanged<ServiceExtrasData?>? created,
    VoidCallback? onError,
  }) async {
    state = state.copyWith(isLoading: true);
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
    final response = await _serviceRepository.createExtras(
      request: request.copyWith(img: imageUrl),
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
