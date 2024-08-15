import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles/style.dart';
import 'animation_button_effect.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color backGroundColor;
  final TextStyle? textStyle;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.backGroundColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      child: Container(
          padding: REdgeInsets.symmetric(horizontal: 20),
          height: 38.r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.r),
              color: backGroundColor),
          child: Center(
              child: Text(
            text,
            style: textStyle ?? Style.interNormal(size: 14),
          ))),
    );
  }
}
