import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class ShopCommentsItem extends StatelessWidget {
  final ShopCommentsData shopCommentsData;
  final int spacing;

  const ShopCommentsItem({
   super.key,
    required this.shopCommentsData,
    this.spacing = 1,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
         borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
      ),
      margin: EdgeInsets.only(bottom: spacing.r),
      padding: REdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonImage(
                width: 36,
                height: 36,
                url: shopCommentsData.user?.img,
                errorRadius: 0,
                radius: 18,
                fit: BoxFit.cover,
              ),
              8.horizontalSpace,
              Expanded(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width - 50.r,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          '${shopCommentsData.user?.firstname ?? ""} ${shopCommentsData.user?.lastname ?? ''}',
                          style: Style.interNormal(
                            size: 14,
                            color: Style.black,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                      8.horizontalSpace,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          color: Style.colorGrey,
                        ),
                        height: 6.r,
                        width: 6.r,
                      ),
                      8.horizontalSpace,
                      Icon(
                        Remix.star_smile_fill,
                        color: Style.starColor,
                        size: 20.r,
                      ),
                      8.horizontalSpace,
                      Text(
                        '${shopCommentsData.rating?.toDouble() ?? ""}',
                        style: Style.interNormal(
                          size: 16,
                          color: Style.black,
                          letterSpacing: -0.3,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              12.horizontalSpace,
            ],
          ),
          12.verticalSpace,
          Text(
            shopCommentsData.comment ?? '',
            style: Style.interRegular(
              size: 14,
              color: Style.textColor,
              letterSpacing: -0.3,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              DateService.dateFormatForOrder(shopCommentsData.updatedAt),
              style: Style.interRegular(
                size: 12,
                color: Style.textColor,
                letterSpacing: -0.3,
              ),
            ),
          ),
          SizedBox(
            height: (shopCommentsData.galleries?.isNotEmpty ?? false) ? 48 : 0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: shopCommentsData.galleries?.length ?? 0,
                itemBuilder: (context, index) {
                  return CommonImage(
                    width: 48,
                    height: 48,
                    url: shopCommentsData.galleries?[index].path,
                    errorRadius: 0,
                    fit: BoxFit.cover,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
