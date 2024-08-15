import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'accepted_masters_notifier.dart';
import 'accepted_masters_state.dart';

final acceptedMastersProvider =
    StateNotifierProvider<AcceptedMastersNotifier, AcceptedMastersState>(
  (ref) => AcceptedMastersNotifier(mastersRepository),
);
