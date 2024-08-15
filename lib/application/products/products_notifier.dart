import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'products_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class ProductsNotifier extends StateNotifier<ProductsState> {
  final ProductsFacade _productsRepository;
  int _page = 0;
  Timer? _timer;
  String _query = '';

  ProductsNotifier(this._productsRepository) : super(const ProductsState());

  Future<void> fetchProducts({
    RefreshController? refreshController,
    bool isRefresh = false,
    int? categoryId,
    int? brandId,
    bool? isNew,
    List<int>? brandIds,
    List<int>? categoryIds,
    List<int>? extrasId,
    num? priceTo,
    num? priceFrom,
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

  void updateSingleProduct(ProductData? product) {
    List<ProductData> products = List.from(state.products);
    int? index;
    for (int i = 0; i < products.length; i++) {
      if (product?.id == products[i].id) {
        index = i;
      }
    }
    if (index != null && product != null) {
      products[index] =
          product.copyWith(translation: products[index].translation);
      state = state.copyWith(products: products);
    } else if (index == null && product != null) {
      products.add(product);
    }
  }

  void setQuery({required String query, int? categoryId}) {
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
          fetchProducts(isRefresh: true, categoryId: categoryId);
        },
      );
    } else {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          fetchProducts(isRefresh: true, categoryId: categoryId);
        },
      );
    }
  }

  deleteProduct(BuildContext context, int? id) async {
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.deleteProduct(id);
    response.when(
      success: (success) {
        List<ProductData> list = List.from(state.products);
        list.removeWhere((element) => element.id == id);
        state = state.copyWith(products: list);
      },
      failure: (failure, status) {
      AppHelpers.errorSnackBar(context, text: failure,);
      },
    );
    state = state.copyWith(isLoading: false);
  }
}
