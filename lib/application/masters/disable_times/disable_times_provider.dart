import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'disable_times_state.dart';
import 'disable_times_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final masterDisableTimesProvider =
    StateNotifierProvider<MasterDisableTimesNotifier,MasterDisableTimesState>(
  (ref) => MasterDisableTimesNotifier(mastersRepository),
);
