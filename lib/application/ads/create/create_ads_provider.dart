import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'create_ads_notifier.dart';
import 'create_ads_state.dart';

final createAdsProvider =
    StateNotifierProvider<CreateAdsNotifier, CreateExtrasGroupState>(
  (ref) => CreateAdsNotifier(adsRepository),
);
