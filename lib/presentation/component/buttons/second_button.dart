import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SecondButton extends StatelessWidget {
  final String title;
  final double radius;
  final Color bgColor;
  final Color titleColor;
  final double titleSize;
  final bool isLoading;
  final bool active;
  final VoidCallback onTap;
  final Widget? prefix;

  const SecondButton({
    super.key,
    required this.title,
    this.radius = AppConstants.radius * 1.2,
    this.bgColor = Style.primary,
    this.titleColor = Style.white,
    required this.onTap,
    this.titleSize = 13,
    this.prefix,
    this.active = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      disabled: active,
      onTap: active
          ? isLoading
              ? null
              : onTap
          : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.r),
          color: active ? bgColor : bgColor.withOpacity(0.9),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 16.r),
        child: isLoading
            ? Loading(
                color: bgColor == Style.primary ? Style.white : null,
                size: 16,
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (prefix != null) prefix!,
                  if (prefix != null) 6.horizontalSpace,
                  Text(
                    AppHelpers.getTranslation(title),
                    style: Style.interSemi(color: titleColor, size: titleSize),
                  ),
                ],
              ),
      ),
    );
  }
}
