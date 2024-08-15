import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'create_booking_state.freezed.dart';

@freezed
class CreateBookingState with _$CreateBookingState {
  const factory CreateBookingState({
    @Default(false) bool isLoading,
    @Default(false) bool isPaymentLoading,
    @Default(false) bool isButtonLoading,
    @Default(null) BookingCalculateData? calculate,
    @Default(null) DateTime? selectDateTime,
    @Default(null) String? selectBookTime,
    @Default(null) UserData? selectUser,
    @Default(-1) int selectPayment,
    @Default([]) List<ServiceExtrasData> selectExtras,
    @Default([]) List<EnableDate>? listDate,
    @Default([]) List<PaymentData>? payments,
    @Default([]) List<ServiceData> services,
    @Default([]) List<ServiceData> selectServices,
    @Default({}) Map<int, UserData> selectMasters,
  }) = _CreateBookingState;

  const CreateBookingState._();
}
