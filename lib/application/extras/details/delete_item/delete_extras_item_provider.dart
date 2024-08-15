import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'delete_extras_item_notifier.dart';
import 'delete_extras_item_state.dart';

final deleteExtrasItemProvider =
    StateNotifierProvider<DeleteExtrasItemNotifier, DeleteExtrasItemState>(
  (ref) => DeleteExtrasItemNotifier(extrasRepository),
);
