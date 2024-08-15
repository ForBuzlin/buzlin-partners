import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import '../../component/components.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class OrderFoodItem extends StatelessWidget {
  final ProductData product;
  final Function() onTap;
  final int spacing;

  const OrderFoodItem({
   super.key,
    required this.product,
    required this.onTap,
    this.spacing = 1,
  }) ;

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(bottom: spacing.r),
          padding: REdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: Style.white, borderRadius: BorderRadius.circular(12.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CommonImage(
                  width: 110,
                  height: 106,
                  url: product.img,
                  radius: 8,
                  errorRadius: 0,
                  fit: BoxFit.fitWidth,
                ),
              ),
              8.verticalSpace,
              Expanded(
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          product.translation?.title ??
                              AppHelpers.getTranslation(TrKeys.unKnow),
                          style: Style.interNormal(
                            size: 14,
                            color: Style.black,
                            letterSpacing: -0.3,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 12,
                        ),
                      ),
                      6.verticalSpace,
                      ProductPriceWidget(
                        product: product,
                        stock: (product.stocks?.isNotEmpty ?? false)
                            ? product.stocks?.first
                            : null,
                      )
                    ],
                  ),
                ),
              ),
              8.verticalSpace,
              Divider(height: 8.r),
              Center(
                child: Padding(
                  padding: REdgeInsets.all(4),
                  child: (product.cartCount ?? 0) > 0
                      ? Text(
                          '${(product.cartCount ?? 1) * (product.interval ?? 1)} ${product.unit?.translation?.title ?? ""}',
                          style: Style.interNormal(size: 14),
                        )
                      : Text(
                          AppHelpers.getTranslation(TrKeys.addToCart),
                          style: Style.interNormal(
                            size: 14,
                            color: Style.black,
                            letterSpacing: -0.3,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
