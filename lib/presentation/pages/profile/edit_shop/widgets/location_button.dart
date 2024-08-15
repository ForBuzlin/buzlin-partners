import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/app_helpers.dart';

import 'package:venderuzmart/presentation/styles/style.dart';

class LocationButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData icon;

  const LocationButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: Style.white, borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20.r,
            ),
            8.horizontalSpace,
            Text(
              AppHelpers.getTranslation(title),
              style: Style.interNormal(
                size: 14,
                color: Style.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
