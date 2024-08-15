import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_product_gallery_state.freezed.dart';

@freezed
class EditProductGalleryState with _$EditProductGalleryState {
  const factory EditProductGalleryState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default([]) List<Extras> extras,
    @Default({}) Map<String, List<String?>> images,
    @Default({}) Map<String, List<Galleries?>> listOfUrls,
  }) = _EditProductGallery;

  const EditProductGalleryState._();
}
