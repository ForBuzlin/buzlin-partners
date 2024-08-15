import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color iconColor;
  final Color borderColor;
  final double size;
  final double iconSize;
  final bool isShadow;
  final bool isLoading;

  const CustomActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = Style.primary,
    this.size = 48,
    this.iconSize = 24,
    this.iconColor = Style.white,
    this.borderColor = Style.transparent,
    this.isShadow = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: onPressed,
      child: Container(
        height: size.r,
        width: size.r,
        padding: REdgeInsets.all(4),
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: isShadow ? Style.greyShadow : [],
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(AppConstants.radius / 0.8),
        ),
        child: Center(
            child: isLoading
                ? Loading(
                    size: size ~/ 2,
                  )
                : Icon(
                    icon,
                    color: iconColor,
                    size: iconSize.r,
                  )),
      ),
    );
  }
}
