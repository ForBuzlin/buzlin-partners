import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/data/whole_sale_data.dart';
import 'package:venderuzmart/presentation/component/components.dart';

import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EditableWholeSaleItem extends StatelessWidget {
  final Stocks stock;
  final Function(String, int) onPriceChange;
  final Function(String, int) onMinQuantityChange;
  final String? Function(String?, int) onMinQuantityCheck;
  final String? Function(String?, int) onMaxQuantityCheck;
  final Function(String, int) onMaxQuantityChange;
  final Function(int) onDeleteStock;
  final Function()? onAdd;

  const EditableWholeSaleItem({
    super.key,
    required this.stock,
    required this.onPriceChange,
    required this.onMinQuantityChange,
    required this.onDeleteStock,
    required this.onMaxQuantityChange,
    required this.onMinQuantityCheck,
    required this.onMaxQuantityCheck,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular(AppConstants.radius.r),
      ),
      margin: REdgeInsets.only(bottom: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.radius.r),
        child: ExpansionTile(
          backgroundColor: Style.white,
          initiallyExpanded: true,
          maintainState: true,
          childrenPadding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
          tilePadding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${AppHelpers.getTranslation(TrKeys.price)}: ${AppHelpers.numberFormat(number: stock.price)}',
                      style: Style.interNormal(
                        size: 12,
                        color: Style.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${AppHelpers.getTranslation(TrKeys.quantity)}: ${stock.quantity ?? ''}',
                      style: Style.interNormal(
                        size: 12,
                        color: Style.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
              4.verticalSpace,
              Text(
                '${AppHelpers.getTranslation(TrKeys.sku)}: ${stock.sku ?? ''}',
                style: Style.interNormal(
                  size: 12,
                  color: Style.black.withOpacity(0.7),
                ),
              ),
              if (stock.extras != null && (stock.extras?.isNotEmpty ?? false))
                Wrap(
                  children: List.generate(stock.extras?.length ?? 0, (index) {
                    final extras = stock.extras?[index] ?? Extras();
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${extras.group?.translation?.title ?? ''}: ${AppHelpers.getNameColor(extras.value)}, ',
                          style: Style.interNormal(
                            size: 12,
                            color: Style.black.withOpacity(0.7),
                          ),
                        ),
                        if (extras.group?.type == ExtrasType.color.name)
                          ColorItem(
                            extras: extras,
                            size: 16,
                          )
                      ],
                    );
                  }),
                )
            ],
          ),
          children: [
            ...(stock.wholeSalePrices ?? []).mapIndexed(_priceItem),
            if (onAdd != null)
              CustomButton(
                height: 36,
                radius: AppConstants.radius,
                background: Style.transparent,
                borderColor: Style.black,
                textColor: Style.black,
                title: TrKeys.add,
                onPressed: () => onAdd?.call(),
              )
          ],
        ),
      ),
    );
  }

  _priceItem(WholeSalePrice wholeSalePrice, int i) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: UnderlinedTextField(
                label: '${AppHelpers.getTranslation(TrKeys.minQuantity)}*',
                inputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                initialText: "${wholeSalePrice.minQuantity ?? ''}",
                onChanged: (s) => onMinQuantityChange(s, i),
                validator: (s) => onMinQuantityCheck(s, i),
                inputFormatters: [InputFormatter.digitsOnly],
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: UnderlinedTextField(
                label: '${AppHelpers.getTranslation(TrKeys.maxQuantity)}*',
                inputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                initialText: "${wholeSalePrice.maxQuantity ?? ''}",
                onChanged: (s) => onMaxQuantityChange(s, i),
                validator: (s) => onMaxQuantityCheck(s, i),
                inputFormatters: [InputFormatter.digitsOnly],
              ),
            ),
            Padding(
              padding: REdgeInsets.only(left: 10, top: 8),
              child: ButtonEffectAnimation(
                child: GestureDetector(
                  onTap: () => onDeleteStock(i),
                  child: Container(
                    width: 36.r,
                    height: 36.r,
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
            ),
          ],
        ),
        4.verticalSpace,
        UnderlinedTextField(
          label: AppHelpers.getPriceLabel,
          inputType: TextInputType.number,
          textInputAction: TextInputAction.next,
          initialText: "${wholeSalePrice.price ?? ''}",
          onChanged: (s) => onPriceChange(s, i),
          validator: AppValidators.emptyCheck,
          inputFormatters: [InputFormatter.currency],
        ),
        8.verticalSpace,
      ],
    );
  }
}
