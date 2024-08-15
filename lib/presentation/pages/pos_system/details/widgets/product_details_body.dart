import 'package:auto_size_text/auto_size_text.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProductDetailsBody extends StatelessWidget {
  final Stocks? selectedStock;
  final ProductData product;

  const ProductDetailsBody({
    super.key,
    required this.selectedStock,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: REdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Style.semiGrey),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonImage(
            url: product.img,
            height: 80,
            width: 80,
          ),
          24.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  product.translation?.title ??
                      AppHelpers.getTranslation(TrKeys.unKnow),
                  style: Style.interRegular(
                    size: 14,
                    color: Style.black,
                    letterSpacing: -0.3,
                  ),
                  minFontSize: 12,
                  maxLines: 2,
                ),
                8.verticalSpace,
                Text(
                  (selectedStock?.quantity ?? 0) < 1
                      ? AppHelpers.getTranslation(TrKeys.outOfStock)
                      : "${AppHelpers.getTranslation(TrKeys.inStock)}-${selectedStock!.quantity! * (product.interval ?? 1)} ${product.unit?.translation?.title ?? ""}",
                  style: Style.interNormal(
                    size: 12,
                    color: (selectedStock?.quantity ?? 0) < 1
                        ? Style.red
                        : Style.green,
                    letterSpacing: -0.3,
                  ),
                ),
                8.verticalSpace,
                ProductPriceWidget(product: product, stock: selectedStock),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
