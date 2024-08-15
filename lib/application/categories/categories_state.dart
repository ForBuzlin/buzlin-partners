import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState({
    @Default(false) bool isLoading,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<int> selectParents,
    @Default([]) List<int> selectSubs,
  }) = _CategoriesState;

  const CategoriesState._();
}
