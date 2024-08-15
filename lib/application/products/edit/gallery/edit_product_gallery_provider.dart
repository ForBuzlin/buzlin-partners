import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'edit_product_gallery_state.dart';
import 'edit_product_gallery_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final editProductGalleryProvider = StateNotifierProvider.autoDispose<
    EditProductGalleryNotifier, EditProductGalleryState>(
  (ref) => EditProductGalleryNotifier(productRepository, settingsRepository),
);
