import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'create_food_stocks_state.freezed.dart';

@freezed
class CreateFoodStocksState with _$CreateFoodStocksState {
  const factory CreateFoodStocksState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(false) bool isExtrasSave,
    @Default(false) bool isFetchingGroups,
    @Default([]) List<Group> groups,
    @Default([]) List<Stocks> stocks,
    @Default([]) List<Extras> activeGroupExtras,
    @Default([]) List<Extras?> localExtras,
    @Default({}) Map<String, List<Extras?>> selectGroups,
  }) = _CreateFoodStocksState;

  const CreateFoodStocksState._();
}
