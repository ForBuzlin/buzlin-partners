import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.r, left: 16.r, right: 16.r),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.r, horizontal: 22.r),
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateService.dateFormatForNotification(transaction.createdAt),
                style: Style.interNormal(color: Style.textHint, size: 12),
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppHelpers.getTranslation(TrKeys.sender),
                style: Style.interRegular(),
              ),
              Text(
                transaction.author?.firstname ?? "",
                style: Style.interRegular(),
              )
            ],
          ),
          if (transaction.note != null)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                6.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.note),
                      style: Style.interRegular(),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: Directionality(
                        textDirection:
                            LocalStorage.getLangLtr() == TextDirection.rtl
                                ? TextDirection.ltr
                                : TextDirection.rtl,
                        child: AutoSizeText(
                          transaction.note ?? "",
                          style: Style.interRegular(size: 14),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          12.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppHelpers.getTranslation(
                    transaction.transactionData?.tag ?? TrKeys.price),
                style: Style.interRegular(),
              ),
              Text(
                transaction.type == "withdraw"
                    ? "-${AppHelpers.numberFormat(number: transaction.price)}"
                    : AppHelpers.numberFormat(number: transaction.price),
                style: Style.interRegular(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
