import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'convert_notifier.dart';
import 'convert_state.dart';

final convertProvider =
    StateNotifierProvider.autoDispose<ConvertNotifier, ConvertState>(
  (ref) => ConvertNotifier(productRepository),
);
