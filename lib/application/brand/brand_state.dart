import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'brand_state.freezed.dart';

@freezed
class BrandState with _$BrandState {
  const factory BrandState({
    @Default(false) bool isLoading,
    @Default([]) List<Brand> brands,
  }) = _BrandState;

  const BrandState._();
}
