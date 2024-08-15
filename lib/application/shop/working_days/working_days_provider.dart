import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'working_days_state.dart';
import 'working_days_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final workingDaysProvider =
    StateNotifierProvider<WorkingDaysNotifier, WorkingDaysState>(
  (ref) => WorkingDaysNotifier(shopsRepository),
);
