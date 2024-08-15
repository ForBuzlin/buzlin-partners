import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  final ActivityData? activity;

  const ActivityItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: Style.white,
          borderRadius: BorderRadius.circular(AppConstants.radius / 1.2)),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 48,
            margin: REdgeInsets.symmetric(vertical: 12),
            decoration: ShapeDecoration(
              color: AppHelpers.getStatusColor(activity?.type),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    activity?.note ?? '',
                    style: Style.interNormal(size: 15),
                  ),
                  Text(
                    DateService.dateFormatMDYHm(activity?.updatedAt),
                    style: Style.interNormal(size: 12, color: Style.textHint),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
