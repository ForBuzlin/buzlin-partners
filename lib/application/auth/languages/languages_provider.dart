import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'languages_notifier.dart';
import 'languages_state.dart';

final languagesProvider =
    StateNotifierProvider<LanguagesNotifier, LanguagesState>(
  (ref) => LanguagesNotifier(settingsRepository),
);
