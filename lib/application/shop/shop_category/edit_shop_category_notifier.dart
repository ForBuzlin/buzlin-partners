import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'edit_shop_category_state.dart';

class EditShopCategoryNotifier extends StateNotifier<EditShopCategoryState> {
  final UsersFacade _usersRepository;

  EditShopCategoryNotifier(this._usersRepository)
      : super(EditShopCategoryState(
            shopCategoryController: TextEditingController()));

  void setShopCategory(ShopCategoryData? shopCategoryData) {
    state = state.copyWith(shopCategoryData: shopCategoryData);
    state.shopCategoryController?.text =
        shopCategoryData?.translation?.title ?? '';
  }

  // void initial() {
  //   state.shopCategoryController?.text = LocalStorage.getShop()?.categories !=
  //           null
  //       ? LocalStorage.getShop()!.categories!.isNotEmpty
  //           ? LocalStorage.getShop()!.categories!.first.translation?.title ?? ""
  //           : ""
  //       : "";
  // }

  Future<void> fetchCategory({VoidCallback? afterFetched}) async {
    final response = await _usersRepository.getCategory();
    response.when(
      success: (data) {
        if (data.data != null && data.data!.isNotEmpty) {
          List<ShopCategoryData> shopCategories1 = List.from(data.data!);
          state = state.copyWith(shopCategories: shopCategories1);
        }

        afterFetched?.call();
      },
      failure: (failure, status) {
        afterFetched?.call();
        debugPrint('==> error with fetching my shop $failure');
      },
    );
  }

  void setActiveIndex(int index) {
    if (state.activeIndex == index) {
      return;
    }
    final newShopCategory = state.shopCategories[index];
    state =
        state.copyWith(activeIndex: index, shopCategoryData: newShopCategory);
    state.shopCategoryController?.text =
        newShopCategory.translation?.title ?? '';
  }
}
