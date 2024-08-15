import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

import 'create_food_details_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class CreateFoodDetailsNotifier extends StateNotifier<CreateFoodDetailsState> {
  final ProductsFacade _productsRepository;
  final SettingsFacade _settingsRepository;

  CreateFoodDetailsNotifier(
    this._productsRepository,
    this._settingsRepository,
  ) : super(const CreateFoodDetailsState());

  void updateAddFoodInfo() {
    state = state.copyWith(
      images: [],
      title: '',
      description: '',
      minQty: '',
      maxQty: '',
      tax: '',
      qrcode: '',
      interval: '',
      active: false,
      createdProduct: null,
    );
  }

  setStocks(List<Stocks>? stocks) {
    state = state.copyWith(createdProduct: state.createdProduct?.copyWith(stocks: stocks));
  }
  Future<void> createProduct(
    BuildContext context, {
    int? categoryId,
    int? unitId,
    int? brandId,
    VoidCallback? created,
    VoidCallback? onError,
  }) async {
    state = state.copyWith(isCreating: true);
    List<String> imageUrl = List.from(state.listOfUrls.map((e) => e.path));
    if (state.images.isNotEmpty) {
      final imageResponse = await _settingsRepository.uploadMultiImage(
        state.images,
        UploadType.products,
      );
      imageResponse.when(
        success: (data) {
          imageUrl = data.data?.title ?? [];
        },
        failure: (failure, status) {
          debugPrint('==> upload product image fail: $failure');
       AppHelpers.errorSnackBar(context, text: failure);
        },
      );
    }

    List<Galleries> tempList = List.from(List.from(state.listOfUrls)
        .where((element) => element.preview != null));
    List<String> previews = [];
    for (var element in tempList) {
      if (element.preview?.isNotEmpty ?? false) {
        previews.add(element.preview!);
      }
    }

    final response = await _productsRepository.createProduct(
      title: state.title,
      description: state.description,
      tax: state.tax,
      minQty: state.minQty,
      maxQty: state.maxQty,
      active: state.active,
      categoryId: categoryId,
      unitId: unitId,
      brandId: brandId,
      image: imageUrl,
      interval: state.interval,
      ageLimit: state.ageLimit,
      digital: state.digital,
      previews: previews,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isCreating: false, createdProduct: data.data);
        created?.call();
      },
      failure: (failure, status) {
        debugPrint('===> create product fail $failure');
        state = state.copyWith(isCreating: false);
        AppHelpers.errorSnackBar(context, text: failure);
        onError?.call();
        // clearAll();
      },
    );
  }

  void setInterval(String value) {
    state = state.copyWith(interval: value.trim());
  }

  void setActive(bool value) {
    state = state.copyWith(active: !state.active);
  }

  void setDigital(bool value) {
    state = state.copyWith(digital: !state.digital);
  }

  void setMaxQty(String value) {
    state = state.copyWith(maxQty: value.trim());
  }

  void setMinQty(String value) {
    state = state.copyWith(minQty: value.trim());
  }

  void setTax(String value) {
    state = state.copyWith(tax: value.trim());
  }

  void setDescription(String value) {
    state = state.copyWith(description: value.trim());
  }

  void setTitle(String value) {
    state = state.copyWith(title: value.trim());
  }

  void setAgeLimit(String value) {
    state = state.copyWith(ageLimit: value);
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

  void deleteImage(String value) {
    List<String> list = List.from(state.images);
    list.remove(value);
    state = state.copyWith(images: list);
  }

  void clearAll() {
    state = state.copyWith(
      images: [],
      title: '',
      listOfUrls: [],
      ageLimit: '0',
      description: '',
      digital: false,
      active: true,
      interval: '1',
      tax: '0',
      maxQty: '',
      minQty: '1',
    );
  }
}
