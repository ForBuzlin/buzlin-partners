import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class OrderProductItem extends StatelessWidget {
  final Stocks? stock;
  final bool isLast;
  final bool isLoading;
  final VoidCallback? onEdit;
  final VoidCallback? onShowReplace;

  const OrderProductItem({
    super.key,
    required this.stock,
    required this.isLoading,
    this.isLast = false,
    required this.onEdit,
    this.onShowReplace,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.verticalSpace,
        Padding(
          padding: REdgeInsets.only(right: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stock?.stock?.product?.translation?.title ??
                                AppHelpers.getTranslation(TrKeys.unKnow),
                            style:
                                Style.interSemi(size: 14, color: Style.black),
                          ),
                          4.verticalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${AppHelpers.getTranslation(TrKeys.amount)} — ${stock?.quantity} x ${AppHelpers.numberFormat(number: stock?.stock?.totalPrice)}',
                                style: Style.interRegular(
                                  size: 14,
                                  color: Style.black,
                                ),
                              ),
                              4.verticalSpace,
                              Wrap(
                                children: [
                                  for (var e in stock?.stock?.extras ?? [])
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${e.group?.translation?.title}:",
                                          style: Style.interRegular(
                                            size: 14,
                                            color: Style.black,
                                          ),
                                        ),
                                        2.horizontalSpace,
                                        Text(
                                          "${AppHelpers.getNameColor(e.answers)},",
                                          style: Style.interRegular(
                                            size: 14,
                                            color: Style.black,
                                          ),
                                        ),
                                        6.horizontalSpace,
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    8.horizontalSpace,

                    Column(
                      children: [
                        if (stock?.bonus ?? false)
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.r, horizontal: 8.r),
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
                                  style: Style.interNormal(
                                      color: Style.white, size: 12),
                                )
                              ],
                            ),
                          ),
                        if (onEdit != null)
                          CircleButton(
                            icon: Remix.pencil_line,
                            onTap: onEdit!,
                          ),
                        6.verticalSpace,
                        if (stock?.replaceStock != null)
                          CircleButton(
                            icon: Remix.eye_line,
                            onTap: () {
                              onShowReplace?.call();
                            },
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        if (!isLast)
          Divider(thickness: 1.r, height: 1.r, color: Style.greyColor),
      ],
    );
  }
}
