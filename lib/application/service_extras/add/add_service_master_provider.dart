import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'add_service_master_notifier.dart';
import 'add_service_master_state.dart';

final addServiceExtrasProvider =
    StateNotifierProvider<AddServiceExtrasNotifier, AddServiceExtrasState>(
  (ref) => AddServiceExtrasNotifier(serviceExtrasRepository),
);
