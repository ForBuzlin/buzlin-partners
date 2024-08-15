import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'add_service_state.dart';

class AddServiceNotifier extends StateNotifier<AddServiceState> {
  final ServiceFacade _serviceRepository;
  final SettingsFacade _settingsRepository;

  AddServiceNotifier(this._serviceRepository, this._settingsRepository)
      : super(const AddServiceState());
  String type = '';
  String gender = '';

  void setActive(bool? value) {
    state = state.copyWith(active: !state.active);
  }

  void clear() {
    state = state.copyWith(
      active: false,
      images: [],
      listOfUrls: [],
      isLoading: false,
    );
  }

  void setType(String value) => type = value;

  void setGender(String value) => gender = value;

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

  Future<void> createService(
    BuildContext context, {
    required String price,
    required String pause,
    required String interval,
    required String title,
    required int categoryId,
    String? description,
    ValueChanged<ServiceData?>? created,
    VoidCallback? onError,
  }) async {
    if (type.isEmpty) {
      AppHelpers.errorSnackBar(context,
          text: AppHelpers.getTranslation(TrKeys.typeIsNotEmpty));
      return;
    }
    if (gender.isEmpty) {
      AppHelpers.errorSnackBar(context,
          text: AppHelpers.getTranslation(TrKeys.genderIsNotEmpty));
      return;
    }
    state = state.copyWith(isLoading: true);
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
    final response = await _serviceRepository.createService(
      images: imageUrl,
      title: title,
      description: description,
      price: num.tryParse(price) ?? 0,
      pause: int.tryParse(pause) ?? 0,
      interval: int.tryParse(interval) ?? 0,
      categoryId: categoryId,
      type: type,
      gender: gender,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, serviceData: data.data);
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
