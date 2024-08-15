import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'order_status_state.freezed.dart';

@freezed
class OrderStatusState with _$OrderStatusState {
  const factory OrderStatusState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    @Default(null) OrderData? order,
    @Default([]) List<Notes> notes,
    @Default('en') String locale,
    @Default(null) int? editIndex,
     TextEditingController? textEditingController,
  }) = _OrderStatusState;

  const OrderStatusState._();
}
