import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'whole_sale_state.freezed.dart';

@freezed
class WholeSaleState with _$WholeSaleState {
  const factory WholeSaleState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default([]) List<Stocks> stocks,
    @Default(null) ProductData? product,
    @Default([]) List<GlobalKey<FormState>> formKeys,
  }) = _WholeSaleState;

  const WholeSaleState._();
}
