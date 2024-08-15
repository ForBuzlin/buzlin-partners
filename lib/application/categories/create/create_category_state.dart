import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

part 'create_category_state.freezed.dart';

@freezed
class CreateCategoryState with _$CreateCategoryState {
  const factory CreateCategoryState({
    @Default('') String title,
    @Default('') String description,
    @Default('') String input,
    @Default(true) bool active,
    @Default(false) bool isLoading,
    @Default(false) bool isInitial,
    String? imageFile,
    CategoryData? category,
  }) = _CreateCategoryState;

  const CreateCategoryState._();
}
