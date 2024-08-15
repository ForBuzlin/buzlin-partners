import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'shop_socials_state.freezed.dart';

@freezed
class ShopSocialsState with _$ShopSocialsState {
  const factory ShopSocialsState({
    @Default(false) bool isSocialLoading,
    List<SocialData>? socialData,
    @Default([]) List<TextEditingController> socialControllers,
    @Default([]) List<TextEditingController> socialTypesController,
  }) = _ShopSocialsState;

  const ShopSocialsState._();
}
