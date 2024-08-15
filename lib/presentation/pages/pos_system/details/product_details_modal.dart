import 'package:readmore/readmore.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:venderuzmart/application/providers.dart';
import 'widgets/product_details_body.dart';
import 'widgets/product_extras.dart';
import 'widgets/bottom_widget.dart';

class ProductDetailsModal extends ConsumerStatefulWidget {
  final ProductData product;
  final ScrollController controller;

  const ProductDetailsModal({
   super.key,
    required this.product,
    required this.controller,
  }) ;

  @override
  ConsumerState<ProductDetailsModal> createState() => _FoodDetailsModalState();
}

class _FoodDetailsModalState extends ConsumerState<ProductDetailsModal> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(productDetailProvider.notifier).setProduct(
            widget.product,
            ref.watch(orderCartProvider).selectedBagIndex,
          ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productDetailProvider);
    final notifier = ref.read(productDetailProvider.notifier);
    final cartState = ref.watch(orderCartProvider);
    final cartNotifier = ref.read(orderCartProvider.notifier);
    final orderProductNotifier = ref.read(orderProductsProvider.notifier);
    return ModalWrap(
      body: SingleChildScrollView(
        controller: widget.controller,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ModalDrag(),
                  Text(
                    AppHelpers.getTranslation(TrKeys.addExtraProducts),
                    style: Style.interNormal(
                      size: 16,
                      color: Style.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                  16.verticalSpace,
                  ProductDetailsBody(
                    selectedStock: state.selectedStock,
                    product: state.productData ?? widget.product,
                  ),
                  16.verticalSpace,
                  ReadMoreText(
                    widget.product.translation?.description ?? '',
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText:
                        AppHelpers.getTranslation(TrKeys.showMore),
                    trimExpandedText:
                        " ${AppHelpers.getTranslation(TrKeys.showLess)}",
                    lessStyle: Style.interRegular(
                        size: 14, textDecoration: TextDecoration.underline),
                    moreStyle: Style.interRegular(
                        size: 14, textDecoration: TextDecoration.underline),
                    style: Style.interRegular(size: 14),
                  ),
                  16.verticalSpace,
                  ProductExtras(
                    types: state.typedExtras,
                    notifier: notifier,
                    bagIndex: cartState.selectedBagIndex,
                  ),
                  16.verticalSpace,
                ],
              ),
            ),
            BottomWidget(
              cartCount: state.selectedStock?.cartCount,
              decreaseStockCount: () => notifier.decreaseStockCount(
                  context, cartState.selectedBagIndex, (stocks) {
                orderProductNotifier.updateProducts(cartStocks: stocks);
                cartNotifier.fetchCarts();
              }),
              increaseStockCount: () => notifier.increaseStockCount(
                  context, cartState.selectedBagIndex, (stocks) {
                orderProductNotifier.updateProducts(cartStocks: stocks);
                cartNotifier.fetchCarts();
              }),
              product: state.productData,
            ),
          ],
        ),
      ),
    );
  }
}
