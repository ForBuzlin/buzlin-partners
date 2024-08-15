import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class DiscountItem extends StatelessWidget {
  final DiscountData discountData;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final int spacing;

  const DiscountItem({
   super.key,
    required this.discountData,
    required this.onTap,
    this.spacing = 1,
    required this.onDelete,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
         borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
      ),
      margin: EdgeInsets.only(bottom: spacing.r),
      padding: REdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                width: 4.r,
                height: 56.r,
                padding: REdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: discountData.active! ? Style.green : Style.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    )),
              ),
              12.horizontalSpace,
              CommonImage(
                width: 50,
                height: 52,
                url: discountData.img,
                errorRadius: 0,
                fit: BoxFit.cover,
              ),
              8.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: AppHelpers.getTranslation(TrKeys.type),
                              style: Style.interSemi(
                                color: Style.black,
                                size: 13,
                                letterSpacing: -0.3,
                              ),
                              children: [
                                TextSpan(
                                  text: ' : ',
                                  style: Style.interNormal(
                                    color: Style.black,
                                    size: 13,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                TextSpan(
                                  text: AppHelpers.getTranslation(
                                      discountData.type ?? ''),
                                  style: Style.interNormal(
                                    color: Style.black,
                                    size: 12,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        8.horizontalSpace,
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: discountData.type == TrKeys.fix
                                  ? AppHelpers.getTranslation(TrKeys.price)
                                  : AppHelpers.getTranslation(TrKeys.percent),
                              style: Style.interSemi(
                                color: Style.black,
                                size: 13,
                                letterSpacing: -0.3,
                              ),
                              children: [
                                TextSpan(
                                  text: discountData.type == TrKeys.fix
                                      ? '(${LocalStorage.getSelectedCurrency()?.symbol}):'
                                      : "(%):",
                                  style: Style.interNormal(
                                    color: Style.black,
                                    size: 13,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${discountData.price ?? "0"}',
                                  style: Style.interNormal(
                                    color: Style.black,
                                    size: 12,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    4.verticalSpace,
                    Text(
                      '${DateService.dateFormat(discountData.start)} - ${DateService.dateFormat(discountData.end)}',
                      style: Style.interRegular(size: 12),
                    )
                  ],
                ),
              ),
              8.horizontalSpace,
              Row(
                children: [
                  CircleButton(
                    onTap: onTap,
                    icon: Remix.pencil_line,
                  ),
                  8.horizontalSpace,
                  CircleButton(
                    onTap: onDelete,
                    icon: Remix.delete_bin_line,
                  ),
                ],
              ),
              12.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
