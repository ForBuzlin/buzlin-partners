import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/app_constants.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'animation_button_effect.dart';

class MapButtons extends StatelessWidget {
  final VoidCallback zoomIn;
  final VoidCallback zoomOut;
  final VoidCallback navigate;

  const MapButtons(
      {super.key,
      required this.zoomIn,
      required this.zoomOut,
      required this.navigate})
      ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 88.r,
          width: 44.r,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Style.shadow,
                offset: Offset(0, 2),
                blurRadius: 2,
              )
            ],
            borderRadius: BorderRadius.circular(AppConstants.radius.r),
            color: Style.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: ButtonEffectAnimation(
                  onTap: zoomIn,
                  child: Icon(Icons.add, size: 21.r, color: Style.black),
                ),
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 6),
                child: Divider(
                  color: Style.colorGrey,
                  height: 6.r,
                ),
              ),
              Expanded(
                child: ButtonEffectAnimation(
                  onTap: zoomOut,
                  child: Icon(
                    Icons.remove,
                    size: 21.r,
                    color: Style.black,
                  ),
                ),
              )
            ],
          ),
        ),
        12.verticalSpace,
        ButtonEffectAnimation(
          onTap: navigate,
          child: Container(
            height: 44.r,
            width: 44.r,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Style.shadow,
                  offset: Offset(0, 2),
                  blurRadius: 2,
                )
              ],
              borderRadius: BorderRadius.circular(AppConstants.radius.r),
              color: Style.white,
            ),
            child: Icon(Remix.navigation_line, size: 20.r),
          ),
        )
      ],
    );
  }
}
