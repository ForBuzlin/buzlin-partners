import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'filter_notifier.dart';
import 'filter_state.dart';

final filterProvider = StateNotifierProvider<FilterNotifier, FilterState>(
  (ref) => FilterNotifier(productRepository),
);
