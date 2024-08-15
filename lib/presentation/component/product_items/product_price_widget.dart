import 'package:auto_size_text/auto_size_text.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ProductPriceWidget extends StatelessWidget {
  final ProductData? product;
  final Stocks? stock;

  const ProductPriceWidget({super.key, required this.product, this.stock})
      ;

  @override
  Widget build(BuildContext context) {
    bool isOutOfStock;
    isOutOfStock = (stock?.quantity ?? 0) == 0;
    final bool hasDiscount = isOutOfStock
        ? false
        : (stock?.discount != null && (stock?.discount ?? 0) > 0);
    return isOutOfStock
        ? Text(
            AppHelpers.getTranslation(TrKeys.outOfStock),
            style: Style.interSemi(
              size: 14,
              color: Style.red,
              letterSpacing: -0.3,
            ),
          )
        : (hasDiscount
            ? AppHelpers.numberFormat(number: stock?.price ?? 0).length < 6
                ? Row(
                    children: [
                      Text(
                        AppHelpers.numberFormat(number: (stock?.price ?? 0) + (stock?.discount ?? 0)),
                        style: Style.interSemi(size: 14),
                      ),
                      if (stock?.discount != null)
                        Padding(
                          padding: EdgeInsets.only(left: 10.r),
                          child: Text(
                            AppHelpers.numberFormat(number: stock?.price  ?? 0),
                            style: Style.interSemi(
                                color: Style.red,
                                size: 12,
                                decoration: TextDecoration.lineThrough),
                            maxLines: 1,
                          ),
                        ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (stock?.discount != null)
                        Padding(
                          padding: EdgeInsets.only(right: 10.r),
                          child: AutoSizeText(
                            AppHelpers.numberFormat(number: (stock?.price ?? 0) + (stock?.discount ?? 0)),
                            style: Style.interSemi(
                                color: Style.red,
                                size: 12,
                                decoration: TextDecoration.lineThrough),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 12,
                          ),
                        ),
                      AutoSizeText(
                        AppHelpers.numberFormat(number: stock?.price ?? 0),
                        style: Style.interSemi(size: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 14,
                      ),
                    ],
                  )
            : AutoSizeText(
                AppHelpers.numberFormat(number: stock?.price ?? 0),
                style: Style.interSemi(
                  size: 14,
                  color: Style.black,
                  letterSpacing: -0.3,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                minFontSize: 14,
              ));
  }
}
