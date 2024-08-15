import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/product_items/product_price_widget.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import '../buttons/circle_button.dart';

class ProductInfo extends StatelessWidget {
  final ProductData product;
  final double width;
  final VoidCallback onTap;

  const ProductInfo(
      {super.key, required this.product, this.width = 100, required this.onTap})
      ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.verticalSpace,
        Row(
          children: [
            SizedBox(
              width: width.r,
              child: Text(
                product.translation?.title ??
                    AppHelpers.getTranslation(TrKeys.unKnow),
                style: Style.interNormal(size: 16),
                maxLines: 1,
              ),
            ),
          ],
        ),
        4.verticalSpace,
        Row(
          children: [
            Expanded(
              child: ProductPriceWidget(
                product: product,
                stock: (product.stocks?.isNotEmpty ?? false)
                    ? product.stocks?.first
                    : null,
              ),
            ),
            Row(
              children: [
                CircleButton(
                  onTap: onTap,
                  icon: Remix.pencil_line,
                ),
                8.horizontalSpace,
              ],
            )
          ],
        ),
      ],
    );
  }
}
