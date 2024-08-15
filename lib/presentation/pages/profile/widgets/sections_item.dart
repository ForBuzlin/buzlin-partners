import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class SectionsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SectionsItem({
   super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: REdgeInsets.symmetric(vertical: 20),
        color: Style.transparent,
        child: Row(
          children: [
            Icon(icon, size: 21.r),
            16.horizontalSpace,
            Text(
              title,
              style: Style.interRegular(size: 16, color: Style.black),
            )
          ],
        ),
      ),
    );
  }
}
