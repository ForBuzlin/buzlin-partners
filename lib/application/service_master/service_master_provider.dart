import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'service_master_notifier.dart';
import 'service_master_state.dart';

final serviceMasterProvider = StateNotifierProvider<ServiceMasterNotifier, ServiceMasterState>(
  (ref) => ServiceMasterNotifier(serviceMasterRepository),
);
