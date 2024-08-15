import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'create_category_parent_state.dart';
import 'create_category_parent_notifier.dart';

final createCategoryParentProvider = StateNotifierProvider<
    CreateCategoryParentNotifier, CreateCategoryParentState>(
  (ref) => CreateCategoryParentNotifier(),
);
