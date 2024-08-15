import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class FoodBrandItem extends StatelessWidget {
  final Brand brand;
  final Function() onTap;
  final bool isSelected;

  const FoodBrandItem({
   super.key,
    required this.brand,
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
                  Container(
                    width: 18.r,
                    height: 18.r,
                    margin: EdgeInsets.only(right: 10.r),
                    decoration: BoxDecoration(
                      color: isSelected ? Style.primary : Style.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: !isSelected ? Style.textHint : Style.primary),
                    ),
                    child: Icon(
                      Remix.check_line,
                      color: Style.white,
                      size: 16.r,
                    ),
                  ),
                  16.horizontalSpace,
                  Text(
                    '${brand.title}',
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
