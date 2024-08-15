import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ads_state.dart';
import 'ads_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final adsProvider = StateNotifierProvider<AdsNotifier, AdsState>(
  (ref) => AdsNotifier(adsRepository),
);
