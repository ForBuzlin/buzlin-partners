import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'edit_service_state.dart';

class EditServiceNotifier extends StateNotifier<EditServiceState> {
  final ServiceFacade _serviceRepository;
  final SettingsFacade _settingsRepository;

  EditServiceNotifier(this._serviceRepository, this._settingsRepository)
      : super(const EditServiceState());

  void changeActive(bool? active) {
    state = state.copyWith(active: !state.active);
  }

  void clear() {
    state = state.copyWith(
      active: false,
      images: [],
      listOfUrls: [],
      isUpdating: false,
    );
  }

  void setType(String value) {
    state = state.copyWith(
      serviceData: state.serviceData?.copyWith(type: value),
    );
  }

  void setGender(String value) {
    state = state.copyWith(
      serviceData: state.serviceData?.copyWith(gender: value),
    );
  }

  void setImageFile(String file) {
    List<String> list = List.from(state.images);
    list.add(file);
    state = state.copyWith(images: list);
  }

  void setUploadImage(Galleries gallery) {
    List<Galleries> list = List.from(state.listOfUrls);
    list.insert(0, gallery);
    state = state.copyWith(listOfUrls: list);
  }

  void setUploadImages(List<Galleries>? galleries) {
    if (galleries?.isEmpty ?? true) return;
    state = state.copyWith(listOfUrls: galleries ?? []);
  }

  void deleteImage(String value) {
    List<String> list = List.from(state.images);
    list.remove(value);
    List<Galleries> urls = List.from(state.listOfUrls);
    urls.removeWhere((element) => element.path == value);
    state = state.copyWith(images: list, listOfUrls: urls);
  }

  Future<void> fetchServiceDetails({
    required BuildContext context,
    required int? id,
    required ValueChanged<ServiceData?>? onSuccess,
  }) async {
    state = state.copyWith(isLoading: true);
    final res = await _serviceRepository.fetchSingleService(id);
    res.when(success: (data) {
      if (!DropDownValues.serviceTypeList.contains(data.data?.type)) {
        data.data = data.data?.copyWith(type: '');
      }
      state = state.copyWith(
          isLoading: false,
          serviceData: data.data,
          listOfUrls: data.data?.galleries ?? []);
      onSuccess?.call(data.data);
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> updateService(
    BuildContext context, {
    required String price,
    required String pause,
    required String interval,
    required String title,
    required int categoryId,
    String? description,
    ValueChanged<ServiceData?>? updated,
    VoidCallback? failed,
  }) async {
    if (state.serviceData?.type?.isEmpty ?? true) {
      AppHelpers.errorSnackBar(context,
          text: AppHelpers.getTranslation(TrKeys.typeIsNotEmpty));
      return;
    }    if (state.serviceData?.gender?.isEmpty ?? true) {
      AppHelpers.errorSnackBar(context,
          text: AppHelpers.getTranslation(TrKeys.genderIsNotEmpty));
      return;
    }
    state = state.copyWith(isUpdating: true);
    List<String> imageUrl = List.from(state.listOfUrls.map((e) => e.path));
    if (state.images.isNotEmpty) {
      final imageResponse = await _settingsRepository.uploadMultiImage(
        state.images,
        UploadType.products,
      );
      imageResponse.when(
        success: (data) {
          imageUrl.addAll(data.data?.title ?? []);
        },
        failure: (failure, status) {
          debugPrint('==> upload service image fail: $failure');
          AppHelpers.errorSnackBar(context, text: failure);
          state = state.copyWith(isLoading: true);
        },
      );
    }
    final response = await _serviceRepository.updateService(
      images: imageUrl,
      title: title,
      description: description,
      price: num.tryParse(price) ?? 0,
      pause: int.tryParse(pause) ?? 0,
      interval: int.tryParse(interval) ?? 0,
      categoryId: categoryId,
      id: state.serviceData?.id,
      type: state.serviceData?.type ?? '',
      gender: state.serviceData?.gender ?? ''
    );
    response.when(
      success: (data) {
        state = state.copyWith(images: [], isUpdating: false);
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
