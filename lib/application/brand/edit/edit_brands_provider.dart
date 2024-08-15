import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'edit_brands_notifier.dart';
import 'edit_brands_state.dart';

final editBrandsProvider =
    StateNotifierProvider<EditBrandsNotifier, EditBrandsState>(
  (ref) => EditBrandsNotifier(brandsRepository, settingsRepository),
);
