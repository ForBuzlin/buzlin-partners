import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'wallet_state.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState({
    @Default(false) bool isTransactionLoading,
    @Default(false) bool isButtonLoading,
    @Default(false) bool isSearchingLoading,
    @Default(1) int selectPayment,
    @Default([]) List<PaymentData>? list,
    @Default(null) String? selectMethodLink,
    @Default([]) List<UserData>? listOfUser,
    @Default(false) bool isMaksekeskusLoading,
    @Default(null) MaksekeskusData? maksekeskus,
    @Default([]) List<TransactionModel> transactions,
  }) = _WalletState;
}
