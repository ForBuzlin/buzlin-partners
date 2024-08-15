import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'statistic_item.dart';

class BookingStatistic extends StatelessWidget {
  final BookingReportsData? statistic;
  final bool isLoading;

  const BookingStatistic({
    super.key,
    required this.statistic,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  AppHelpers.getTranslation(TrKeys.bookingStatistics),
                  style: Style.interSemi(size: 18),
                ),
              ),
              Text(
                AppHelpers.getTranslation(TrKeys.last30day),
                style: Style.interNormal(size: 14, color: Style.textHint),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        SizedBox(
          height: 148.r,
          child: ListView(
            padding: REdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              StatisticItem(
                report: statistic?.bookingReportsDataNew,
                status: TrKeys.newKey,
                isLoading: isLoading,
              ),
              StatisticItem(
                report: statistic?.booked,
                status: TrKeys.booked,
                isLoading: isLoading,
              ),
              StatisticItem(
                report: statistic?.progress,
                status: TrKeys.progress,
                isLoading: isLoading,
              ),
              StatisticItem(
                report: statistic?.ended,
                status: TrKeys.ended,
                isLoading: isLoading,
              ),
              StatisticItem(
                report: statistic?.canceled,
                status: TrKeys.cancel,
                isLoading: isLoading,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
