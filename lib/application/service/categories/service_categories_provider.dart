import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'service_categories_state.dart';
import 'service_categories_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final serviceCategoriesProvider =
    StateNotifierProvider<ServiceCategoriesNotifier, ServiceCategoriesState>(
  (ref) => ServiceCategoriesNotifier(catalogRepository),
);
