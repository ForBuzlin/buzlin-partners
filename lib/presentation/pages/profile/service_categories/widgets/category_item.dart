import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class CategoryItem extends StatelessWidget {
  final CategoryData categoryData;
  final ValueChanged<CategoryData?> onEdit;
  final ValueChanged<int?> onTap;
  final ValueChanged<int?> onTapSub;
  final int spacing;
  final List<int> selectParents;
  final List<int> selectSubs;

  const CategoryItem({
    super.key,
    required this.categoryData,
    required this.onEdit,
    this.spacing = 1,
    required this.onTap,
    required this.selectParents,
    required this.selectSubs,
    required this.onTapSub,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: spacing.r),
      child: Column(
        children: [
          categoryItem(
            type: 0,
            category: categoryData,
            isSelect: selectParents.contains(categoryData.id),
            isEmpty: categoryData.children?.isEmpty ?? true,
          ),
          if (selectParents.contains(categoryData.id))
            Padding(
              padding: REdgeInsets.only(bottom: 6),
              child: Column(
                children:
                    List.generate(categoryData.children?.length ?? 0, (index) {
                  final subCategory = categoryData.children?[index];
                  return Column(
                    children: [
                      categoryItem(
                        type: 2,
                        category: subCategory,
                        isSelect: selectSubs.contains(subCategory?.id),
                        isEnd: categoryData.children?.length == index + 1,
                        isFirst: index == 0,
                      )
                    ],
                  );
                }),
              ),
            )
        ],
      ),
    );
  }

  Widget categoryItem({
    required CategoryData? category,
    bool isSelect = false,
    bool isEnd = false,
    bool isFirst = false,
    bool isEmpty = false,
    required int type,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(type == 0 ? 12.r : 0),
          topRight: Radius.circular(type == 0 ? 12.r : 0),
          bottomLeft:
              Radius.circular(type == 0 || isSelect || isEnd ? 12.r : 0),
          bottomRight: Radius.circular(
              !isSelect && isEnd || type == 0 && !isSelect ? 12.r : 0),
        ),
      ),
      padding: REdgeInsets.symmetric(vertical: type == 0 ? 4 : 0),
      margin: REdgeInsets.only(left: type * 12),
      child: ButtonEffectAnimation(
        disabled: type != 2,
        onTap: () {
          if (type == 0) {
            onTap(category?.id);
          } else if (type == 1) {
            onTapSub(category?.id);
          }
        },
        child: Column(
          children: [
            if (isFirst) const Divider(height: 6),
            6.verticalSpace,
            Row(
              children: [
                Container(
                  width: 4.r,
                  height: type == 0 ? 52.r : 48.r,
                  decoration: BoxDecoration(
                    color:
                        AppHelpers.getStatusColor(category?.active.toString()),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    ),
                  ),
                ),
                12.horizontalSpace,
                CommonImage(
                  width: type == 0 ? 52.r : 48.r,
                  height: type == 0 ? 52.r : 48.r,
                  url: category?.img,
                  errorRadius: 0,
                  fit: BoxFit.cover,
                ),
                8.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category?.translation?.title ??
                            AppHelpers.getTranslation(TrKeys.noName),
                        style: Style.interRegular(
                          size: 14,
                          color: Style.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                      6.verticalSpace,
                      Text(
                        category?.translation?.description ?? '',
                        style: Style.interRegular(
                          size: 12,
                          color: Style.textColor,
                          letterSpacing: -0.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                8.horizontalSpace,
                Column(
                  children: [
                    StatusButton(
                      status: category?.status ?? '',
                      verticalPadding: 4,
                      horizontalPadding: 12,
                    ),
                    6.verticalSpace,
                    Row(
                      children: [
                        if (category?.shopId == LocalStorage.getShop()?.id)
                          CircleButton(
                            onTap: () => onEdit(category),
                            icon: Remix.pencil_line,
                          ),
                        8.horizontalSpace,
                        if (type != 2)
                          Icon(
                            isSelect
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            size: 24.r,
                            color: isSelect ? Style.primary : Style.black,
                          ),
                      ],
                    ),
                  ],
                ),
                12.horizontalSpace,
              ],
            ),
            6.verticalSpace,
            if (type != 0 && !isEnd && !isSelect) const Divider(height: 6),
            if (isEnd) 4.verticalSpace,
          ],
        ),
      ),
    );
  }
}
