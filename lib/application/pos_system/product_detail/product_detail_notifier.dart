// ignore_for_file: unrelated_type_equality_checks
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/products_facade.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'product_detail_state.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class ProductDetailNotifier extends StateNotifier<ProductDetailState> {
  final ProductsFacade _productsRepository;

  ProductDetailNotifier(this._productsRepository)
      : super(const ProductDetailState());

  void setProduct(ProductData product, int bagIndex) {
    final List<Stocks> stocks = product.stocks ?? <Stocks>[];
    state = state.copyWith(
      isLoading: false,
      productData: product,
      initialStocks: stocks,
      selectedStock: null,
    );
    if (stocks.isNotEmpty) {
      final int groupsCount = stocks[0].extras?.length ?? 0;
      final List<int> selectedIndexes = List.filled(groupsCount, 0);
      initialSetSelectedIndexes(selectedIndexes, bagIndex);
    }
    getProductDetailsById(product.uuid ?? "", bagIndex);
  }

  Future<void> getProductDetailsById(String productId, int bagIndex) async {
    final response = await _productsRepository.getProductDetails(productId);
    response.when(
      success: (data) async {
        final List<Stocks> stocks = data.data?.stocks ?? <Stocks>[];
        state = state.copyWith(
          productData: data.data,
          initialStocks: stocks,
          isLoading: false,
        );
        if (stocks.isNotEmpty) {
          final int groupsCount = stocks.first.extras?.length ?? 0;
          final List<int> selectedIndexes = List.filled(groupsCount, 0);
          initialSetSelectedIndexes(selectedIndexes, bagIndex);
        }
      },
      failure: (failure, s) {
        debugPrint('==> get product details failure: $failure');
      },
    );
  }

  void updateSelectedIndexes({
    required int index,
    required int value,
    required int bagIndex,
  }) {
    final newList = state.selectedIndexes.sublist(0, index);
    newList.add(value);
    final postList =
        List.filled(state.selectedIndexes.length - newList.length, 0);
    newList.addAll(postList);
    initialSetSelectedIndexes(newList, bagIndex);
  }

  void initialSetSelectedIndexes(List<int> indexes, int bagIndex) {
    state = state.copyWith(selectedIndexes: indexes);
    updateExtras(bagIndex);
  }

  void updateExtras(int bagIndex) {
    final int groupsCount = state.initialStocks[0].extras?.length ?? 0;
    final List<TypedExtra> groupExtras = [];
    for (int i = 0; i < groupsCount; i++) {
      if (i == 0) {
        final TypedExtra extras = StockFormat.getFirstExtras(
            state.selectedIndexes[0], state.initialStocks);
        groupExtras.add(extras);
      } else {
        final TypedExtra extras = StockFormat.getUniqueExtras(
          groupExtras,
          state.selectedIndexes,
          i,
          state.initialStocks,
        );
        groupExtras.add(extras);
      }
    }
    Stocks? selectedStock = StockFormat.getSelectedStock(
        groupExtras, state.initialStocks, state.selectedIndexes);
    final bag = LocalStorage.getBags()[bagIndex].bagProducts ?? [];
    for (int i = 0; i < bag.length; i++) {
      if (bag[i].stockId == selectedStock?.id) {
        selectedStock = selectedStock?.copyWith(cartCount: bag[i].quantity);
      }
    }
    state =
        state.copyWith(typedExtras: groupExtras, selectedStock: selectedStock);
  }

  Future<void> deleteStockFromCart({
    required int bagIndex,
    Function(List<BagProductData>)? updateProducts,
  }) async {
    List<BagProductData> stocks =
        List.from(LocalStorage.getBags()[bagIndex].bagProducts ?? []);
    stocks.removeWhere((element) => element.stockId == state.selectedStock?.id);

    List<BagData> bags = LocalStorage.getBags();
    bags[bagIndex] = bags[bagIndex].copyWith(bagProducts: stocks);
    await LocalStorage.setBags(bags);
    if (updateProducts != null) {
      updateProducts(bags[bagIndex].bagProducts ?? []);
    }
  }

  void increaseStockCount(
    BuildContext context,
    int bagIndex,
    Function(List<BagProductData>) updateProducts,
  ) {
    Stocks? selectedStock = state.selectedStock;
    // if ((selectedStock?.quantity ?? 0) < (state.productData?.minQty ?? 0)) {
    //   AppHelperss.showCheckTopSnackBar(context,
    //       text:
    //           "${AppHelperss.getTranslation(TrKeys.minQuantity)}: ${state.productData?.minQty ?? 0}");
    //   return;
    // }
    int newCount = selectedStock?.cartCount ?? 0;
    if (newCount >= (state.productData?.maxQty ?? 100000) ||
        newCount >= (selectedStock?.quantity ?? 100000)) {
      AppHelpers.errorSnackBar(context,
          text:
              "${AppHelpers.getTranslation(TrKeys.inStock)}: ${selectedStock?.cartCount}");
      return;
    } else if (newCount < (state.productData?.minQty ?? 0)) {
      if ((selectedStock?.quantity ?? 0) < (state.productData?.minQty ?? 0)) {
        newCount = selectedStock?.quantity ?? 0;
      } else {
        newCount = state.productData?.minQty ?? 1;
      }
      selectedStock = selectedStock?.copyWith(cartCount: newCount);
    } else {
      newCount = newCount + 1;
      selectedStock = selectedStock?.copyWith(cartCount: newCount);
    }
    state = state.copyWith(selectedStock: selectedStock);
    addProductToBag(context, bagIndex, updateProducts);
  }

  void decreaseStockCount(
    BuildContext context,
    int bagIndex,
    Function(List<BagProductData>) updateProducts,
  ) {
    int newCount = state.selectedStock?.cartCount ?? 0;
    if (newCount <= 0) {
      return;
    } else if (newCount <= (state.productData?.minQty ?? 0)) {
      newCount = 0;
    } else {
      newCount = newCount - 1;
    }
    state = state.copyWith(
        selectedStock: state.selectedStock?.copyWith(cartCount: newCount));
    if (newCount == 0) {
      deleteStockFromCart(bagIndex: bagIndex, updateProducts: updateProducts);
      return;
    }

    addProductToBag(context, bagIndex, updateProducts);
  }

  Future<void> addProductToBag(
    BuildContext context,
    int bagIndex,
    Function(List<BagProductData>) updateProducts,
  ) async {
    final List<BagProductData> bagProducts =
        LocalStorage.getBags()[bagIndex].bagProducts ?? [];
    bagProducts
        .removeWhere((element) => element.stockId == state.selectedStock?.id);
    bagProducts.insert(
      0,
      BagProductData(
          stockId: state.selectedStock?.id,
          quantity: state.selectedStock?.cartCount,
          parentId: state.productData?.id),
    );
    List<BagData> bags = List.from(LocalStorage.getBags());
    bags[bagIndex] = bags[bagIndex].copyWith(bagProducts: bagProducts);
    await LocalStorage.setBags(bags);
    updateProducts(bagProducts);
  }
}
