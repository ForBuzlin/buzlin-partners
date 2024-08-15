import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:venderuzmart/infrastructure/models/models.dart';

part 'edit_food_stocks_state.freezed.dart';

@freezed
class EditFoodStocksState with _$EditFoodStocksState {
  const factory EditFoodStocksState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(false) bool isExtrasSave,
    @Default(false) bool isFetchingGroups,
    @Default([]) List<int> deleteStocks,
    @Default([]) List<Group> groups,
    @Default([]) List<Stocks> stocks,
    @Default([]) List<Extras> activeGroupExtras,
    @Default([]) List<Extras?> localExtras,
    @Default({}) Map<String, List<Extras?>> selectGroups,
  }) = _EditFoodStocksState;

  const EditFoodStocksState._();
}
