import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'subscriptions_state.dart';
import 'subscriptions_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final subscriptionProvider =
    StateNotifierProvider<SubscriptionNotifier, SubscriptionState>(
  (ref) => SubscriptionNotifier(subscriptionRepository, paymentRepository),
);
