import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'add_looks_state.dart';

class AddLooksNotifier extends StateNotifier<AddLooksState> {
  final LooksFacade _looksRepository;
  final SettingsFacade _settingsRepository;

  AddLooksNotifier(this._looksRepository, this._settingsRepository)
      : super(const AddLooksState());

  void setActive(bool? value) {
    state = state.copyWith(active: !state.active);
  }

  void clear() {
    state = state.copyWith(active: true, products: [], imageFile: null);
  }

  void setLookProducts(ProductData product) {
    List<ProductData> list = List.from(state.products);
    if (state.products.any((element) => element.id == product.id)) {
      list.removeWhere((element) => element.id == product.id);
    } else {
      list.add(product);
    }
    state = state.copyWith(products: list);
  }

  void setImageFile(String? file) {
    state = state.copyWith(imageFile: file);
  }

  void deleteFromAddedProducts(int? id) {
    List<ProductData> temp = List.from(state.products);
    temp.removeWhere((element) => element.id == id);
    state = state.copyWith(products: temp);
  }

  Future<void> createLooks(
    BuildContext context, {
    required String title,
    required String description,
    ValueChanged<LooksData?>? created,
    VoidCallback? onError,
  }) async {
    if (state.products.isEmpty) {
      AppHelpers.errorSnackBar(context,
          text: AppHelpers.getTranslation(TrKeys.errorQuantity),
          );
      return;
    }
    state = state.copyWith(isLoading: true);
    String? imageUrl;
    if (state.imageFile != null) {
      final imageResponse = await _settingsRepository.uploadImage(
        state.imageFile!,
        UploadType.discounts,
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
    final response = await _looksRepository.addLooks(
      active: state.active,
      image: imageUrl,
      title: title,
      description: description,
      products: state.products.map((e) => e.id).toList(),
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        created?.call(data.data);
      },
      failure: (failure, status) {
        debugPrint('===> create product fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
        onError?.call();
      },
    );
  }
}
