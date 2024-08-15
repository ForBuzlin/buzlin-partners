import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'create_food_stocks_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class CreateFoodStocksNotifier extends StateNotifier<CreateFoodStocksState> {
  final ProductsFacade _productsRepository;
  final ExtrasFacade _extrasRepository;

  CreateFoodStocksNotifier(this._productsRepository, this._extrasRepository)
      : super(const CreateFoodStocksState());
  List<Stocks> _localStocks = [];

  void toggleCheckedGroup(int groupIndex) {
    List<Group> groups = List.from(state.groups);
    final bool check =
    state.selectGroups.containsKey(groups[groupIndex].id.toString());
    groups[groupIndex] = groups[groupIndex].copyWith(isChecked: check);
    state = state.copyWith(groups: groups);
  }


  setExtrasIndex(int index) {
    Extras extras = state.activeGroupExtras[index];
    List<Extras> list = List.from(state.localExtras);
    if (list.any((element) => element.id == extras.id)) {
      list.removeWhere((element) => element.id == extras.id);
    } else {
      list.add(extras);
    }
    state = state.copyWith(localExtras: list);
  }

  setActiveExtras(int groupIndex, {VoidCallback? onSuccess}) {
    state = state.copyWith(isExtrasSave: true);
    String key = state.groups[groupIndex].id.toString();
    Map<String, List<Extras?>> selectGroups = Map.from(state.selectGroups);

    if (selectGroups.containsKey(key)) {
      if (state.localExtras.isEmpty) {
        selectGroups.remove(key);
      } else {
        selectGroups[key] = state.localExtras;
      }
    } else {
      selectGroups[key] = state.localExtras;
    }
    state = state.copyWith(selectGroups: selectGroups);
    toggleCheckedGroup(groupIndex);
    combination();
    onSuccess?.call();
    state = state.copyWith(stocks: _localStocks, isExtrasSave: false);
  }

  combination() {
    List<Stocks> stocks = [];
    if (state.selectGroups.values.isNotEmpty) {
      List<List<Extras>> list =
      AppHelpers.cartesian(List.from(state.selectGroups.values));
      stocks =
          List.generate(list.length, (index) => Stocks(extras: list[index]));
    } else {
      stocks = [Stocks()];
    }
    _localStocks = stocks;
  }

  Future<void> fetchGroupExtras(
      BuildContext context, {
        required int groupIndex,
        VoidCallback? onSuccess,
      }) async {
    if (state.groups[groupIndex].fetchedExtras?.isNotEmpty ?? false) {
      state = state.copyWith(
          activeGroupExtras: state.groups[groupIndex].fetchedExtras ?? [],
          localExtras:
          state.selectGroups[state.groups[groupIndex].id.toString()] ?? []);
      return;
    }
    state = state.copyWith(
      isLoading: true,
      localExtras:
      state.selectGroups[state.groups[groupIndex].id.toString()] ?? [],
    );
    final response = await _extrasRepository.getExtras(
      groupId: state.groups[groupIndex].id,
    );
    response.when(
      success: (data) {
        final List<Extras> fetchedExtras = data.data?.extraValues ?? <Extras>[];
        List<Group> activeGroups = List.from(state.groups);
        activeGroups[groupIndex] =
            activeGroups[groupIndex].copyWith(fetchedExtras: fetchedExtras);

        /// save fetched extras to groups
        List<Group> groups = List.from(state.groups);
        int mainGroupIndex = 0;
        for (int i = 0; i < groups.length; i++) {
          if (groups[i].id == activeGroups[groupIndex].id) {
            mainGroupIndex = i;
          }
        }
        groups[mainGroupIndex] =
            groups[mainGroupIndex].copyWith(fetchedExtras: fetchedExtras);
        state = state.copyWith(
          isLoading: false,
          activeGroupExtras: fetchedExtras,
          groups: groups,
          stocks: _localStocks,
        );
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
        debugPrint('===> group extras fetching failed $failure');
      },
    );
  }

  void deleteStock(int index) {
    _localStocks.removeAt(index);
    state = state.copyWith(stocks: _localStocks);
  }

  void addEmptyStock() {
    List<Extras>? extras = _localStocks.last.extras;
    extras = extras?.map((e) => e.copyWith(value: null)).toList();
    _localStocks
        .add(_localStocks.last.copyWith(isInitial: true, extras: extras));
    state = state.copyWith(stocks: _localStocks);
  }

  List<Group> _checkGroupsChecked(List<Group> groups) {
    for (int i = 0; i < groups.length; i++) {
      groups[i] = groups[i].copyWith(isChecked: false);
    }
    if (state.stocks.isNotEmpty) {
      final List<Extras> stockExtras = state.stocks.first.extras ?? [];
      for (int i = 0; i < groups.length; i++) {
        for (final extras in stockExtras) {
          if (extras.extraGroupId == groups[i].id) {
            groups[i] = groups[i].copyWith(isChecked: true);
          }
        }
      }
    }
    return groups;
  }

  Future<void> fetchGroups() async {
    if (state.groups.isNotEmpty) {
      List<Group> groups = List.from(state.groups);
      groups = _checkGroupsChecked(groups);
      state = state.copyWith(groups: groups);
      return;
    }
    state = state.copyWith(isFetchingGroups: true);
    final response = await _extrasRepository.getExtrasGroups();
    response.when(
      success: (data) {
        List<Group> groups = data.data ?? [];
        state = state.copyWith(
          groups: _checkGroupsChecked(groups),
          isFetchingGroups: false,
        );
      },
      failure: (failure, status) {
        state = state.copyWith(isFetchingGroups: false);
      },
    );
  }

  void setSku({required String value, required int index}) {
    _localStocks[index] = _localStocks[index].copyWith(sku: value.trim());
  }

  void setQuantity({required String value, required int index}) {
    _localStocks[index] =
        _localStocks[index].copyWith(quantity: int.tryParse(value.trim()));
  }

  void setPrice({required String value, required int index}) {
    _localStocks[index] =
        _localStocks[index].copyWith(price: num.tryParse(value.trim()));
  }

  Future<void> updateStocks(
    BuildContext context, {
    String? uuid,
    ValueChanged<ProductData?>? updated,
  }) async {
    state = state.copyWith(isSaving: true);
    final response = await _productsRepository.updateStocks(
      deletedStocks: [],
      stocks: _localStocks,
      uuid: uuid,
    );
    response.when(
      success: (data) {
        state =
            state.copyWith(isSaving: false, stocks: data.data?.stocks ?? []);
        updated?.call(data.data);
      },
      failure: (failure, status) {
        state = state.copyWith(isSaving: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  void setInitialStocks() {
    final List<Stocks> stocks = [Stocks()];
    state = state.copyWith(stocks: stocks, selectGroups: {},localExtras: []);
    _localStocks = stocks;
    fetchGroups();
  }
}
