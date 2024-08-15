import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'reset_password_notifier.dart';
import 'reset_password_state.dart';

final resetPasswordProvider =
    StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>(
  (ref) => ResetPasswordNotifier(authRepository),
);
