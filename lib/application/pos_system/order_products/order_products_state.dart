import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'order_products_state.freezed.dart';

@freezed
class OrderProductsState with _$OrderProductsState {
  const factory OrderProductsState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdate,
    @Default([]) List<ProductData> products,
  }) = _OrderProductsState;

  const OrderProductsState._();
}
