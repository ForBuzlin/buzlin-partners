import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
  }) = _ProductsState;

  const ProductsState._();
}
