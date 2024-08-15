import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import '../../styles/style.dart';
import '../components.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class ProductsItem extends StatelessWidget {
  final ProductData product;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final int spacing;

  const ProductsItem({
   super.key,
    required this.product,
    required this.onTap,
    this.spacing = 1,
    required this.onDelete,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
        color: Style.white,
      ),
      margin: EdgeInsets.only(bottom: spacing.r),
      padding: REdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 4.r,
            height: 68.r,
            decoration: BoxDecoration(
                color: AppHelpers.getStatusColor(product.active.toString()),
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(AppConstants.radius.r),
                )),
          ),
          12.horizontalSpace,
          CommonImage(
            width: 72,
            height: 72,
            url: product.img,
            errorRadius: 0,
            fit: BoxFit.cover,
          ),
          8.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(
                    child: AutoSizeText(
                      product.translation?.title ??
                          AppHelpers.getTranslation(TrKeys.unKnow),
                      style: Style.interRegular(
                        size: 14,
                        color: Style.black,
                        letterSpacing: -0.3,
                      ),
                      maxLines: 2,
                      minFontSize: 12,
                    ),
                  ),
                  StatusButton(status: product.status ?? "")
                ]),
                8.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ProductPriceWidget(
                        product: product,
                        stock: (product.stocks?.isNotEmpty ?? false)
                            ? product.stocks?.first
                            : null,
                      ),
                    ),
                    Row(
                      children: [
                        CircleButton(
                          onTap: onTap,
                          icon: Remix.pencil_line,
                        ),
                        8.horizontalSpace,
                        CircleButton(
                          onTap: onDelete,
                          icon: Remix.delete_bin_line,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          12.horizontalSpace,
        ],
      ),
    );
  }
}
