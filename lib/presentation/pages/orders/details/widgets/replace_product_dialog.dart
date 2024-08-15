import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class ReplaceProductDialog extends StatelessWidget {
  final Stocks? stocks;

  const ReplaceProductDialog({super.key, required this.stocks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _stockItem(stocks, isReplace: true),
        _stockItem(stocks),
        6.verticalSpace,
        const Divider(),
        Text(
          "${AppHelpers.getTranslation(TrKeys.note)}: ${stocks?.replaceNote ?? ''}",
          style: Style.interRegular(size: 14),
        ),
        12.verticalSpace,
        CustomButton(
            height: 40,
            radius: AppConstants.radius,
            title: TrKeys.ok,
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
  }

  _stockItem(Stocks? stock, {bool isReplace = false}) {
    if (!isReplace) {
      stock = stock?.copyWith(
        product: stock.stock?.product,
        extras: stock.stock?.extras,
        totalPrice: stock.stock?.totalPrice,
      );
    } else {
      stock = stock?.copyWith(
          product: stock.replaceStock?.product,
          extras: stock.replaceStock?.extras,
          totalPrice: stock.replaceStock?.totalPrice,
          quantity: stock.replaceQuantity);
    }
    return stock == null
        ? const SizedBox.shrink()
        : Column(
            children: [
              if (!isReplace) 10.verticalSpace,
              if (!isReplace)
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Expanded(child: Divider(color: Style.black)),
                      8.horizontalSpace,
                      Icon(Remix.swap_line, size: 24.r),
                      8.horizontalSpace,
                      const Expanded(child: Divider(color: Style.black)),
                    ],
                  ),
                ),
              Row(
                children: [
                  CommonImage(
                    url: (stock.galleries?.isNotEmpty ?? false)
                        ? stock.galleries?.first.path
                        : stock.product?.img,
                    height: 80,
                    width: 60,
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stock.product?.translation?.title ??
                              AppHelpers.getTranslation(TrKeys.unKnow),
                          style: Style.interNormal(size: 15),
                        ),
                        4.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${stock.quantity} x ${AppHelpers.numberFormat(number: stock.totalPrice)}',
                                style: Style.interRegular(size: 14),
                              ),
                            ),
                            Text(
                              ' ${AppHelpers.numberFormat(number: ((stock.totalPrice ?? 0) * (stock.quantity ?? 0)))}',
                              style: Style.interRegular(size: 14),
                            ),
                          ],
                        ),
                        2.verticalSpace,
                        Wrap(
                          children: [
                            for (var e in stock.extras ?? [])
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${e.group?.translation?.title}:",
                                    style: Style.interRegular(size: 12),
                                  ),
                                  2.horizontalSpace,
                                  Text(
                                    "${AppHelpers.getNameColor(e.answers)},",
                                    style: Style.interRegular(size: 12),
                                  ),
                                  6.horizontalSpace,
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
