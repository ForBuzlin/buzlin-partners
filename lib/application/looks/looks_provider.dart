import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'looks_notifier.dart';
import 'looks_state.dart';

final looksProvider = StateNotifierProvider<LooksNotifier, LooksState>(
  (ref) => LooksNotifier(looksRepository),
);
