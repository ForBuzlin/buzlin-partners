import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final UserData? user;
  final bool isSelected;
  final bool isEmail;
  final Function() onTap;

  const UserItem({
    super.key,
    required this.user,
    required this.onTap,
    required this.isSelected,
    this.isEmail = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 68.r,
        margin: REdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          color: isSelected ? Style.primary.withOpacity(0.1) : Style.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Container(
              margin: REdgeInsets.symmetric(vertical: 12),
              width: 4,
              decoration: ShapeDecoration(
                color: isSelected ? Style.primary : Style.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                ),
              ),
            ),
            12.horizontalSpace,
            Container(
              padding: REdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Style.black.withOpacity(0.05),
              ),
              child: CommonImage(
                url: user?.img,
                width: 40,
                height: 40,
                radius: 20,
                errorRadius: 20,
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${user?.firstname} ${user?.lastname ?? ''}',
                    style: Style.interSemi(size: 15),
                  ),
                  4.verticalSpace,
                  if(isEmail)
                  Text(
                    user?.email ?? '',
                    style: Style.interNormal(size: 12),
                  ),
                ],
              ),
            ),
            16.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
