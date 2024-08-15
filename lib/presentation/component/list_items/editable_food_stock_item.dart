import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';

import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EditableFoodStockItem extends StatelessWidget {
  final Stocks stock;
  final Function(String) onPriceChange;
  final Function(String) onQuantityChange;
  final Function(String) onSkuChange;
  final Function() onDeleteStock;

  final bool isDeletable;

  const EditableFoodStockItem({
   super.key,
    required this.stock,
    required this.onPriceChange,
    required this.onQuantityChange,
    required this.onDeleteStock,
    required this.isDeletable,
    required this.onSkuChange,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular(AppConstants.radius.r),
      ),
      padding: REdgeInsets.symmetric(horizontal: 20, vertical: 16),
      margin: REdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: UnderlinedTextField(
                  label: AppHelpers.getPriceLabel,
                  inputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  initialText:
                      stock.price == null ? '' : stock.price.toString(),
                  onChanged: onPriceChange,
                  validator: AppValidators.emptyCheck,
                  inputFormatters: [InputFormatter.currency],
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: UnderlinedTextField(
                  label: '${AppHelpers.getTranslation(TrKeys.quantity)}*',
                  inputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  initialText:
                      stock.quantity == null ? '' : stock.quantity.toString(),
                  onChanged: onQuantityChange,
                  validator: AppValidators.emptyCheck,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              if (isDeletable)
                ButtonEffectAnimation(
                  child: GestureDetector(
                    onTap: onDeleteStock,
                    child: Container(
                      width: 36.r,
                      height: 36.r,
                      margin: REdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Style.greyColor,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Remix.delete_bin_line,
                        size: 18.r,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          4.verticalSpace,
          UnderlinedTextField(
            label: AppHelpers.getTranslation(TrKeys.sku),
            textInputAction: TextInputAction.next,
            initialText: stock.sku == null ? '' : stock.sku.toString(),
            onChanged: onSkuChange,
            // validator: AppValidators.emptyCheck,
          ),
          if (stock.extras != null && (stock.extras?.isNotEmpty ?? false))
            ListView.builder(
              shrinkWrap: true,
              itemCount: stock.extras?.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final extras = stock.extras?[index] ?? Extras();
                return Padding(
                  padding: REdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: UnderlinedTextField(
                          label: '${extras.group?.translation?.title}',
                          initialText: AppHelpers.getNameColor(extras.value),
                          readOnly: true,
                          validator: AppValidators.emptyCheck,
                        ),
                      ),
                      if (extras.group?.type == ExtrasType.color.name)
                        ColorItem(extras: extras)
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
