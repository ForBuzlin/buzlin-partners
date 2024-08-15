import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/data/gift_card_data.dart';
part 'gift_card_state.freezed.dart';

@freezed
class GiftCardState with _$GiftCardState {
  const factory GiftCardState({
    @Default(false) bool isLoading,
    @Default([]) List<GiftCardData> list,
  }) = _GiftCardState;

  const GiftCardState._();
}
