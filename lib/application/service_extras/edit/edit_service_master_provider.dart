import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'edit_service_master_notifier.dart';
import 'edit_service_master_state.dart';

final editServiceExtrasProvider =
    StateNotifierProvider<EditServiceExtrasNotifier, EditServiceExtrasState>(
  (ref) => EditServiceExtrasNotifier(serviceExtrasRepository),
);
