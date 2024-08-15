import 'package:venderuzmart/infrastructure/models/data/whole_sale_data.dart';

import 'whole_sale_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class WholeSaleNotifier extends StateNotifier<WholeSaleState> {
  final ProductsFacade _productsRepository;
  List<Stocks> _localStocks = [];

  WholeSaleNotifier(this._productsRepository) : super(const WholeSaleState());

  void deleteStock({
    required int stockIndex,
    required int index,
  }) {
    Stocks stock = _localStocks[stockIndex];
    stock.wholeSalePrices?.removeAt(index);
    _localStocks[stockIndex] = _localStocks[stockIndex]
        .copyWith(wholeSalePrices: stock.wholeSalePrices);
    state = state.copyWith(stocks: _localStocks);
  }

  void setMaxQuantity({
    required String value,
    required int stockIndex,
    required int index,
  }) {
    Stocks stock = _localStocks[stockIndex];
    stock.wholeSalePrices?[index] = stock.wholeSalePrices?[index]
            .copyWith(maxQuantity: int.tryParse(value)) ??
        WholeSalePrice();
    _localStocks[stockIndex] = _localStocks[stockIndex]
        .copyWith(wholeSalePrices: stock.wholeSalePrices);
  }

  void setMinQuantity({
    required String value,
    required int stockIndex,
    required int index,
  }) {
    Stocks stock = _localStocks[stockIndex];
    stock.wholeSalePrices?[index] = stock.wholeSalePrices?[index]
            .copyWith(minQuantity: int.tryParse(value)) ??
        WholeSalePrice();
    _localStocks[stockIndex] = _localStocks[stockIndex]
        .copyWith(wholeSalePrices: stock.wholeSalePrices);
  }

  void setPrice({
    required String value,
    required int stockIndex,
    required int index,
  }) {
    Stocks stock = _localStocks[stockIndex];
    stock.wholeSalePrices?[index] =
        stock.wholeSalePrices?[index].copyWith(price: int.tryParse(value)) ??
            WholeSalePrice();
    _localStocks[stockIndex] = _localStocks[stockIndex]
        .copyWith(wholeSalePrices: stock.wholeSalePrices);
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
        state = state.copyWith(isSaving: false);
        updated?.call(data.data);
      },
      failure: (failure, status) {
        state = state.copyWith(isSaving: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  String? minQtyCheck({
    required String? value,
    required int stockIndex,
    required int index,
  }) {
    if (value == null || value.isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if ((double.tryParse(value) ?? 0) < (state.product?.minQty ?? 0)) {
      return AppHelpers.getTranslation(TrKeys.minQuantityError);
    }
    List<WholeSalePrice> wholeSalePrices =
        _localStocks[stockIndex].wholeSalePrices ?? [];
    if (wholeSalePrices.length > 1 && index > 0) {
      if ((wholeSalePrices[index - 1].maxQuantity ?? 0) >=
          (double.tryParse(value) ?? 0)) {
        return AppHelpers.getTranslation(TrKeys.minQuantityError);
      }
    }

    return null;
  }

  String? maxQtyCheck({
    required String? value,
    required int stockIndex,
    required int index,
  }) {
    if (value == null || value.isEmpty) {
      return AppHelpers.getTranslation(TrKeys.cannotBeEmpty);
    }
    if ((double.tryParse(value) ?? 0) > (state.product?.maxQty ?? 0)) {
      return AppHelpers.getTranslation(TrKeys.errorMaxQty);
    }
    List<WholeSalePrice> wholeSalePrices =
        _localStocks[stockIndex].wholeSalePrices ?? [];
    if ((wholeSalePrices[index].minQuantity ?? 0) >=
        (double.tryParse(value) ?? 0)) {
      return AppHelpers.getTranslation(TrKeys.errorMaxQty);
    }

    return null;
  }

  void setInitialStocks({ProductData? product}) {
    List<Stocks> stocks = List.from(product?.stocks ?? []);
    List<GlobalKey<FormState>> formKeys =
        List.generate(stocks.length, (index) => GlobalKey<FormState>());
    state = state.copyWith(
      stocks: stocks,
      product: product,
      formKeys: formKeys,
    );
    _localStocks = stocks;
  }

  void addEmptyStock(int index) {
    List<WholeSalePrice> wholeSalePrice =
        _localStocks[index].wholeSalePrices ?? [];
    if (wholeSalePrice.isEmpty) {
      wholeSalePrice.add(WholeSalePrice(minQuantity: state.product?.minQty));
    } else {
      wholeSalePrice.add(WholeSalePrice(
          minQuantity: (wholeSalePrice.last.maxQuantity ?? 0) + 1));
    }
    _localStocks[index].wholeSalePrices = wholeSalePrice;
    state = state.copyWith(stocks: _localStocks);
  }
}
