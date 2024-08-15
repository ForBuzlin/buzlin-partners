import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class GroupDetailExtrasItem extends StatelessWidget {
  final Extras extras;
  final String type;
  final Function() onEditTap;
  final Function() onDeleteTap;

  const GroupDetailExtrasItem({
   super.key,
    required this.extras,
    required this.onEditTap,
    required this.onDeleteTap,
    required this.type,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Style.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: REdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (type == TrKeys.color)
                  Row(
                    children: [
                      ColorItem(extras: extras),
                      8.horizontalSpace,
                    ],
                  ),
                Text(
                  AppHelpers.getNameColor(extras.value ?? ''),
                  style: Style.interRegular(
                    size: 15,
                    color: Style.black,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
            if (extras.group?.shopId == LocalStorage.getShop()?.id)
              Row(
                children: [
                  CircleButton(
                    icon: Remix.pencil_line,
                    onTap: onEditTap,
                  ),
                  20.horizontalSpace,
                  CircleButton(
                    icon: Remix.delete_bin_line,
                    onTap: onDeleteTap,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
