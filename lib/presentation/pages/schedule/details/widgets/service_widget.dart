import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  final BookingData? bookingData;
  final String? title;

  const ServiceWidget({super.key, required this.bookingData, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            AppHelpers.getTranslation(title!),
            style: Style.interNormal(),
          ),
        4.verticalSpace,
        Container(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Style.textHint),
              borderRadius: BorderRadius.circular(AppConstants.radius)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookingData?.serviceMaster?.service?.translation?.title ??
                          AppHelpers.getTranslation(TrKeys.unKnow),
                    ),
                    8.verticalSpace,
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        _serviceItems(
                          "${AppHelpers.getTranslation(TrKeys.from)} ${AppHelpers.numberFormat(number: bookingData?.price)}",
                        ),
                        _serviceItems(
                          "${bookingData?.serviceMaster?.interval ?? 0} ${AppHelpers.getTranslation(TrKeys.minute)}",
                        ),
                        _serviceItems(
                          DateService.timeFormatForBooking(
                              [bookingData?.startDate, bookingData?.endDate]),
                        ),
                        if (bookingData?.serviceMaster?.type != null)
                          _serviceItems(
                            AppHelpers.getTranslation(
                                bookingData?.serviceMaster?.type ?? ""),
                          ),
                        if (bookingData?.serviceMaster?.gender != null &&
                            bookingData?.serviceMaster?.gender != TrKeys.all)
                          _serviceItems(
                            AppHelpers.getTranslation(
                                bookingData?.serviceMaster?.gender ?? ""),
                          ),
                        ...?bookingData?.extras?.map(
                          (e) => _serviceItems(
                            "${e.translation?.title ?? " "} ${AppHelpers.numberFormat(number: e.price)}",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        4.verticalSpace,
      ],
    );
  }

  _serviceItems(String title) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(color: Style.textHint)),
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
      child: Text(
        title,
        style: Style.interNormal(color: Style.textHint, size: 12),
      ),
    );
  }
}
