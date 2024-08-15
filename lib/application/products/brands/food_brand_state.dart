import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'food_brand_state.freezed.dart';

@freezed
class FoodBrandState with _$FoodBrandState {
  const factory FoodBrandState({
    @Default(false) bool isLoading,
    @Default([]) List<Brand> brands,
  }) = _FoodBrandState;

  const FoodBrandState._();
}
