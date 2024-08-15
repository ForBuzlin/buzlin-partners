import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'master_galleries_notifier.dart';
import 'master_galleries_state.dart';

final masterGalleriesProvider =
    StateNotifierProvider<MasterGalleriesNotifier, MasterGalleriesState>(
  (ref) => MasterGalleriesNotifier(mastersRepository,settingsRepository),
);
