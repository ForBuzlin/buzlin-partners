import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'income_notifier.dart';
import 'income_state.dart';

final incomeProvider = StateNotifierProvider<IncomeNotifier, IncomeState>(
  (ref) => IncomeNotifier(statisticsRepository),
);
