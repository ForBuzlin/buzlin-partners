import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'add_service_notifier.dart';
import 'add_service_state.dart';

final addServiceProvider = StateNotifierProvider<AddServiceNotifier, AddServiceState>(
  (ref) => AddServiceNotifier(serviceRepository, settingsRepository),
);
