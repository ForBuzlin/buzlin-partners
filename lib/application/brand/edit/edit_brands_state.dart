import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_brands_state.freezed.dart';

@freezed
class EditBrandsState with _$EditBrandsState {
  const factory EditBrandsState({
    @Default(false) bool isLoading,
    @Default(false) bool active,
    @Default('') String title,
    @Default([]) List<String> images,
    String? imageFile,
    @Default([]) List<Galleries> listOfUrls,
    Brand? brand,
  }) = _EditBrandsState;

  const EditBrandsState._();
}
