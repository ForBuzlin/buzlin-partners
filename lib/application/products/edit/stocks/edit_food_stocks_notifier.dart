import 'edit_food_stocks_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EditFoodStocksNotifier extends StateNotifier<EditFoodStocksState> {
  final ProductsFacade _productsRepository;
  final ExtrasFacade _extrasRepository;
  List<Stocks> _localStocks = [];
  List<Stocks> _oldStocks = [];

  EditFoodStocksNotifier(this._productsRepository, this._extrasRepository)
      : super(const EditFoodStocksState());

  void toggleCheckedGroup(int groupIndex) {
    List<Group> groups = List.from(state.groups);
    final bool check =
        state.selectGroups.containsKey(groups[groupIndex].id.toString());
    groups[groupIndex] = groups[groupIndex].copyWith(isChecked: check);
    state = state.copyWith(groups: groups);
  }

  List<Group> _checkGroupsChecked(List<Group> groups, ProductData product) {
    for (int i = 0; i < groups.length; i++) {
      groups[i] = groups[i].copyWith(isChecked: false);
    }
    final List<Stocks> stocks = product.stocks ?? [];
    if (stocks.isNotEmpty) {
      final List<Extras> stockExtras = stocks.first.extras ?? [];
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

  Future<void> fetchGroups(
      {required ProductData product, required List<Group> groups}) async {
    if (state.groups.isNotEmpty) {
      List<Group> groups = List.from(state.groups);
      groups = _checkGroupsChecked(groups, product);
      state = state.copyWith(groups: groups);
      return;
    }
    state = state.copyWith(
      groups: _checkGroupsChecked(groups, product),
      isFetchingGroups: false,
    );
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
    for (int i = 0; i < _oldStocks.length; i++) {
      if (i < stocks.length) {
        stocks[i] = stocks[i].copyWith(
          price: _oldStocks[i].price,
          quantity: _oldStocks[i].quantity,
          sku: _oldStocks[i].sku,
        );
      }
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
    List<int> list = List.from(state.deleteStocks);
    list.add(_localStocks[index].id ?? 0);
    _localStocks.removeAt(index);
    state = state.copyWith(stocks: _localStocks, deleteStocks: list);
  }

  void setQuantity({required String value, required int index}) {
    _localStocks[index] =
        _localStocks[index].copyWith(quantity: int.tryParse(value.trim()));
  }

  void setSku({required String value, required int index}) {
    _localStocks[index] = _localStocks[index].copyWith(sku: value.trim());
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
      deletedStocks: state.deleteStocks,
      stocks: _localStocks,
      uuid: uuid,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isSaving: false);
        updated?.call(data.data);
      },
      failure: (failure, status) {
        state = state.copyWith(isSaving: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  void addEmptyStock() {
    List<Extras>? extras = _localStocks.last.extras;
    extras = extras?.map((e) => e.copyWith(value: null)).toList();
    _localStocks
        .add(_localStocks.last.copyWith(isInitial: true, extras: extras));
    state = state.copyWith(stocks: _localStocks);
  }

  void setInitialStocks({ProductData? product, required List<Group> groups}) {
    List<Stocks> stocks = product?.stocks ?? [];
    if (stocks.isEmpty) {
      stocks.add(Stocks());
    }
    Map<String, List<Extras?>> selectGroups = {};
    if (!(product?.digital ?? true)) {
      for (var element in stocks) {
        element.extras?.forEach((element) {
          if (selectGroups.containsKey(element.group?.id.toString() ?? '0')) {
            List<Extras?> list =
                selectGroups["${element.group?.id ?? 0}"] ?? [];
            list.add(element);
          } else {
            selectGroups["${element.group?.id ?? 0}"] = [element];
          }
        });
      }
    } else {
      if (stocks.length > 1) {
        stocks.removeRange(0, 1);
      }
      for (int i = 0; i < stocks.length; i++) {
        stocks[i] = stocks[i].copyWith(extras: []);
      }
    }
    state = state.copyWith(stocks: stocks, selectGroups: selectGroups);
    _localStocks = stocks;
    _oldStocks = stocks;
    if (!(product?.digital ?? true)) {
      fetchGroups(product: product ?? ProductData(), groups: List.from(groups));
    }
  }


  void setWholePrice({required String value, required int index}) {
    _localStocks[index] =
        _localStocks[index].copyWith(price: num.tryParse(value.trim()));
  }
}
