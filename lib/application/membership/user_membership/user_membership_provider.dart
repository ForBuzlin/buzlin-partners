import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_membership_state.dart';
import 'user_membership_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final userMembershipProvider =
    StateNotifierProvider<UserMembershipNotifier, UserMembershipState>(
  (ref) => UserMembershipNotifier(membershipRepository),
);
