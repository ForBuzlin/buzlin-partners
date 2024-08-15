import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? icon;
  final String title;
  final bool isLoading;
  final bool active;
  final Function()? onPressed;
  final Color background;
  final Color borderColor;
  final Color textColor;
  final double? width;
  final double? height;
  final double radius;

  const CustomButton({
   super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.background = Style.primary,
    this.textColor = Style.white,
    this.width,
    this.height = 48,
    this.radius = AppConstants.radius,
    this.icon,
    this.borderColor = Style.transparent,
    this.active = true,
  }) ;

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: !isLoading ? onPressed : null,
      child: Container(
        width: width?.r,
        height: height?.h,
        decoration: BoxDecoration(
          color: onPressed == null
              ? Style.greyColor
              : active
                  ? background
                  : background.withOpacity(0.5),
          border: Border.all(
            color: onPressed == null ? Style.greyColor : borderColor,
            width: 1.r,
          ),
          borderRadius: BorderRadius.circular(radius.r),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? const Loading(color: Style.white, size: 24)
            : (icon == null
                ? Text(
                    AppHelpers.getTranslation(title),
                    style: Style.interNormal(
                      size: 15,
                      color: onPressed == null ? Style.textColor : textColor,
                      letterSpacing: -14 * 0.01,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon!,
                      16.horizontalSpace,
                      Text(
                        AppHelpers.getTranslation(title),
                        style: Style.interNormal(size: 16, color: Style.white),
                      ),
                    ],
                  )),
      ),
    );
  }
}
