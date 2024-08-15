import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class LooksItem extends StatelessWidget {
  final LooksData look;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final int spacing;

  const LooksItem({
   super.key,
    required this.look,
    required this.onTap,
    this.spacing = 1,
    required this.onDelete,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
         borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
      ),
      margin: EdgeInsets.only(bottom: spacing.r),
      padding: REdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 4.r,
            height: 56.r,
            padding: REdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: look.active ?? false ? Style.green : Style.red,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular((AppConstants.radius/2).r),
                  bottomRight: Radius.circular((AppConstants.radius/2).r),
                )),
          ),
          12.horizontalSpace,
          CommonImage(
            width: 50,
            height: 52,
            url: look.img,
            errorRadius: 0,
            fit: BoxFit.cover,
          ),
          8.horizontalSpace,
          Expanded(
            child: Text(
              AppHelpers.getTranslation(look.translation?.title ?? ''),
              style: Style.interNormal(
                size: 14,
                letterSpacing: -0.3,
              ),
            ),
          ),
          8.horizontalSpace,
          Row(
            children: [
              CircleButton(
                onTap: onTap,
                icon: Remix.pencil_line,
              ),
              8.horizontalSpace,
              CircleButton(
                onTap: onDelete,
                icon: Remix.delete_bin_line,
              ),
            ],
          ),
          12.horizontalSpace,
        ],
      ),
    );
  }
}
