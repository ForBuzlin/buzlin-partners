import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cancelled_masters_notifier.dart';
import 'cancelled_masters_state.dart';

final cancelledMastersProvider =
    StateNotifierProvider<CancelledMastersNotifier, CancelledMastersState>(
  (ref) => CancelledMastersNotifier(mastersRepository),
);
