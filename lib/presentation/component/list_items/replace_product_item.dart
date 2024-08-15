import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import '../../component/components.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class ReplaceProductItem extends StatelessWidget {
  final ProductData product;
  final Function() onTap;
  final int spacing;

  const ReplaceProductItem({
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
          decoration: BoxDecoration(
              color: Style.white, borderRadius: BorderRadius.circular(12.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CommonImage(
                  width: 112,
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
                          maxLines: 2,
                          minFontSize: 14,
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
            ],
          ),
        ),
      ),
    );
  }
}
