import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'create_new_group_item_notifier.dart';
import 'create_new_group_item_state.dart';

final createNewGroupItemProvider =
    StateNotifierProvider<CreateNewGroupItemNotifier, CreateNewGroupItemState>(
  (ref) => CreateNewGroupItemNotifier(extrasRepository),
);
