import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'users_state.dart';
import 'users_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final usersProvider = StateNotifierProvider<UsersNotifier, UsersState>(
  (ref) => UsersNotifier(usersRepository, settingsRepository),
);
