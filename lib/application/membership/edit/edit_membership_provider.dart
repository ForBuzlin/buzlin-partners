import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'edit_membership_notifier.dart';
import 'edit_membership_state.dart';

final editMembershipProvider =
    StateNotifierProvider<EditMembershipNotifier, EditMembershipState>(
  (ref) => EditMembershipNotifier(membershipRepository),
);
