import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ApplyButton extends StatelessWidget {
  final String title;
  final double radius;
  final Color bgColor;
  final Color titleColor;
  final double titleSize;
  final bool isLoading;
  final VoidCallback onTap;
  final Widget? prefix;

  const ApplyButton(
      {super.key,
      required this.title,
      this.radius = 36,
      this.bgColor = Style.primary,
      this.titleColor = Style.white,
      required this.onTap,
      this.titleSize = 14,
      this.prefix,
      required this.isLoading})
      ;

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: isLoading ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.r),
          color: bgColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 16.r),
        child: isLoading
            ? Padding(
                padding: REdgeInsets.symmetric(horizontal: 8),
                child: const Loading(
                  size: 24,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (prefix != null) prefix!,
                  if (prefix != null) 6.horizontalSpace,
                  Text(
                    AppHelpers.getTranslation(title),
                    style:
                        Style.interNormal(color: titleColor, size: titleSize),
                  ),
                ],
              ),
      ),
    );
  }
}
