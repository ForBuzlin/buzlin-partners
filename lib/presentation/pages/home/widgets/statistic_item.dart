import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class StatisticItem extends StatelessWidget {
  final ReportData? report;
  final String status;
  final bool isLoading;

  const StatisticItem({
    super.key,
    required this.report,
    required this.status,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(right: 12),
      child: Container(
        width: 132.r,
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
            Container(
              height: 48.r,
              width: 48.r,
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppHelpers.getStatusColor(status).withOpacity(0.2),
              ),
              child: CircularPercentIndicator(
                radius: 24.r,
                lineWidth: 4.r,
                percent: (report?.percent?.floor() ?? 0) / 100,
                center: Text(
                  "${report?.percent?.floor() ?? 0}%",
                  style: Style.interNormal(size: 14),
                ),
                progressColor: AppHelpers.getStatusColor(status),
                backgroundColor: Style.transparent,
                circularStrokeCap: CircularStrokeCap.round,
                rotateLinearGradient: true,
              ),
            ),
            4.verticalSpace,
            Text(
              '${AppHelpers.getTranslation(status)} (${report?.count ?? 0})',
              style: Style.interNormal(size: 14, color: Style.textColor),
            ),
            isLoading
                ? Container(
                    height: 20.r,
                    width: 56.r,
                    decoration: BoxDecoration(
                      color: Style.shimmerBase,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  )
                : Text(
                    AppHelpers.numberFormat(number: report?.totalPrice),
                    style: Style.interSemi(size: 20),
                  ),
          ],
        ),
      ),
    );
  }
}
