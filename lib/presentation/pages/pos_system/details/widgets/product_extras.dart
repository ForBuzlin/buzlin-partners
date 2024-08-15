import 'package:venderuzmart/application/pos_system/product_detail/product_detail_notifier.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class ProductExtras extends StatelessWidget {
  final List<TypedExtra> types;
  final int bagIndex;
  final ProductDetailNotifier notifier;

  const ProductExtras({
    super.key,
    required this.types,
    required this.notifier,
    required this.bagIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: types.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final TypedExtra typedExtra = types[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(index == 0 ? 12.r : 0),
              bottom: Radius.circular(index == types.length - 1 ? 12.r : 0),
            ),
            color: Style.greyColor,
          ),
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0) 14.verticalSpace,
              Text(
                typedExtra.title,
                style: Style.interNormal(
                  size: 16,
                  letterSpacing: -0.4,
                ),
              ),
              12.verticalSpace,
              typedExtra.type == ExtrasType.text
                  ? TextExtras(
                      uiExtras: typedExtra.uiExtras,
                      groupIndex: typedExtra.groupIndex,
                      onUpdate: (uiExtra) {
                        notifier.updateSelectedIndexes(
                          index: typedExtra.groupIndex,
                          value: uiExtra.index,
                          bagIndex: bagIndex,
                        );
                      },
                    )
                  : typedExtra.type == ExtrasType.color
                      ? ColorExtras(
                          uiExtras: typedExtra.uiExtras,
                          groupIndex: typedExtra.groupIndex,
                          onUpdate: (uiExtra) {
                            notifier.updateSelectedIndexes(
                              index: typedExtra.groupIndex,
                              value: uiExtra.index,
                              bagIndex: bagIndex,
                            );
                          },
                        )
                      : typedExtra.type == ExtrasType.image
                          ? ImageExtras(
                              uiExtras: typedExtra.uiExtras,
                              groupIndex: typedExtra.groupIndex,
                              updateImage: (s) {},
                              onUpdate: (uiExtra) {
                                notifier.updateSelectedIndexes(
                                  index: typedExtra.groupIndex,
                                  value: uiExtra.index,
                                  bagIndex: bagIndex,
                                );
                              },
                            )
                          : const SizedBox(),
              6.verticalSpace,
              if (index + 1 != types.length) const Divider(),
              8.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}
