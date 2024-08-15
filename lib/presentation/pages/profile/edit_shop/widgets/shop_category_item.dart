import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

import 'package:venderuzmart/presentation/styles/style.dart';

class EditShopCategoryItem extends StatelessWidget {
  final ShopCategoryData shopCategoryData;
  final Function() onTap;
  final bool isSelected;

  const EditShopCategoryItem({
   super.key,
    required this.shopCategoryData,
    required this.onTap,
    required this.isSelected,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: REdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 18.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                      color: isSelected ? Style.primary : Style.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? Style.black : Style.textColor,
                        width: isSelected ? 4 : 2,
                      ),
                    ),
                  ),
                  16.horizontalSpace,
                  Text(
                    '${shopCategoryData.translation?.title}',
                    style: Style.interRegular(
                      size: 15,
                      color: Style.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
