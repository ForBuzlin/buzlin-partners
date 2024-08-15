import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class VerticalProductItem extends StatelessWidget {
  final ProductData product;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const VerticalProductItem(
      {super.key,
      required this.product,
      required this.onTap,
      required this.onDelete})
      ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
        color: product.status == TrKeys.published
            ? Style.white
            : AppHelpers.getStatusColor(product.status).withOpacity(0.2),
      ),
      margin: EdgeInsets.only(bottom: 8.r),
      padding: REdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 4.r,
            height: 44.r,
            decoration: BoxDecoration(
                color: AppHelpers.getStatusColor(product.active.toString()),
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(AppConstants.radius.r),
                )),
          ),
          12.horizontalSpace,
          CommonImage(
            width: 42,
            height: 52,
            url: product.img,
            errorRadius: 0,
            fit: BoxFit.cover,
          ),
          8.horizontalSpace,
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product.translation?.title ??
                                  AppHelpers.getTranslation(TrKeys.unKnow),
                              style: Style.interRegular(
                                  size: 14,
                                  color: Style.black,
                                  letterSpacing: -0.3),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      ProductPriceWidget(
                        product: product,
                        stock: (product.stocks?.isNotEmpty ?? false)
                            ? product.stocks?.first
                            : null,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    CircleButton(
                      onTap: onTap,
                      icon: Remix.pencil_line,
                    ),
                    8.horizontalSpace,
                    // CircleButton(
                    //   onTap: onDelete,
                    //   icon: Remix.delete_bin_line,
                    // )
                  ],
                )
              ],
            ),
          ),
          12.horizontalSpace,
        ],
      ),
    );
  }
}
