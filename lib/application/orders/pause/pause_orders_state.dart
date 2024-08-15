import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'pause_orders_state.freezed.dart';

@freezed
class PauseOrdersState with _$PauseOrdersState {
  const factory PauseOrdersState({
    @Default(false) bool isLoading,
    @Default([]) List<OrderData> orders,
    @Default(0) int totalCount,
  }) = _PauseOrdersState;

  const PauseOrdersState._();
}
