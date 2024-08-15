import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'shop_galleries_state.freezed.dart';

@freezed
class ShopGalleriesState with _$ShopGalleriesState {
  const factory ShopGalleriesState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    @Default([]) List<String> images,
    @Default([]) List<Galleries> listOfUrls,
  }) = _ShopGalleriesState;

  const ShopGalleriesState._();
}
