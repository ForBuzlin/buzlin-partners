import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class BottomItem extends StatelessWidget {
  final bool isActive;
  final String? selectSvg;
  final IconData? selectIcon;
  final String? svg;
  final IconData? icon;
  final String? image;
  final String? name;
  final VoidCallback onTap;

  const BottomItem({
    super.key,
    required this.isActive,
    required this.onTap,
    this.image,
    this.svg,
    this.icon,
    this.selectSvg,
    this.name,
    this.selectIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonEffectAnimation(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(top: 16.r),
          child: Column(
            children: [
              if (svg != null && selectSvg != null)
                SvgPicture.asset(
                  isActive ? selectSvg! : svg!,
                  height: 24.r,
                  // colorFilter: const ColorFilter.mode(Style.white, BlendMode.srcIn)
                ),
              if (icon != null && selectIcon != null)
                Icon(
                  isActive ? selectIcon! : icon!,
                  size: 24.r,
                  color: Style.white,
                ),
              const Spacer(),
              if (isActive)
                Container(
                  width: 24.r,
                  height: 4.r,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100.r),
                          topLeft: Radius.circular(100.r)),
                      color: Style.primary),
                )
            ],
          ),
        ),
      ),
    );
  }
}
