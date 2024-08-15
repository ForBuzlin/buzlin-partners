// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'widgets/delete_product_modal.dart';
import 'widgets/three_h_body.dart';
import 'widgets/vertical_list_body.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'filter/filter_page.dart';
import 'widgets/two_v_body.dart';
import 'package:venderuzmart/application/providers.dart';

import 'widgets/two_h_body.dart';

@RoutePage()
class ProductsPage extends ConsumerStatefulWidget {
  const ProductsPage({super.key});

  @override
  ConsumerState<ProductsPage> createState() => _FoodsScreenState();
}

class _FoodsScreenState extends ConsumerState<ProductsPage> {
  final isLtr = LocalStorage.getLangLtr();
  late RefreshController simpleController;
  late RefreshController gridController;
  late RefreshController verticalController;
  late RefreshController oneController;
  bool isFilter = false;

  @override
  void initState() {
    super.initState();
    simpleController = RefreshController();
    gridController = RefreshController();
    verticalController = RefreshController();
    oneController = RefreshController();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final connect = await Connectivity().checkConnectivity();
        if (connect == ConnectivityResult.wifi ||
            connect == ConnectivityResult.mobile) {
          ref
              .read(foodCategoriesProvider.notifier)
              .fetchCategories(context: context, isRefresh: true);
          ref.read(productsProvider.notifier).fetchProducts(isRefresh: true);
          ref.read(extrasProvider.notifier).fetchGroups();
          ref
              .read(foodBrandProvider.notifier)
              .fetchBrands(context: context, isRefresh: true);
        } else {
          context.replaceRoute(const NoConnectionRoute());
        }
      },
    );
  }

  @override
  void dispose() {
    verticalController.dispose();
    oneController.dispose();
    simpleController.dispose();
    gridController.dispose();
    super.dispose();
  }

  void onLoading(RefreshController refreshController) {
    ref
        .read(productsProvider.notifier)
        .fetchProducts(refreshController: refreshController);
  }

  void onRefresh(RefreshController refreshController) {
    ref
        .read(productsProvider.notifier)
        .fetchProducts(refreshController: refreshController, isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final filterState = ref.watch(productsFilterProvider);
    final productsState = ref.watch(productsProvider);
    return CustomScaffold(
      body: (colors) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(
            height: 154,
            bottomPadding: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const PopButton(),
                    Text(
                      AppHelpers.getTranslation(TrKeys.products),
                      style: Style.interNormal(
                        size: 16,
                      ),
                    ),
                    const Spacer(),
                    8.horizontalSpace,
                    SecondButton(
                      title: TrKeys.addProduct,
                      onTap: () {
                        context.pushRoute(const CreateProductRoute());
                      },
                      prefix: Icon(
                        Remix.add_line,
                        size: 20.r,
                        color: Style.white,
                      ),
                    ),
                  ],
                ),
                Divider(height: 12.r),
                Consumer(
                  builder: (context, ref, child) {
                    final notifier = ref.read(productsProvider.notifier);
                    return SearchTextField(
                      onChanged: (value) => notifier.setQuery(query: value),
                      suffixIcon: ButtonEffectAnimation(
                        child: GestureDetector(
                          onTap: () {
                            ref
                                .read(productsFilterProvider.notifier)
                                .fetchExtras(context: context, isPrice: false);
                            AppHelpers.showCustomModalBottomDragSheet(
                              paddingTop: 90.r,
                              context: context,
                              modal: (c) => const FilterPage(),
                            );
                          },
                          child: Icon(
                            Remix.sound_module_fill,
                            color: Style.black,
                            size: 20.r,
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: productsState.isLoading
                ? const LoadingList(
                    verticalPadding: 16,
                    itemBorderRadius: 12,
                    horizontalPadding: 12,
                    itemPadding: 10,
                    itemHeight: 100,
                  )
                : productsState.products.isEmpty
                    ? const NoItem(title: TrKeys.noProducts)
                    : filterState.selectType == LayoutType.twoV
                        ? TwoVBody(
                            list: productsState.products,
                            refreshController: oneController,
                            onLoading: () => onLoading(oneController),
                            onRefresh: () => onRefresh(oneController),
                            onDelete: onDelete,
                            onEdit: onEdit,
                          )
                        : filterState.selectType == LayoutType.twoH
                            ? TwoHBody(
                                list: productsState.products,
                                refreshController: simpleController,
                                onLoading: () => onLoading(simpleController),
                                onRefresh: () => onRefresh(simpleController),
                                onEdit: onEdit,
                              )
                            : filterState.selectType == LayoutType.threeH
                                ? ThreeHBody(
                                    list: productsState.products,
                                    refreshController: gridController,
                                    onLoading: () => onLoading(gridController),
                                    onRefresh: () => onRefresh(gridController),
                                    onEdit: onEdit,
                                  )
                                : VerticalListBody(
                                    list: productsState.products,
                                    refreshController: verticalController,
                                    onLoading: () =>
                                        onLoading(verticalController),
                                    onRefresh: () =>
                                        onRefresh(verticalController),
                                    onDelete: onDelete,
                                    onEdit: onEdit,
                                  ),
          ),
        ],
      ),
    );
  }

  onEdit(RefreshController refreshController, ProductData product) {
    ref.read(editFoodDetailsProvider.notifier).setProductDetails(product,
        (fullProduct) {
      ref.read(editFoodUnitsProvider.notifier).setFoodUnit(fullProduct?.unit);
      ref.read(editFoodBrandProvider.notifier).setFoodBrand(fullProduct?.brand);
      ref.read(productExtrasProvider.notifier).fetchGroups();
      ref.read(editFoodCategoriesProvider.notifier).setInitial(
          categories: ref.watch(foodCategoriesProvider).categories,
          category: fullProduct?.category);
      ref.read(editFoodStocksProvider.notifier).setInitialStocks(
          product: ref.read(editFoodDetailsProvider).product,
          groups: ref.read(productExtrasProvider).groups);
    });
    context.pushRoute(const EditProductRoute());
  }

  onDelete(int value) {
    return AppHelpers.showCustomModalBottomSheet(
      context: context,
      modal: DeleteProductModal(id: value),
    );
  }
}
