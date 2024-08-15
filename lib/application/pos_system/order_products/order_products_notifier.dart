import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

import 'order_products_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class OrderProductsNotifier extends StateNotifier<OrderProductsState> {
  final ProductsFacade _productsRepository;
  int _page = 0;
  Timer? _timer;
  String _query = '';

  OrderProductsNotifier(this._productsRepository)
      : super(const OrderProductsState());

  void updateProducts({required List<BagProductData> cartStocks}) {
    state = state.copyWith(isUpdate: true);
    List<ProductData> products = List.from(state.products);
    for (int i = 0; i < products.length; i++) {
      products[i] = products[i].copyWith(cartCount: 0);
      int count = 0;
      for (final stock in cartStocks) {
        if (stock.parentId == products[i].id) {
          count += stock.quantity ?? 0;
        }
      }
      products[i] = products[i].copyWith(cartCount: count);
    }
    state = state.copyWith(products: products, isUpdate: false);
  }

  void setQuery({
    required String query,
    required List<BagProductData>? cartStocks,
    int? categoryId,
  }) {
    if (_query == query) {
      return;
    }
    _query = query.trim();
    if (_query.isNotEmpty) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          fetchProducts(
            isRefresh: true,
            categoryId: categoryId,
            cartStocks: cartStocks,
          );
        },
      );
    } else {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          fetchProducts(
            isRefresh: true,
            categoryId: categoryId,
            cartStocks: cartStocks,
          );
        },
      );
    }
  }

  Future<void> fetchProducts({
    RefreshController? refreshController,
    bool isRefresh = false,
    int? categoryId,
    ProductStatus? status,
    int? brandId,
    bool? isNew,
    List<int>? brandIds,
    List<int>? categoryIds,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
    required List<BagProductData>? cartStocks,
  }) async {
    if (isRefresh) {
      _page = 0;
      refreshController?.resetNoData();
      state = state.copyWith(products: [], isLoading: true);
    }
    final response = await _productsRepository.getProducts(
      page: ++_page,
      categoryId: categoryId,
      query: _query.isEmpty ? null : _query,
      status: ProductStatus.published,
      active: true,
      brandId: brandId,
      brandIds: brandIds,
      categoryIds: categoryIds,
      extrasId: extrasId,
      priceFrom: priceFrom,
      priceTo: priceTo,
    );
    response.when(
      success: (data) {
        List<ProductData> list = List.from(state.products);
        list.addAll(data.data ?? []);
        for (int i = 0; i < list.length; i++) {
          for (final stock in cartStocks ?? []) {
            if (stock.parentId == list[i].id) {
              list[i] = list[i].copyWith(cartCount: stock.quantity ?? 0);
            }
          }
        }
        state = state.copyWith(isLoading: false, products: list);
        if (isRefresh) {
          refreshController?.refreshCompleted();
          return;
        } else if (data.data?.isEmpty ?? true) {
          refreshController?.loadNoData();
          return;
        }
        refreshController?.loadComplete();
        return;
      },
      failure: (failure, status) {
        debugPrint('====> fetch products fail $failure');
      },
    );
  }
}
