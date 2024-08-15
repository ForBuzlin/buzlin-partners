import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'service_extras_notifier.dart';
import 'service_extras_state.dart';

final serviceExtrasProvider = StateNotifierProvider<ServiceExtrasNotifier, ServiceExtrasState>(
  (ref) => ServiceExtrasNotifier(serviceExtrasRepository),
);
