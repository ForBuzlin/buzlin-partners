import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_booking_state.freezed.dart';

@freezed
class EditBookingState with _$EditBookingState {
  const factory EditBookingState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    BookingData? bookingData,
  }) = _EditBookingState;

  const EditBookingState._();
}
