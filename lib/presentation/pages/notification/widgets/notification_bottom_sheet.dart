import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class NotificationBottomSheetSheet extends StatelessWidget {
  final NotificationData notification;

  const NotificationBottomSheetSheet({super.key, required this.notification})
      ;

  @override
  Widget build(BuildContext context) {
    return BlurWrap(
      radius: BorderRadius.only(
        topRight: Radius.circular(24.r),
        topLeft: Radius.circular(24.r),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Style.bg,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.verticalSpace,
            Text(
              notification.title ?? "",
              style: Style.interSemi(size: 22),
            ),
            16.verticalSpace,
            Text(
              notification.body ?? "",
              style: Style.interRegular(size: 16),
            ),
            32.verticalSpace
          ],
        ),
      ),
    );
  }
}
