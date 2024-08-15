import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'edit_food_details_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EditFoodDetailsNotifier extends StateNotifier<EditFoodDetailsState> {
  final ProductsFacade _productsRepository;
  final SettingsFacade _settingsRepository;

  EditFoodDetailsNotifier(this._productsRepository, this._settingsRepository)
      : super(const EditFoodDetailsState());

  void setTax(String value) {
    state = state.copyWith(tax: value.trim());
  }

  void setMaxQty(String value) {
    state = state.copyWith(maxQty: value.trim());
  }

  void setMinQty(String value) {
    state = state.copyWith(minQty: value.trim());
  }

  void setActive(bool value) {
    state = state.copyWith(active: !state.active);
  }

  void setInterval(String value) {
    state = state.copyWith(interval: value.trim());
  }

  void setDesc() {
    Map<String, List<String>> temp = Map.from(state.mapOfDesc);
    if (temp.containsKey(state.language?.locale)) {
      List<String> list = [state.title, state.description];
      temp.update(
          state.language?.locale ?? LocalStorage.getLanguage()?.locale ?? 'en',
          (value) => list);
    } else {
      List<String> list = [state.title, state.description];
      temp[state.language?.locale ??
          LocalStorage.getLanguage()?.locale ??
          "en"] = list;
    }
    state = state.copyWith(
      mapOfDesc: temp,
    );
  }

  void setTitleAndDescState(String key) {
    state = state.copyWith(
        title: state.mapOfDesc[key]?.first ?? "",
        description: state.mapOfDesc[key]?.last ?? "");
  }

  Future<void> getProductDetailsByIdEdited(
      ValueChanged<ProductData?> onSuccess) async {
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository
        .getProductDetailsEdited(state.product?.uuid ?? "");
    response.when(
      success: (data) async {
        final List<Stocks> stocks = data.data?.stocks ?? <Stocks>[];
        state = state.copyWith(
          product: data.data,
          minQty: "${data.data?.minQty ?? '0'}",
          maxQty: "${data.data?.maxQty ?? ''}",
          tax: "${data.data?.tax ?? '0'}",
          title: data.data?.translation?.title ??
              AppHelpers.getTranslation(TrKeys.noName),
          description: data.data?.translation?.description ?? '',
          active: data.data?.active ?? false,
          digital: data.data?.digital ?? false,
          interval: "${data.data?.interval ?? '1'}",
          listOfUrls: data.data?.galleries ?? [],
          isLoading: false,
        );
        if (data.data?.translations != null) {
          Map<String, List<String>> temp = Map.from(state.mapOfDesc);
          var items = data.data?.translations;
          for (int i = 0; i < data.data!.translations!.length; i++) {
            temp[items?[i].locale ?? "en"] = [
              items?[i].title ?? '',
              items?[i].description ?? ''
            ];
          }
          state = state.copyWith(mapOfDesc: temp);
        }
        onSuccess(data.data);
        if (stocks.isNotEmpty) {
          // final int groupsCount = stocks[0].extras?.length ?? 0;
          // final List<int> selectedIndexes = List.filled(groupsCount, 0);
          // setSelectedIndexes(selectedIndexes);
        }
      },
      failure: (failure, s) {
        debugPrint('==> get product details failure: $failure');
      },
    );
  }

  void setDigital(bool value) {
    state = state.copyWith(digital: !state.digital);
  }

  void setAgeLimit(String value) {
    state = state.copyWith(ageLimit: state.ageLimit);
  }

  Future<void> updateProduct(
    BuildContext context, {
    UnitData? unit,
    CategoryData? category,
    Brand? brand,
    Function(ProductData?)? updated,
    VoidCallback? failed,
  }) async {
    setProduct();
    setDesc();
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
          debugPrint('==> upload product image fail: $failure');
       AppHelpers.errorSnackBar(context, text: failure);
          state = state.copyWith(isLoading: true);
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
    final response = await _productsRepository.updateProduct(
        titlesAndDescriptions: state.mapOfDesc,
        tax: state.tax,
        maxQty: state.maxQty,
        minQty: state.minQty,
        active: state.active,
        digital: state.digital,
        ageLimit: state.ageLimit,
        categoryId: category?.id,
        unitId: unit?.id,
        brandId: brand?.id,
        images: imageUrl,
        interval: state.interval,
        uuid: state.product?.uuid,
        previews: previews);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        final updatedTranslation = state.product?.translation?.copyWith(
          title: state.title,
          description: state.description,
        );
        final updatedProduct = state.product?.copyWith(
          translation: updatedTranslation,
          tax: num.tryParse(state.tax),
          maxQty: int.tryParse(state.maxQty),
          minQty: int.tryParse(state.minQty),
          barcode: state.barcode,
          active: state.product?.active ?? false,
          categoryId: category?.id,
          category: category,
          interval: num.tryParse(state.interval),
          unit: unit,
          // img: imageUrl,
        );
        updated?.call(updatedProduct);
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
        state = state.copyWith(isLoading: false);
        debugPrint('===> product update fail $failure');
        failed?.call();
      },
    );
  }

  void setDescription(String value) {
    state = state.copyWith(description: value.trim());
  }

  void setTitle(String value) {
    state = state.copyWith(title: value.trim());
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
    List<Galleries> urls = List.from(state.listOfUrls);
    urls.removeWhere((element) => element.path == value);
    state = state.copyWith(images: list, listOfUrls: urls);
  }

  Future<void> setProductDetails(
      ProductData? product, ValueChanged<ProductData?> onSuccess) async {
    state = state.copyWith(
      product: product,
      minQty: "${product?.minQty ?? '0'}",
      maxQty: "${product?.maxQty ?? ''}",
      tax: "${product?.tax ?? '0'}",
      title: product?.translation?.title ??
          AppHelpers.getTranslation(TrKeys.noName),
      description: product?.translation?.description ?? '',
      active: product?.active ?? false,
      digital: product?.digital ?? false,
      interval: "${product?.interval ?? '1'}",
      listOfUrls: state.listOfUrls,
      images: [],
    );
    await getProductDetailsByIdEdited(onSuccess);
  }

  setProduct() {
    state = state.copyWith(
      product: state.product?.copyWith(
        digital: state.digital,
        active: state.active,
        interval: num.tryParse(state.interval),
      ),
    );
  }

  setStocks(List<Stocks>? stocks) {
    state = state.copyWith(product: state.product?.copyWith(stocks: stocks));
  }
}
