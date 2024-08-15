import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'pickup_points_notifier.dart';
import 'pickup_points_state.dart';

final pickupPointsProvider =
    StateNotifierProvider<PickupPointsNotifier, PickupPointsState>(
  (ref) => PickupPointsNotifier(addressRepository),
);
