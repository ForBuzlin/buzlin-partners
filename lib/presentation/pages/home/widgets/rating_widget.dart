import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:remixicon/remixicon.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class RatingWidget extends StatelessWidget {
  final num? rAvg;
  const RatingWidget({super.key, required this.rAvg});

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        context.pushRoute(const CommentsRoute());
      },
      child: Stack(
        children: [
          Container(
            height: 120.r,
            width: MediaQuery.sizeOf(context).width / 3,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Style.blackBanner.withOpacity(0.4),
                  offset: const Offset(0.1, 0.9),
                  blurRadius: 10.0,
                  spreadRadius: 0.1,
                ), //BoxShadow
              ],
              borderRadius: BorderRadius.circular((AppConstants.radius/1.2).r),
              color: Style.blackBanner,
            ),
          ),
          Positioned(
            bottom: 18.r,
            left: 18.r,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Remix.star_smile_fill,
                  color: Style.starColor,
                  size: 16.r,
                ),
                10.horizontalSpace,
                Text(
                  "${rAvg ?? LocalStorage.getShop()?.rAvg ?? 0}\n${AppHelpers.getTranslation(TrKeys.rating)}",
                  style: Style.interSemi(size: 16, color: Style.white),
                ),
              ],
            ),
          ),
          Positioned(
            top: 3.r,
            right: 2.r,
            child: Image.asset(Assets.imageStarForBanner),
          ),
        ],
      ),
    );
  }
}
