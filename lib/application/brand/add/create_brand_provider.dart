import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'create_brand_state.dart';
import 'create_brand_notifier.dart';

final createBrandProvider =
    StateNotifierProvider<CreateBrandNotifier, CreateBrandState>(
  (ref) => CreateBrandNotifier(brandsRepository, settingsRepository),
);
