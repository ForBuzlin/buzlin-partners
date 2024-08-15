import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

part 'products_filter_state.freezed.dart';

@freezed
class ProductsFilterState with _$ProductsFilterState {
  const factory ProductsFilterState({
    @Default(LayoutType.twoV) LayoutType selectType,
    @Default(true) bool isLoading,
    @Default("category") String type,
    @Default(null) FilterResponse? filter,
    @Default(null) Price? filterPrices,
    @Default([]) List<int>? extras,
    @Default([]) List<int>? categories,
    @Default([]) List<int>? brands,
    @Default([]) List<int> prices,
    @Default(null) RangeValues? rangeValues,
  }) = _ProductsFilterState;
}
