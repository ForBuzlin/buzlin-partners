import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'add_membership_state.freezed.dart';

@freezed
class AddMembershipState with _$AddMembershipState {
  const factory AddMembershipState({
    @Default([]) List<ServiceData> services,
    @Default(false) bool isLoading,
    MembershipData? membership,
  }) = _AddMembershipState;

  const AddMembershipState._();
}
