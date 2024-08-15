import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'products_filter_state.dart';

class ProductsFilterNotifier extends StateNotifier<ProductsFilterState> {
  final ProductsFacade _productsRepository;

  ProductsFilterNotifier(this._productsRepository)
      : super(const ProductsFilterState());

  selectType(LayoutType selectType) {
    state = state.copyWith(selectType: selectType);
  }

  fetchExtras({
    required BuildContext context,
    String? type,
    required bool isPrice,
    int? categoryId,
  }) async {
    if (isPrice) {
      state = state.copyWith(rangeValues: null);
    }
    if (type != null) {
      state = state.copyWith(type: type);
    }

    state = state.copyWith(isLoading: true);
    final res = await _productsRepository.fetchAllFilter(
        type: state.type,
        extrasId: state.extras,
        categoryId: state.categories,
        brandId: state.brands,
        priceFrom: state.rangeValues?.start,
        priceTo: state.rangeValues?.end);

    res.when(
      success: (success) {
        if (isPrice) {
          state = state.copyWith(
            isLoading: false,
            filter: success,
            filterPrices: success.price,
            rangeValues: RangeValues(
              (success.price?.min ?? 0).toDouble(),
              (success.price?.max ?? 0).toDouble(),
            ),
            prices: List.generate(
              (30).round(),
              (index) => (Random().nextInt(8) + 1),
            ),
          );
          return;
        }

        state = state.copyWith(
          isLoading: false,
          filter: success,
        );
      },
      failure: (error, statusCode) {
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: error);
      },
    );
  }

  setExtras(int id) {
    List<int> list = List.from(state.extras ?? []);
    if (list.contains(id)) {
      list.remove(id);
    } else {
      list.add(id);
    }
    state = state.copyWith(extras: list);
  }

  setRangePrice(RangeValues price) {
    state = state.copyWith(rangeValues: price);
  }

  setCategory(int id) {
    List<int> list = List.from(state.categories ?? []);
    if (list.contains(id)) {
      list.remove(id);
    } else {
      list.add(id);
    }
    state = state.copyWith(categories: list);
  }

  setBrands(int id) {
    List<int> list = List.from(state.brands ?? []);
    if (list.contains(id)) {
      list.remove(id);
    } else {
      list.add(id);
    }
    state = state.copyWith(brands: list);
  }

  clearFilter() {
    state = state.copyWith(
        categories: [], brands: [], extras: [], rangeValues: null, prices: []);
  }
}
