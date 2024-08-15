import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_masters_state.freezed.dart';

@freezed
class BookingMastersState with _$BookingMastersState {
  const factory BookingMastersState({
    @Default(false) bool isLoading,
    @Default([]) List<UserData> users,
  }) = _BookingMastersState;

  const BookingMastersState._();
}
