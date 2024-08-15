import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';

import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class ExtrasItem extends StatelessWidget {
  final Group extras;
  final Function()? onTap;
  final bool isLast;

  const ExtrasItem({
   super.key,
    required this.extras,
    this.isLast = false,
    this.onTap,
  }) ;

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Style.transparent,
          padding: REdgeInsets.symmetric(vertical: 16),
          margin: REdgeInsets.only(right: 14),
          child: Row(
            children: [
              Icon(
                (extras.isChecked ?? false)
                    ? Remix.checkbox_circle_fill
                    : Remix.checkbox_blank_circle_line,
                color:
                    (extras.isChecked ?? false) ? Style.primary : Style.black,
                size: 24.r,
              ),
              4.horizontalSpace,
              Text(
                '${extras.translation?.title}',
                style: Style.interSemi(size: 14, letterSpacing: -0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
