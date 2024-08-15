// ignore_for_file: sdk_version_since
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'edit_food_brand_state.dart';

class EditFoodBrandNotifier extends StateNotifier<EditFoodBrandState> {
  EditFoodBrandNotifier()
      : super(EditFoodBrandState(brandController: TextEditingController()));

  void setActiveIndex(int index) {
    if (state.activeIndex == index) {
      return;
    }
    state = state.copyWith(activeIndex: index);
    state.brandController?.text = state.brands[index].title ?? '';
  }

  void setFoodBrand(Brand? brand) {
    state = state.copyWith(brand: brand, activeIndex: -1);
    state.brandController?.text = brand?.title ?? '';
  }

  void setBrands(List<Brand> brands) {
    final index = brands.indexWhere((element) => element.id == state.brand?.id);
    state = state.copyWith(brands: brands, activeIndex: index);
  }
}
