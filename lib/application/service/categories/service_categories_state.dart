import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'service_categories_state.freezed.dart';

@freezed
class ServiceCategoriesState with _$ServiceCategoriesState{
  const factory ServiceCategoriesState({
    @Default(false) bool isLoading,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<CategoryData> allCategories,
    @Default([]) List<int> selectParents,
    @Default([]) List<int> selectSubs,
  }) = _ServiceCategoriesState;

  const ServiceCategoriesState._();
}
