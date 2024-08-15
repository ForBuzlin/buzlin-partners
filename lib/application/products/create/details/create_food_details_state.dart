import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'create_food_details_state.freezed.dart';

@freezed
class CreateFoodDetailsState with _$CreateFoodDetailsState {
  const factory CreateFoodDetailsState({
    @Default('') String title,
    @Default('') String description,
    @Default('0') String tax,
    @Default('1') String minQty,
    @Default('') String maxQty,
    @Default('') String qrcode,
    @Default(true) bool active,
    @Default('1') String interval,
    @Default(false) bool digital,
    @Default('') String ageLimit,
    @Default([]) List<String> images,
    @Default(false) bool isCreating,
    ProductData? createdProduct,
    @Default([]) List<Galleries> listOfUrls,
    @Default({}) Map<String, List<String>>mapOfDesc,
  }) = _CreateFoodDetailsState;

  const CreateFoodDetailsState._();
}
