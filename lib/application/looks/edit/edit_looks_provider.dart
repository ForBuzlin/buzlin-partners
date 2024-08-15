import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'edit_looks_notifier.dart';
import 'edit_looks_state.dart';

final editLooksProvider =
    StateNotifierProvider<EditLooksNotifier, EditLooksState>(
  (ref) => EditLooksNotifier(looksRepository, settingsRepository),
);
