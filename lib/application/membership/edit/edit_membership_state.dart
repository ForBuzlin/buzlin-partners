import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_membership_state.freezed.dart';

@freezed
class EditMembershipState with _$EditMembershipState {
  const factory EditMembershipState({
    @Default([]) List<ServiceData> services,
    @Default(false) bool isLoading,
    MembershipData? membership,
  }) = _EditMembershipState;

  const EditMembershipState._();
}
