import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';

import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class BookingItem extends StatelessWidget {
  final BookingData booking;

  const BookingItem({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      child: GestureDetector(
        onTap: () =>
            context.pushRoute(BookingDetailsRoute(bookingData: booking)),
        child: Container(
          height: 112.h,
          width: double.infinity,
          margin: REdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(AppConstants.radius / 1.4.r),
          ),
          child: Row(
            children: [
              Container(
                width: 8,
                decoration: BoxDecoration(
                  color: AppHelpers.getStatusColor(booking.status),
                  borderRadius:
                  BorderRadius.horizontal(left: Radius.circular(AppConstants.radius / 1.4.r)),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Padding(
                  padding: REdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          CommonImage(
                            url: booking.user?.img,
                            radius: 20,
                            width: 40,
                            height: 40,
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  booking.user == null
                                      ? AppHelpers.getTranslation(
                                          TrKeys.deletedUser)
                                      : '${booking.user?.firstname ?? AppHelpers.getTranslation(TrKeys.noName)} ${booking.user?.lastname ?? ''}',
                                  style: Style.interRegular(
                                    size: 14,
                                    color: Style.black,
                                  ),
                                ),
                                4.verticalSpace,
                                Text(
                                  booking.serviceMaster?.service?.translation
                                          ?.title ??
                                      "",
                                  style: Style.interNormal(
                                    size: 12,
                                    color: Style.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      Divider(
                          color: Style.greyColor, thickness: 1.r, height: 1.r),
                      12.verticalSpace,
                      Flexible(
                        child: Row(
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: '№ ${booking.id ?? ''}',
                                  style: Style.interNormal(
                                    color: Style.black,
                                    size: 14,
                                    letterSpacing: -0.3,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' | ',
                                      style: Style.interNormal(
                                        color: Style.borderColor,
                                        size: 14,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                    TextSpan(
                                      text: DateService.dateFormatForBooking(
                                          [booking.startDate, booking.endDate]),
                                      style: Style.interNormal(
                                        color: Style.black,
                                        size: 14,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AutoSizeText(
                              AppHelpers.numberFormat(
                                  number: booking.totalPrice ??
                                      booking.giftCartPrice),
                              style: Style.interNormal(
                                  size: 14, color: Style.black),
                              maxLines: 1,
                              minFontSize: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              16.horizontalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
