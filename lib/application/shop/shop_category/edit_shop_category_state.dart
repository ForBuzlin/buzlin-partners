import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_shop_category_state.freezed.dart';

@freezed
class EditShopCategoryState with _$EditShopCategoryState {
  const factory EditShopCategoryState({
    @Default(false) bool isLoading,
    @Default([]) List<ShopCategoryData> shopCategories,
    int? activeIndex,
    TextEditingController? shopCategoryController,
    ShopCategoryData? shopCategoryData,
  }) = _EditShopCategoryState;

  const EditShopCategoryState._();
}
