import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'product_info.dart';

class OneProductItem extends StatelessWidget {
  final ProductData product;

  const OneProductItem({super.key, required this.product}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.r),
      child: GestureDetector(
        onTap: () {
          // AppRoute.goProductPage(context: context, product: product);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.radius.r),
            color: Style.transparent,
            border: Border.all(color: Style.icon),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 180.h,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppConstants.radius.r),
                          topLeft: Radius.circular(AppConstants.radius.r)),
                      child: CommonImage(
                          url: product.img ?? "",
                          height: 180,
                          width: double.infinity,
                          radius: 0),
                    ),
                    SizedBox(
                      height: 180.r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              16.horizontalSpace,
                              if (product.stocks?.first.discount != null)
                                SvgPicture.asset(Assets.svgDiscount),
                              const Spacer(),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.r),
                child: ProductInfo(
                  product: product,
                  width: MediaQuery.sizeOf(context).width - 200.w,
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
