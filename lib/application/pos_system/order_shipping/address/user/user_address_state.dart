import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'user_address_state.freezed.dart';

@freezed
class UserAddressState with _$UserAddressState {
  const factory UserAddressState({
    @Default([]) List<MyAddress> list,
    @Default(false) bool isLoading,
  }) = _UserAddressState;

  const UserAddressState._();
}
