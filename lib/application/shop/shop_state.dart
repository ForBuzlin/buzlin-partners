import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'shop_state.freezed.dart';

@freezed
class ShopState with _$ShopState {
  const factory ShopState({
    @Default(false) bool isLoading,
    String? backgroundImageFile,
    String? logoImageFile,
    ShopData? shop,
    int? categoryId,
  }) = _ShopState;

  const ShopState._();
}
