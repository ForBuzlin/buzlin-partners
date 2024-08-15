import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import '../styles/style.dart';

class CustomAppBar extends StatelessWidget {
  final Widget child;
  final double height;
  final double bottomPadding;
  final bool isShadow;
  final Color color;

  const CustomAppBar({
    super.key,
    required this.child,
    this.height = 110,
    required this.bottomPadding,
    this.isShadow = false,
     this.color=Style.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height.h,
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular((AppConstants.radius / 2).r),
          bottomRight: Radius.circular((AppConstants.radius / 2).r),
        ),
        boxShadow: isShadow
            ? const [
                BoxShadow(
                  color: Style.shadow,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ]
            : null,
      ),
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: REdgeInsets.only(left: 16, right: 16, bottom: bottomPadding),
        child: child,
      ),
    );
  }
}
