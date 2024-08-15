import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'create_category_state.dart';

class CreateCategoryNotifier extends StateNotifier<CreateCategoryState> {
  final CatalogFacade _catalogFacade;
  final SettingsFacade _settingsRepository;

  CreateCategoryNotifier(
    this._catalogFacade,
    this._settingsRepository,
  ) : super(const CreateCategoryState());

  void changeActive(bool? active) {
    state = state.copyWith(active: !state.active);
  }

  void setCategory(CategoryData category) {
    state = state.copyWith(
        category: category,
        active: category.active ?? true,
        title: category.translation?.title ??
            AppHelpers.getTranslation(TrKeys.noName));
  }

  void clear() {
    state = state.copyWith(
      category: null,
      active: true,
      imageFile: null,
      isLoading: false,
    );
  }

  Future<void> createCategory(
    BuildContext context, {
    required int? parentId,
    String? type,
    VoidCallback? created,
    VoidCallback? onError,
  }) async {
    state = state.copyWith(isLoading: true);
    String? imageUrl;
    if (state.imageFile != null) {
      final imageResponse = await _settingsRepository.uploadImage(
        state.imageFile!,
        UploadType.brands,
      );
      imageResponse.when(
        success: (data) {
          imageUrl = data.imageData?.title;
        },
        failure: (failure, status) {
          debugPrint('==> upload product image fail: $failure');
          AppHelpers.errorSnackBar(context, text: failure);
        },
      );
    }
    final response = await _catalogFacade.createCategory(
      active: state.active,
      image: imageUrl,
      title: state.title,
      description: state.description,
      parentId: parentId,
      type: type,
      input: int.tryParse(state.input),
    );
    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
        );
        created?.call();
      },
      failure: (failure, status) {
        debugPrint('===> create product fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);

        onError?.call();
      },
    );
  }

  void setActive(bool? value) {
    state = state.copyWith(active: !state.active);
    debugPrint('===> set active ${state.active}');
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
}
