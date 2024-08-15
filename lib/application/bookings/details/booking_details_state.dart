import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'booking_details_state.freezed.dart';

@freezed
class BookingDetailsState with _$BookingDetailsState {
  const factory BookingDetailsState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    @Default(false) bool isUpdateNote,
    @Default(0) int selectedIndex,
    @Default(null) BookingData? bookingData,
  }) = _BookingDetailsState;

  const BookingDetailsState._();
}
