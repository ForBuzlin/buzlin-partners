import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'new_masters_notifier.dart';
import 'new_masters_state.dart';

final newMastersProvider =
    StateNotifierProvider<NewMastersNotifier, NewMastersState>(
  (ref) => NewMastersNotifier(mastersRepository),
);
