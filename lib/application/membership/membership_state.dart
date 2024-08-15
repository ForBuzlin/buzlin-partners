import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'membership_state.freezed.dart';

@freezed
class MembershipState with _$MembershipState {
  const factory MembershipState({
    @Default(false) bool isLoading,
    @Default([]) List<MembershipData> list,
  }) = _MembershipState;

  const MembershipState._();
}
