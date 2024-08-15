import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_category_state.freezed.dart';

@freezed
class EditCategoryState with _$EditCategoryState {
  const factory EditCategoryState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdate,
    @Default(false) bool active,
    @Default('') String title,
    @Default('') String input,
    @Default('') String description,
    @Default([]) List<String> images,
    String? imageFile,
    @Default([]) List<Galleries> listOfUrls,
    CategoryData? category,
  }) = _EditCategoryState;

  const EditCategoryState._();
}
