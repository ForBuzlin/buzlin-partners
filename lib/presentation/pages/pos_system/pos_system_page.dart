import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:remixicon/remixicon.dart';
import 'package:auto_route/auto_route.dart';
import 'details/product_details_modal.dart';
import 'package:flutter/material.dart';
import 'filter/pos_filter_modal.dart';
import 'widgets/products_body.dart';
import 'widgets/cart_list.dart';

@RoutePage()
class PosSystemPage extends ConsumerStatefulWidget {
  const PosSystemPage({super.key});

  @override
  ConsumerState<PosSystemPage> createState() => _PosSystemPageState();
}

class _PosSystemPageState extends ConsumerState<PosSystemPage> {
  late RefreshController _productController;

  @override
  void initState() {
    super.initState();
    _productController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await ref.read(orderCartProvider.notifier).fetchCarts();
        ref.read(orderProductsProvider.notifier).fetchProducts(
              isRefresh: true,
              cartStocks: ref
                  .watch(orderCartProvider)
                  .bags[ref.watch(orderCartProvider).selectedBagIndex]
                  .bagProducts,
            );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _productController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productsNotifier = ref.read(orderProductsProvider.notifier);
    final productsState = ref.watch(orderProductsProvider);
    final cartState = ref.watch(orderCartProvider);
    return CustomScaffold(
      body: (colors) => AppHelpers.getUserRole != TrKeys.master
          ? Column(
              children: [
                CustomAppBar(
                  height: 146,
                  bottomPadding: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const PopButton(),
                          Text(
                            AppHelpers.getTranslation(TrKeys.posSystem),
                            style: Style.interNormal(
                              size: 16,
                            ),
                          ),
                          const Spacer(),
                          8.horizontalSpace,
                          IconButton(
                              onPressed: () {
                                ref.read(filterProvider.notifier).fetchExtras(
                                    context: context, isPrice: false);
                                AppHelpers.showCustomModalBottomDragSheet(
                                    paddingTop: 90.r,
                                    context: context,
                                    modal: (c) => const PosFilterModal());
                              },
                              icon: Icon(
                                Remix.sound_module_line,
                                size: 24.r,
                                color: Style.black,
                              )),
                        ],
                      ),
                      Divider(height: 8.r),
                      Flexible(
                        child: SearchTextField(
                          onChanged: (value) => productsNotifier.setQuery(
                            query: value,
                            cartStocks: cartState
                                .bags[cartState.selectedBagIndex].bagProducts,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ProductsBody(
                    isLoading: productsState.isLoading,
                    products: productsState.products,
                    refreshController: _productController,
                    onRefreshing: () {
                      productsNotifier.fetchProducts(
                        cartStocks: cartState
                            .bags[cartState.selectedBagIndex].bagProducts,
                        refreshController: _productController,
                        isRefresh: true,
                      );
                    },
                    onLoading: () {
                      productsNotifier.fetchProducts(
                        refreshController: _productController,
                        cartStocks: cartState
                            .bags[cartState.selectedBagIndex].bagProducts,
                      );
                    },
                    onProductTap: (product) {
                      final stock = product.stocks ?? [Stocks()];
                      AppHelpers.showCustomModalBottomDragSheet(
                        paddingTop: 60,
                        context: context,
                        maxChildSize: 0.8,
                        initSize: (stock.first.extras?.length ?? 0) > 2
                            ? 0.8
                            : (stock.first.extras?.length ?? 0) > 1
                                ? 0.7
                                : (stock.first.extras?.length ?? 0) == 1
                                    ? 0.56
                                    : 0.46,
                        modal: (c) => ProductDetailsModal(
                          controller: c,
                          product: product,
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : const NotPermission(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: (colors) => AppHelpers.getUserRole != TrKeys.master
          ? const CartList()
          : const SizedBox.shrink(),
    );
  }
}
