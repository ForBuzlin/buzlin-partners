// ignore_for_file: sdk_version_since
import 'package:auto_size_text/auto_size_text.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter/material.dart';

class FoodStockItem extends StatelessWidget {
  final Stocks? stock;
  final VoidCallback onDelete;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const FoodStockItem({
    super.key,
    required this.stock,
    required this.onDelete,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    final ProductData? product = stock?.stock?.product;
    return Container(
      margin: REdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radius.r),
        color: Style.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(AppConstants.radius.r),
            ),
            child: Stack(
              children: [
                CommonImage(
                  width: 110,
                  height: 128,
                  url: product?.img,
                  radius: 0,
                  errorRadius: 0,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Row(
                    children: [
                      for (var e in stock?.stock?.extras ?? [])
                        if (ExtrasType.color ==
                                AppHelpers.getExtraTypeByValue(e.group?.questions) &&
                            e.answers != AppHelpers.getNameColor(e.answers))
                          Container(
                            height: 24.r,
                            width: 24.r,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(
                                  int.parse('0xFF${e.answers.substring(1, 7)}')),
                            ),
                          ),
                    ],
                  ),
                ),
                if (stock?.bonus ?? false)
                  Positioned(
                      child: Container(
                    margin: EdgeInsets.only(top: 8.r, left: 8.r),
                    padding:
                        EdgeInsets.symmetric(vertical: 4.r, horizontal: 8.r),
                    decoration: BoxDecoration(
                        color: Style.primary,
                        borderRadius: BorderRadius.circular(100.r)),
                    child: Row(
                      children: [
                        Icon(
                          Remix.gift_line,
                          color: Style.white,
                          size: 16.r,
                        ),
                        4.horizontalSpace,
                        Text(
                          AppHelpers.getTranslation(TrKeys.bonus),
                          style:
                              Style.interNormal(color: Style.white, size: 12),
                        )
                      ],
                    ),
                  ))
              ],
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.translation?.title ?? "",
                  style: Style.interRegular(
                    size: 14,
                    color: Style.black,
                    letterSpacing: -0.3,
                  ),
                  maxLines: 2,
                ),
                4.verticalSpace,
                Wrap(
                  spacing: 0,
                  children: [
                    for (var e in stock?.stock?.extras ?? [])
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${e.group?.translation?.title ?? ''}:",
                            style: Style.interRegular(
                              size: 12,
                              color: Style.black,
                            ),
                          ),
                          2.horizontalSpace,
                          Text(
                            '${AppHelpers.getNameColor(e.answers)},',
                            style: Style.interRegular(
                              size: 12,
                              color: Style.black,
                            ),
                          ),
                          6.horizontalSpace,
                        ],
                      ),
                  ],
                ),
                2.verticalSpace,
                if ((stock?.bonus ?? false) == false)
                  ProductPriceWidget(product: product, stock: stock),
                8.verticalSpace,
                if (!(stock?.bonus ?? false))
                  Row(
                    children: [
                      CircleButton(
                        icon: Remix.subtract_line,
                        onTap: onDecrease,
                      ),
                      8.horizontalSpace,
                      Expanded(
                        child: AutoSizeText(
                          ' ${(stock?.quantity ?? 1) * (product?.interval ?? 1)} ${product?.unit?.translation?.title ?? ""}',
                          style: Style.interSemi(
                            size: 14,
                            color: Style.black,
                            letterSpacing: -0.3,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      8.horizontalSpace,
                      CircleButton(
                        icon: Remix.add_line,
                        onTap: onIncrease,
                      ),
                      12.horizontalSpace,
                      CircleButton(
                        icon: Remix.delete_bin_line,
                        onTap: onDelete,
                      ),
                    ],
                  ),
                if ((stock?.bonus ?? false))
                  AutoSizeText(
                    ' ${(stock?.quantity ?? 1) * (product?.interval ?? 1)} ${product?.unit?.translation?.title ?? ""}',
                    style: Style.interSemi(
                      size: 14,
                      color: Style.black,
                      letterSpacing: -0.3,
                    ),
                    maxLines: 1,
                  ),
                  8.verticalSpace,
              ],
            ),
          ),
          16.horizontalSpace,
        ],
      ),
    );
  }
}
