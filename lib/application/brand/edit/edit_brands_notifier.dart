import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'edit_brands_state.dart';

class EditBrandsNotifier extends StateNotifier<EditBrandsState> {
  final BrandsFacade _brandsRepository;
  final SettingsFacade _settingsRepository;

  EditBrandsNotifier(this._brandsRepository, this._settingsRepository)
      : super(const EditBrandsState());

  void changeActive(bool? active) {
    state = state.copyWith(active: !state.active);
  }

  Future<void> updateBrand(
    BuildContext context, {
    VoidCallback? updated,
    VoidCallback? failed,
  }) async {
    state = state.copyWith(isLoading: true);
    String? imageUrl;
    if (state.imageFile != null) {
      final imageResponse = await _settingsRepository.uploadImage(
        state.imageFile!,
        UploadType.products,
      );
      imageResponse.when(
        success: (data) {
          imageUrl = data.imageData?.title;
        },
        failure: (failure, status) {
          debugPrint('==> upload brand image fail: $failure');
          AppHelpers.errorSnackBar(context, text: failure);
        },
      );
    }
    final response = await _brandsRepository.updateBrand(
      title: state.title,
      active: state.active,
      id: state.brand?.id ?? 0,
      image: imageUrl,
    );
    response.when(
      success: (data) {
        state = state.copyWith(imageFile: null);
        state = state.copyWith(isLoading: false);
        updated?.call();
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
        state = state.copyWith(isLoading: false);
        debugPrint('===> brand update fail $failure');
        failed?.call();
      },
    );
  }

  void setTitle(String value) {
    state = state.copyWith(title: value.trim());
  }

  void setImageFile(String? file) {
    state = state.copyWith(imageFile: file);
  }

  void deleteImage(String value) {
    List<String> list = List.from(state.images);
    list.remove(value);
    List<Galleries> urls = List.from(state.listOfUrls);
    urls.removeWhere((element) => element.path == value);
    state = state.copyWith(images: list, listOfUrls: urls);
  }

  Future<void> setBrandDetails(
      Brand? brand, ValueChanged<Brand?> onSuccess) async {
    state = state.copyWith(
        brand: brand,
        title: brand?.title ?? '',
        active: brand?.active ?? false,
        listOfUrls: state.listOfUrls,
        images: []);
  }
}
