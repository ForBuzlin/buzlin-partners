import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_product_gallery_state.dart';
import 'create_product_gallery_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final createProductGalleryProvider = StateNotifierProvider.autoDispose<
    CreateProductGalleryNotifier, CreateProductGalleryState>(
  (ref) => CreateProductGalleryNotifier(productRepository, settingsRepository),
);
