import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class DashboardItem extends StatelessWidget {
  final String title;
  final num? count;
  final num? price;
  final String? svg;
  final IconData? icon;
  final bool isLoading;
  final Color color;
  final VoidCallback? onTap;

  const DashboardItem({
    super.key,
    required this.title,
    this.icon,
    required this.isLoading,
    this.count,
    this.price,
    this.onTap,
    this.svg,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        margin: REdgeInsets.only(right: 12),
        padding: REdgeInsets.all(10.r),
        width: 132.r,
        decoration: BoxDecoration(
          color: Style.white,
          border: Border.all(color: Style.borderColor),
          borderRadius: BorderRadius.circular((AppConstants.radius / 1.4).r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: color.withOpacity(.2),
              child:  svg != null
                      ? SvgPicture.asset(
                          svg!,
                          height: 20.r,
                          width: 20.r,
                          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                        )
                      : Icon(
                          icon,
                          size: 20.r,
                          color: color,
                        ),
            ),
            4.verticalSpace,
            AutoSizeText(
              AppHelpers.getTranslation(title),
              minFontSize: 14,
              maxLines: 1,
              style: Style.interNormal(size: 14, color: Style.textColor),
            ),
            isLoading
                ? Container(
                    height: 20.r,
                    width: 56.r,
                    decoration: BoxDecoration(
                      color: Style.shimmerBase,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  )
                : Row(
                    children: [
                      Text(
                        price != null
                            ? AppHelpers.numberFormat(
                                number: price,
                                decimalDigits: 0,
                              )
                            : "${count ?? 0}",
                        style: Style.interSemi(size: 20),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
