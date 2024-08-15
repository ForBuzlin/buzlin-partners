import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'discount_state.freezed.dart';

@freezed
class DiscountState with _$DiscountState {
  const factory DiscountState({
    @Default(false) bool isLoading,
    @Default([]) List<DiscountData> discounts,
  }) = _DiscountState;

  const DiscountState._();
}
