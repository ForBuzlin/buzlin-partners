import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'product_info.dart';

class ProductItem extends StatelessWidget {
  final ProductData product;
  final double height;
  final double width;
  final VoidCallback onTap;

  const ProductItem({
   super.key,
    required this.product,
    this.height = 220,
    this.width = 228,
    required this.onTap,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(color: Style.icon),
            color: Style.shimmerBase,
          ),
          child: Stack(
            children: [
              CommonImage(
                url: product.img ?? "",
                height: height,
                width: width,
                radius: 24,
              ),
              SizedBox(
                height: height.r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        16.horizontalSpace,
                        if ((product.stocks?.isNotEmpty ?? false) &&
                            product.stocks?.first.discount != null)
                          SvgPicture.asset(Assets.svgDiscount),
                        const Spacer(),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
        ProductInfo(
          product: product,
          onTap: onTap,
        )
      ],
    );
  }
}
