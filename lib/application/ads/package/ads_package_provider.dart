import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ads_package_state.dart';
import 'ads_package_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final adsPackageProvider =
    StateNotifierProvider<AdsPackageNotifier, AdsPackageState>(
  (ref) => AdsPackageNotifier(adsRepository),
);
