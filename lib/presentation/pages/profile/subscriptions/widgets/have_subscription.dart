import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class HaveSubscription extends StatelessWidget {
  const HaveSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    final subscription = LocalStorage.getShop()?.subscription?.subscription;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Style.white,
      ),
      padding: REdgeInsets.all(16),
      margin: REdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Text(
            AppHelpers.getTranslation(TrKeys.youHaveSubscription),
            style: Style.interNormal(size: 14),
          ),
          12.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subscription?.title ?? "",
                      style: Style.interNormal(size: 14),
                    ),
                    2.verticalSpace,
                    Text(
                      AppHelpers.numberFormat(number: subscription?.price),
                      style: Style.interSemi(size: 16),
                    ),
                    2.verticalSpace,
                    if (subscription?.withReport ?? false)
                      Text(
                        "+ ${AppHelpers.getTranslation(TrKeys.withReport)}",
                        style: Style.interRegular(size: 12, color: Style.green),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${subscription?.month ?? 0} ${TrKeys.month}",
                      style: Style.interRegular(size: 14),
                    ),
                    2.verticalSpace,
                    Text(
                      "${subscription?.productLimit ?? 0} ${AppHelpers.getTranslation(TrKeys.product).toLowerCase()}",
                      style: Style.interRegular(size: 14),
                    ),
                    2.verticalSpace,
                    Text(
                      "${subscription?.orderLimit ?? 0} ${AppHelpers.getTranslation(TrKeys.order).toLowerCase()}",
                      style: Style.interRegular(size: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          12.verticalSpace,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              DateService.dateFormatForNotification(
                  LocalStorage.getShop()?.subscription?.createdAt),
              style: Style.interNormal(size: 12, color: Style.textColor),
            ),
          ),
        ],
      ),
    );
  }
}
