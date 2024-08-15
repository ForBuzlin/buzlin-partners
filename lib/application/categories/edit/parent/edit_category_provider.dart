import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'edit_category_parent_state.dart';
import 'edit_category_parent_notifier.dart';

final editCategoryParentProvider =
    StateNotifierProvider<EditCategoryParentNotifier, EditCategoryParentState>(
  (ref) => EditCategoryParentNotifier(),
);
