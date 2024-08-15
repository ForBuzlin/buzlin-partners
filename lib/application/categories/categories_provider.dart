import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'categories_state.dart';
import 'categories_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final categoriesProvider =
    StateNotifierProvider<CategoriesNotifier, CategoriesState>(
  (ref) => CategoriesNotifier(catalogRepository),
);
