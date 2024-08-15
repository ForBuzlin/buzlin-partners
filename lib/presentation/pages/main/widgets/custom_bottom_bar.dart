import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'bottom_item.dart';

class CustomBottomBar extends StatelessWidget {
  final ValueChanged<int> onTap;
  final int activeIndex;

  const CustomBottomBar({
    super.key,
    required this.onTap,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 56.r),
      child: Container(
        height: 60.r,
        decoration: BoxDecoration(
          color: Style.black,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.r,
            right: 16.r,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomItem(
                isActive: activeIndex == 0,
                selectSvg: Assets.svgSelectHome,
                svg: Assets.svgHome,
                onTap: () => onTap.call(0),
              ),
              BottomItem(
                isActive: activeIndex == 1,
                selectSvg: Assets.svgSelectCalendar,
                svg: Assets.svgCalendar,
                onTap: () => onTap.call(1),
              ),
              if (AppHelpers.getUserRole != TrKeys.master)
                BottomItem(
                  isActive: activeIndex == 2,
                  selectIcon: Remix.file_list_fill,
                  icon: Remix.file_list_line,
                  onTap: () => onTap.call(2),
                ),
              BottomItem(
                isActive: activeIndex == 3,
                selectSvg: Assets.svgProfile,
                svg: Assets.svgProfile,
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
