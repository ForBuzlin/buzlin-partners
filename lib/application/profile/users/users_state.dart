import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/models/response/get_profile_info_response.dart';

part 'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState({
    String? imageFile,
    TextEditingController? birthday,
    String? gender,
    GetProfileInfoResponse? getProfileInfoResponse,
    @Default([]) List<UserData> users,
    @Default(false) bool isLoading,
    UserData? selectedUser,
  }) = _UsersState;

  const UsersState._();
}
