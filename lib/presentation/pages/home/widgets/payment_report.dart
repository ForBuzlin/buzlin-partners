import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/data/payment_reports_data.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class PaymentReport extends StatelessWidget {
  final List<PaymentReportData> payments;

  const PaymentReport({super.key, required this.payments});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Text(
            AppHelpers.getTranslation(TrKeys.bookingPayments),
            style: Style.interSemi(size: 18),
          ),
        ),
        16.verticalSpace,
        SizedBox(
          height: 154.h,
          child: ListView.builder(
              padding: REdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: payments.length,
              itemBuilder: (context, index) {
                return _paymentItem(payments[index]);
              }),
        ),
      ]),
    );
  }
}

_paymentItem(PaymentReportData payment) {
  return Padding(
    padding: REdgeInsets.only(right: 12),
    child: Container(
      width: 164.w,
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
            AppHelpers.getTranslation(payment.paymentName ?? ''),
            style: Style.interNormal(size: 14, color: Style.textColor),
          ),
          2.verticalSpace,
          _priceItem(key: TrKeys.progress, value: payment.progressPrice),
          _priceItem(key: TrKeys.paid, value: payment.paidPrice),
          _priceItem(key: TrKeys.canceled, value: payment.canceledPrice),
          _priceItem(key: TrKeys.rejected, value: payment.rejectedPrice),
          _priceItem(key: TrKeys.refund, value: payment.refundPrice),
        ],
      ),
    ),
  );
}

_priceItem({required String key, required num? value}) {
  return Row(
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
  );
}
