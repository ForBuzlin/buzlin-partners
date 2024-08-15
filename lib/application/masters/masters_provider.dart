import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'masters_notifier.dart';
import 'masters_state.dart';

final mastersProvider = StateNotifierProvider<MastersNotifier, MastersState>(
  (ref) => MastersNotifier(mastersRepository),
);
