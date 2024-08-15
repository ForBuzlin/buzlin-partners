import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class GridProductItem extends StatelessWidget {
  final ProductData product;
  final VoidCallback onTap;

  const GridProductItem({super.key, required this.product, required this.onTap})
      ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Style.icon),
                color: Style.shimmerBase),
            child: Stack(
              children: [
                CommonImage(
                  url: product.img ?? "",
                  height: 100,
                  width: 100,
                  radius: 20,
                ),
                if ((product.stocks?.isNotEmpty ?? false) &&
                    product.stocks?.first.discount != null)
                  Padding(
                    padding: EdgeInsets.all(12.r),
                    child: SvgPicture.asset(Assets.svgDiscount),
                  ),
              ],
            ),
          ),
          10.verticalSpace,
          Expanded(
            child: AutoSizeText(
              product.translation?.title ??
                  AppHelpers.getTranslation(TrKeys.unKnow),
              style: Style.interNormal(size: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              minFontSize: 12,
            ),
          ),
          12.verticalSpace,
          ProductPriceWidget(
            product: product,
            stock: (product.stocks?.isNotEmpty ?? false)
                ? product.stocks?.first
                : null,
          )
        ],
      ),
    );
  }
}
