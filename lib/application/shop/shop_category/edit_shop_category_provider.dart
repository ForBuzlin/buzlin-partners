import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'edit_shop_category_notifier.dart';
import 'edit_shop_category_state.dart';

final editShopCategoryProvider =
    StateNotifierProvider<EditShopCategoryNotifier, EditShopCategoryState>(
  (ref) => EditShopCategoryNotifier(usersRepository),
);
