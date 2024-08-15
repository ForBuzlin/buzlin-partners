import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'add_category_state.freezed.dart';

@freezed
class AddCategoryState with _$AddCategoryState {
  const factory AddCategoryState({
    @Default('') String title,
    @Default(false) bool isLoading,
    @Default(true) bool active,
    String? imageFile,
    CategoryData? category,
  }) = _AddCategoryState;

  const AddCategoryState._();
}
