import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'edit_extras_item_notifier.dart';
import 'edit_extras_item_state.dart';

final editExtrasItemProvider =
    StateNotifierProvider<EditExtrasItemNotifier, EditExtrasItemState>(
  (ref) => EditExtrasItemNotifier(extrasRepository),
);
