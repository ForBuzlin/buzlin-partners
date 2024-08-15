import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class FoodProductItem extends StatelessWidget {
  final Stocks stockData;
  final Function() onTap;
  final bool isSelected;

  const FoodProductItem({
   super.key,
    required this.stockData,
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 18.r,
                height: 18.r,
                decoration: BoxDecoration(
                  color: isSelected ? Style.primary : Style.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Style.primary : Style.textColor,
                    width: isSelected ? 2 : 2,
                  ),
                ),
                child: isSelected
                    ? Icon(
                        Remix.check_fill,
                        size: 12.r,
                        color: Style.white,
                      )
                    : const SizedBox.shrink(),
              ),
              12.horizontalSpace,
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 110.r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${stockData.product?.translation?.title}",
                      style: Style.interRegular(
                        size: 14,
                        color: Style.black,
                      ),
                    ),
                    6.horizontalSpace,
                    for (Extras e in stockData.extras ?? [])
                      if (ExtrasType.color !=
                          AppHelpers.getExtraTypeByValue(e.group?.type))
                        Row(
                          children: [
                            Text(
                              "${e.group?.translation?.title}:",
                              style: Style.interRegular(
                                size: 14,
                                color: Style.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            2.horizontalSpace,
                            Text(
                              e.value ?? "",
                              style: Style.interRegular(
                                size: 14,
                                color: Style.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            6.horizontalSpace,
                          ],
                        ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
