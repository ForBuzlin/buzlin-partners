import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'membership_state.dart';
import 'membership_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final membershipProvider =
    StateNotifierProvider<MembershipNotifier, MembershipState>(
  (ref) => MembershipNotifier(membershipRepository),
);
