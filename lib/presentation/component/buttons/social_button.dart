import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/styles/style.dart';

import '../loading/loading.dart';
import 'animation_button_effect.dart';

class SocialButton extends StatelessWidget {
  final IconData iconData;
  final Function() onPressed;
  final String title;
  final bool isLoading;

  const SocialButton({
   super.key,
    required this.iconData,
    required this.onPressed,
    required this.title,
    this.isLoading = false,
  }) ;

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          constraints: BoxConstraints(minWidth: 96.r, minHeight: 36.r),
          decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Style.textColor,
                size: 16.r,
              ),
              8.horizontalSpace,
              isLoading
                  ? const Loading()
                  : Text(
                      title,
                      style: Style.interNormal(
                        size: 12,
                        color: Style.textColor,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
