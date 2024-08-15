import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'package:venderuzmart/application/providers.dart';
import 'notification_bottom_sheet.dart';

class NotificationItem extends StatelessWidget {
  final NotificationData notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.12,
        motion: const ScrollMotion(),
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final notifier = ref.read(notificationProvider.notifier);
                return GestureDetector(
                  onTap: () {
                    Slidable.of(context)?.close();
                    if (notification.readAt == null) {
                      notifier.readOne(context, notification.id);
                    }
                  },
                  child: Container(
                    width: 50.r,
                    height: 72.r,
                    decoration: BoxDecoration(
                      color: Style.textColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppConstants.radius.r),
                        bottomRight: Radius.circular(AppConstants.radius.r),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Remix.mail_open_fill,
                      color: Style.white,
                      size: 24.r,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.12,
        motion: const ScrollMotion(),
        children: [
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                return GestureDetector(
                  onTap: () {
                    final notifier = ref.read(notificationProvider.notifier);
                    notifier.deleteNotification(id: notification.id);
                    Slidable.of(context)?.close();
                  },
                  child: Container(
                    width: 50.r,
                    height: 72.r,
                    decoration: BoxDecoration(
                      color: Style.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppConstants.radius.r),
                        bottomLeft: Radius.circular(AppConstants.radius.r),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Remix.delete_bin_line,
                      color: Style.white,
                      size: 24.r,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      child: Consumer(builder: (context, ref, child) {
        final notifier = ref.read(notificationProvider.notifier);
        return ButtonEffectAnimation(
          onTap: () {
            if (notification.readAt == null) {
              notifier.readOne(context, notification.id);
            }
            if (notification.data?.type == 'new_booking' ||
                notification.type == 'booking') {
              context.pushRoute(
                BookingDetailsRoute(
                  bookingData: notification.bookingData ??
                      BookingData(id: notification.modelId),
                ),
              );
              return;
            }
            if (notification.data?.type == AppConstants.newOrder ||
                notification.data?.type == AppConstants.statusChanged &&
                    notification.type != 'shop') {
              context.pushRoute(
                OrderDetailsRoute(
                  order: notification.orderData ??
                      OrderData(id: notification.modelId),
                ),
              );
              return;
            }

            if (notification.data?.type == AppConstants.newsPublish) {
              // AppRoute.goBlogBottomSheet(
              //     context, BlogData(id: notification.modelId));
              return;
            }
            AppHelpers.showCustomModalBottomSheet(
              context: context,
              modal: NotificationBottomSheetSheet(notification: notification),
            );
          },
          child: Container(
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
                      DateService.dateFormatForNotification(
                          notification.createdAt),
                      style:
                          Style.interNormal(color: Style.textColor, size: 12),
                    ),
                    if (notification.readAt == null)
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Style.primary,
                        ),
                        width: 10.r,
                        height: 10.r,
                      )
                  ],
                ),
                10.verticalSpace,
                Text(
                  notification.body ?? "",
                  style: Style.interNormal(size: 15),
                  maxLines: 2,
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
