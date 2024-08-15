import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class BottomWidget extends StatelessWidget {
  final int? cartCount;
  final ProductData? product;
  final VoidCallback decreaseStockCount;
  final VoidCallback increaseStockCount;

  const BottomWidget({
    super.key,
    required this.cartCount,
    required this.decreaseStockCount,
    required this.increaseStockCount,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final bool ltr = LocalStorage.getLangLtr() == TextDirection.rtl;
    return Container(
      padding: REdgeInsets.only(
        bottom: Platform.isIOS ? 36 : 20,
        top: 20,
      ),
      child: (cartCount ?? 0) > 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60.r,
                  height: 48.r,
                  padding: REdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Style.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(ltr ? 0 : 18.r),
                      bottomRight: Radius.circular(ltr ? 0 : 18.r),
                      topLeft: Radius.circular(ltr ? 18.r : 0),
                      bottomLeft: Radius.circular(ltr ? 18.r : 0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    '${cartCount! * (product?.interval ?? 1)} ${product?.unit?.translation?.title ?? ""}',
                    style: Style.interSemi(
                      color: Style.white,
                    ),
                    maxFontSize: 14,
                    minFontSize: 8,
                    maxLines: 2,
                  ),
                ),
                Row(
                  children: [
                    ButtonEffectAnimation(
                      child: GestureDetector(
                        onTap: decreaseStockCount,
                        child: Container(
                          height: 50.r,
                          width: 100.r,
                          decoration: BoxDecoration(
                            color: Style.discountColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(ltr ? 0 : 18.r),
                              bottomLeft: Radius.circular(ltr ? 0 : 18.r),
                              topRight: Radius.circular(ltr ? 18.r : 0),
                              bottomRight: Radius.circular(ltr ? 18.r : 0),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Remix.subtract_line,
                            size: 24.r,
                            color: Style.black,
                          ),
                        ),
                      ),
                    ),
                    1.horizontalSpace,
                    ButtonEffectAnimation(
                      child: GestureDetector(
                        onTap: increaseStockCount,
                        child: Container(
                          height: 50.r,
                          width: 100.r,
                          decoration: BoxDecoration(
                            color: Style.addCountColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(ltr ? 0 : 18.r),
                              bottomRight: Radius.circular(ltr ? 0 : 18.r),
                              topLeft: Radius.circular(ltr ? 18.r : 0),
                              bottomLeft: Radius.circular(ltr ? 18.r : 0),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Remix.add_line,
                            size: 24.r,
                            color: Style.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                36.horizontalSpace,
              ],
            )
          : Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                height: 54,
                title: TrKeys.toBuy,
                onPressed: increaseStockCount,
              ),
            ),
    );
  }
}
