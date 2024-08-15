import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'profile_notifier.dart';
import 'profile_state.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>(
  (ref) =>
      ProfileNotifier(settingsRepository, usersRepository, shopsRepository),
);
