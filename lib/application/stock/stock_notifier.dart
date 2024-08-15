import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

import 'stock_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class StockNotifier extends StateNotifier<StockState> {
  final StockFacade _stockRepository;
  int _page = 0;
  bool _hasMore = true;

  StockNotifier(this._stockRepository) : super(const StockState());

  Future<void> fetchMoreStocks({RefreshController? refreshController}) async {
    if (!_hasMore) {
      refreshController?.loadNoData();
      return;
    }
    final response = await _stockRepository.getStocks(
      page: ++_page,
      //query: _query.isEmpty ? null : _query.trim(),
      //categoryId: _categoryId,
    );
    response.when(
      success: (data) {
        List<Stocks> stocks = List.from(state.stocks);
        final List<Stocks> newStocks = data.data ?? [];
        stocks.addAll(newStocks);
        _hasMore = newStocks.length >= 10;
        refreshController?.loadComplete();
        state = state.copyWith(stocks: stocks);
      },
      failure: (failure, status) {
        debugPrint('===> fetch more stocks fail $failure');
        refreshController?.loadFailed();
      },
    );
  }

  Future<void> initialFetchStocks() async {
    if (state.stocks.isNotEmpty) {
      return;
    }
    _page = 0;
    _hasMore = true;
    state = state.copyWith(isLoading: true);
    final response = await _stockRepository.getStocks(page: ++_page);
    response.when(
      success: (data) {
        List<Stocks> stocks = data.data ?? [];
        _hasMore = stocks.length >= 10;
        state = state.copyWith(isLoading: false, stocks: stocks);
      },
      failure: (failure, status) {
        debugPrint('===> fetch stock fail $failure');
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<void> refreshStocks({RefreshController? refreshController}) async {
    refreshController?.resetNoData();
    _hasMore = true;
    _page = 0;
    final response = await _stockRepository.getStocks(
      page: ++_page,
    );
    response.when(
      success: (data) {
        final List<Stocks> stocks = data.data ?? [];
        state = state.copyWith(stocks: stocks);
        _hasMore = stocks.length >= 10;
        refreshController?.refreshCompleted();
      },
      failure: (error, status) {
        debugPrint('===> initial fetch stocks fail $error');
        refreshController?.refreshFailed();
      },
    );
  }

// void updateSingleProduct(ProductData? product) {
//   List<ProductData> products = List.from(state.products);
//   int? index;
//   for (int i = 0; i < products.length; i++) {
//     if (product?.id == products[i].id) {
//       index = i;
//     }
//   }
//   if (index != null && product != null) {
//     products[index] = product;
//     state = state.copyWith(products: products);
//   }
// }

// void setQuery({required String query, int? categoryId}) {
//   if (_query == query) {
//     return;
//   }
//   _query = query.trim();
//   if (_query.isNotEmpty) {
//     if (_timer?.isActive ?? false) {
//       _timer?.cancel();
//     }
//     _timer = Timer(
//       const Duration(milliseconds: 500),
//       () {
//         fetchProducts(isRefresh: true, categoryId: categoryId);
//       },
//     );
//   } else {
//     if (_timer?.isActive ?? false) {
//       _timer?.cancel();
//     }
//     _timer = Timer(
//       const Duration(milliseconds: 500),
//       () {
//         fetchProducts(isRefresh: true, categoryId: categoryId);
//       },
//     );
//   }
// }
//
// Future<void> fetchProducts({
//   RefreshController? refreshController,
//   bool isRefresh = false,
//   bool isOpeningPage = false,
//   int? categoryId,
//   ProductStatus? status,
//   int? brandId,
//   bool? isNew,
//   List<int>? brandIds,
//   List<int>? categoryIds,
//   List<int>? extrasId,
//   num? priceTo,
//   num? priceFrom,
// }) async {
//   if (isRefresh) {
//     _page = 0;
//     _hasMore = true;
//     refreshController?.requestRefresh();
//     refreshController?.resetNoData();
//   } else {
//     if (state.products.isNotEmpty && isOpeningPage) {
//       return;
//     }
//   }
//   if (!_hasMore) {
//     refreshController?.loadNoData();
//     return;
//   }
//   if (_page == 0 && !isRefresh) {
//     state = state.copyWith(isLoading: true);
//   }
//   final response = await _productsRepository.getProducts(
//     page: ++_page,
//     categoryId: categoryId,
//     query: _query.isEmpty ? null : _query,
//     status: status,
//     brandId: brandId,
//     brandIds: brandIds,
//     categoryIds: categoryIds,
//     extrasId: extrasId,
//     priceFrom: priceFrom,
//     priceTo: priceTo,
//   );
//   response.when(
//     success: (data) {
//       List<ProductData> products = isRefresh ? [] : List.from(state.products);
//       final List<ProductData> newProducts = data.data ?? [];
//       products.addAll(newProducts);
//       _hasMore = newProducts.length >= 10;
//       if (_page == 1 && !isRefresh) {
//         state = state.copyWith(isLoading: false, products: products);
//       } else {
//         state = state.copyWith(products: products);
//       }
//       if (isRefresh) {
//         refreshController?.refreshCompleted();
//       } else {
//         refreshController?.loadComplete();
//       }
//     },
//     failure: (failure, status) {
//       debugPrint('====> fetch products fail $failure');
//       _page--;
//       if (_page == 0) {
//         state = state.copyWith(isLoading: false);
//       }
//       if (isRefresh) {
//         refreshController?.refreshFailed();
//       } else {
//         refreshController?.loadFailed();
//       }
//     },
//   );
// }
//
// deleteProduct(BuildContext context, int? id) async {
//   state = state.copyWith(isLoading: true);
//   final response = await _productsRepository.deleteProduct(id);
//   response.when(
//     success: (success) {
//       List<ProductData> list = List.from(state.products);
//       list.removeWhere((element) => element.id == id);
//       state = state.copyWith(products: list);
//     },
//     failure: (failure, status) {
//       AppHelperss.showCheckTopSnackBar(
//         context,
//         text: failure,
//       );
//     },
//   );
//   state = state.copyWith(isLoading: false);
// }
}
