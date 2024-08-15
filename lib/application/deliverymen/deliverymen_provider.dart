import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'deliverymen_notifier.dart';
import 'deliverymen_state.dart';

final deliverymenProvider =
    StateNotifierProvider<DeliverymenNotifier, DeliverymenState>(
  (ref) => DeliverymenNotifier(usersRepository),
);
