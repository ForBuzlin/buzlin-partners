import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/data/payment_reports_data.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class SummaryItem extends StatelessWidget {
  final PaymentReportData? summary;
  const SummaryItem({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Style.white,
          border: Border.all(color: Style.borderColor),
          borderRadius: BorderRadius.circular((AppConstants.radius / 1.4).r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              AppHelpers.getTranslation(TrKeys.summary),
              style: Style.interNormal(size: 14, color: Style.textColor),
            ),
            8.verticalSpace,
            _priceItem(key: TrKeys.total, value: summary?.totalPrice),
            _priceItem(key: TrKeys.progress, value: summary?.progressPrice),
            _priceItem(key: TrKeys.paid, value: summary?.paidPrice),
            _priceItem(key: TrKeys.canceled, value: summary?.canceledPrice),
            _priceItem(key: TrKeys.rejected, value: summary?.rejectedPrice),
            _priceItem(key: TrKeys.refund, value: summary?.refundPrice),
          ],
        ),
      ),
    );
  }
  _priceItem({required String key, required num? value}) {
    return Padding(
      padding: REdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "${AppHelpers.getTranslation(key)}:",
              style: Style.interRegular(size: 14),
            ),
          ),
          Text(
            " ${AppHelpers.numberFormat(number: value)}",
            style: Style.interNormal(size: 14),
          ),
        ],
      ),
    );
  }

}
