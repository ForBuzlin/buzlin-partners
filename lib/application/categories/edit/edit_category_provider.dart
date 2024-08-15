import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'edit_category_notifier.dart';
import 'edit_category_state.dart';

final editCategoryProvider =
    StateNotifierProvider<EditCategoryNotifier, EditCategoryState>(
  (ref) => EditCategoryNotifier(catalogRepository, settingsRepository),
);
