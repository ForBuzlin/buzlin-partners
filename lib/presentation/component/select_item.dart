import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/style.dart';
import 'buttons/animation_button_effect.dart';

class SelectItem extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;
  final String title;

  const SelectItem({
   super.key,
    required this.onTap,
    required this.isActive,
    required this.title,
  }) ;

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: onTap,
      child: Column(
        children: [
          8.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 18.r,
                height: 18.r,
                margin: EdgeInsets.only(right: 10.r),
                decoration: BoxDecoration(
                  color: isActive ? Style.primary : Style.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: !isActive ? Style.textHint : Style.primary),
                ),
                child: Icon(
                  Remix.check_line,
                  color: Style.white,
                  size: 16.r,
                ),
              ),
              4.horizontalSpace,
              Text(
                title,
                style: Style.interNormal(
                  size: 14,
                  color: Style.black,
                ),
              ),
            ],
          ),
          12.verticalSpace,
          const Divider(color: Style.textHint)
        ],
      ),
    );
  }
}
