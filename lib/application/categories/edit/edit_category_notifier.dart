import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'edit_category_state.dart';

class EditCategoryNotifier extends StateNotifier<EditCategoryState> {
  final CatalogFacade _catalogRepository;
  final SettingsFacade _settingsRepository;

  EditCategoryNotifier(this._catalogRepository, this._settingsRepository)
      : super(const EditCategoryState());

  void changeActive(bool? active) {
    state = state.copyWith(active: !state.active);
  }

  Future<void> updateCategory(
    BuildContext context, {
    required int? parentId,
    String? type,
    CategoryData? category,
    VoidCallback? updated,
    VoidCallback? failed,
  }) async {
    state = state.copyWith(isUpdate: true);
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
          debugPrint('==> upload category image fail: $failure');
          AppHelpers.errorSnackBar(context, text: failure);
        },
      );
    }
    final response = await _catalogRepository.updateCategory(
        title: state.title,
        description: state.description,
        active: state.active,
        id: state.category?.uuid ?? "0",
        image: imageUrl,
        parentId: parentId,
        input: int.tryParse(state.input),
        type: type ?? state.category?.type);
    response.when(
      success: (data) {
        state = state.copyWith(imageFile: null);
        state = state.copyWith(isUpdate: false);
        updated?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(isUpdate: false);
        // AppHelperss.showCheckTopSnackBar(context,
        //     text: fail, type: SnackBarType.error);

        debugPrint('===> category update fail $failure');
        failed?.call();
      },
    );
  }

  void setTitle(String value) {
    state = state.copyWith(title: value.trim());
  }

  void setInput(String value) {
    state = state.copyWith(input: value.trim());
  }

  void setDescription(String value) {
    state = state.copyWith(description: value.trim());
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

  Future<void> setCategoryDetails(
      CategoryData? category, ValueChanged<CategoryData?> onSuccess) async {
    state = state.copyWith(
        category: category,
        title: category?.translation?.title ?? '',
        active: category?.active ?? false,
        listOfUrls: state.listOfUrls,
        images: []);
    showCategory(onSuccess);
  }

  showCategory(ValueChanged<CategoryData?> onSuccess) async {
    state = state.copyWith(isLoading: true);
    final res =
        await _catalogRepository.fetchSingleCategory(state.category?.uuid);
    res.when(success: (data) {
      state = state.copyWith(category: data.data, isLoading: false);
      onSuccess.call(data.data);
    }, failure: (error, statusCode) {
      state = state.copyWith(isLoading: false);
      debugPrint("show category fail ==> $error");
    });
  }
}
