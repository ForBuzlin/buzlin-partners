import 'package:readmore/readmore.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:venderuzmart/application/providers.dart';

import 'bottom_widget.dart';
import 'product_details_body.dart';
import 'product_extras.dart';

class ReplaceProductDetailsModal extends ConsumerStatefulWidget {
  final ProductData product;
  final ScrollController controller;

  const ReplaceProductDetailsModal({
   super.key,
    required this.product,
    required this.controller,
  }) ;

  @override
  ConsumerState<ReplaceProductDetailsModal> createState() =>
      _FoodDetailsModalState();
}

class _FoodDetailsModalState extends ConsumerState<ReplaceProductDetailsModal> {
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
    final orderNotifier = ref.read(orderDetailsProvider.notifier);
    final orderState = ref.watch(orderDetailsProvider);
    final cartState = ref.watch(orderCartProvider);
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
                    AppHelpers.getTranslation(TrKeys.replaceProduct),
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
              cartCount: orderState.stocks?.id == state.selectedStock?.id
                  ? orderState.quantity
                  : 0,
              decreaseStockCount: () => orderNotifier.decreaseStockCount(),
              increaseStockCount: () => orderNotifier.increaseStockCount(
                  state.selectedStock?.copyWith(product: state.productData)),
              product: state.productData,
            ),
          ],
        ),
      ),
    );
  }
}
