import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_food_brand_state.freezed.dart';

@freezed
class EditFoodBrandState with _$EditFoodBrandState {
  const factory EditFoodBrandState({
    @Default([]) List<Brand> brands,
    @Default(-1) int activeIndex,
    TextEditingController? brandController,
    @Default(false) bool isLoading,
    Brand? brand,
  }) = _EditFoodBrandState;

  const EditFoodBrandState._();
}
