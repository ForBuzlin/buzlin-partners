import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isActive;
  final VoidCallback? onTap;

  const CustomCheckbox({super.key, required this.isActive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: 24.r,
        height: 24.r,
        decoration: BoxDecoration(
            color: isActive ? Style.primary : Style.borderColor,
            borderRadius: BorderRadius.circular((AppConstants.radius / 2).r)),
        duration: const Duration(milliseconds: 500),
        child: isActive
            ? Icon(
                Remix.check_fill,
                color: Style.white,
                size: 18.r,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
