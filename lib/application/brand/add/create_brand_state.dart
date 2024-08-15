import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'create_brand_state.freezed.dart';

@freezed
class CreateBrandState with _$CreateBrandState {
  const factory CreateBrandState({
    @Default('') String title,
    @Default(true) bool active,
    @Default(false) bool isLoading,
    @Default(false) bool isInitial,
    String? imageFile,
    Brand? brand,
  }) = _CreateBrandState;

  const CreateBrandState._();
}
