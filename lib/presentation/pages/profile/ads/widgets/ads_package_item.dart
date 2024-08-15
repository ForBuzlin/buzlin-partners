import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class AdsPackagesItem extends StatelessWidget {
  final AdsPackage ads;
  final VoidCallback assign;

  const AdsPackagesItem({super.key, required this.ads, required this.assign})
      ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Style.white,
      ),
      padding: REdgeInsets.symmetric(vertical: 6),
      margin: REdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          6.horizontalSpace,
          CommonImage(
            height: 52,
            width: 52,
            url: ads.galleries?.isNotEmpty ?? false
                ? ads.galleries?.first.path
                : null,
          ),
          8.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ads.translation?.title ?? '',
                  style: Style.interNormal(size: 14),
                ),
                Text(
                  "${AppHelpers.numberFormat(number: ads.price)}  (${ads.time} ${ads.timeType})",
                  style: Style.interRegular(size: 14),
                ),
              ],
            ),
          ),
          SecondButton(title: TrKeys.assign, onTap: assign),
          12.horizontalSpace,
        ],
      ),
    );
  }
}
