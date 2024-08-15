import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class TopProductsPage extends StatelessWidget {
  final List<TopSaleProducts> products;

  const TopProductsPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const SizedBox.shrink()
        : Container(
            width: double.infinity,
            margin: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: REdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular((AppConstants.radius / 1.4).r),
              color: Style.white,
              border: Border.all(color: Style.borderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppHelpers.getTranslation(TrKeys.topSaleProducts),
                        style: Style.interSemi(size: 18),
                      ),
                    ),
                    Text(
                      AppHelpers.getTranslation(TrKeys.last30day),
                      style:
                          Style.interNormal(size: 14, color: Style.textColor),
                    ),
                  ],
                ),
                12.verticalSpace,
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return _productItem(products[index]);
                    })
              ],
            ),
          );
  }
}

_productItem(TopSaleProducts topSaleProduct) {
  return Padding(
    padding: REdgeInsets.only(bottom: 6),
    child: Row(
      children: [
        CommonImage(
          height: 36,
          width: 36,
          url: topSaleProduct.product?.img,
          radius: 6,
        ),
        8.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topSaleProduct.product?.translation?.title ?? '',
                style: Style.interNormal(size: 14),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Wrap(
                spacing: 0,
                children: [
                  for (var e in topSaleProduct.extras ?? [])
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${e.group?.translation?.title ?? ''}:",
                          style: Style.interRegular(
                            size: 12,
                            color: Style.black,
                          ),
                        ),
                        2.horizontalSpace,
                        Text(
                          '${AppHelpers.getNameColor(e.answers)},',
                          style: Style.interRegular(
                            size: 12,
                            color: Style.black,
                          ),
                        ),
                        6.horizontalSpace,
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
        16.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              AppHelpers.getTranslation(TrKeys.sales),
              style: Style.interRegular(size: 12, color: Style.textColor),
            ),
            Text(
              "${topSaleProduct.count ?? 0}",
              style: Style.interNormal(size: 14),
            ),
          ],
        ),
      ],
    ),
  );
}
