import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_state.freezed.dart';

@freezed
class CreateUserState with _$CreateUserState {
  const factory CreateUserState(
      {@Default(false) bool isLoading,
      @Default(null) String? imageFile}) = _CreateUserState;

  const CreateUserState._();
}
