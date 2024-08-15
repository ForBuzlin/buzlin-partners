import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class CategoryFilter extends StatelessWidget {
  final List<Brand> categories;
  final List<int> list;
  final ValueChanged<int> onChange;

  const CategoryFilter({
    super.key,
    required this.categories,
    required this.list,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular(AppConstants.radius.r),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Style.transparent,
          primaryColor: Style.textColor,
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(secondary: Style.textColor, primary: Style.textColor),
        ),
        child: ExpansionTile(
          title: Text(
            AppHelpers.getTranslation(TrKeys.categories),
            style: Style.interNormal(color: Style.black, size: 16),
          ),
          children: [
            Wrap(
              children: categories
                  .map((e) => InkWell(
                        onTap: () => onChange(e.id ?? 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  list.contains(e.id)
                                      ? Remix.checkbox_circle_fill
                                      : Remix.checkbox_blank_circle_line,
                                  color: list.contains(e.id)
                                      ? Style.primary
                                      : Style.black,
                                ),
                                10.horizontalSpace,
                                Text(
                                  e.title ?? "",
                                  style: Style.interNormal(
                                    size: 14,
                                    color: Style.textColor,
                                  ),
                                )
                              ],
                            ),
                            const Divider(
                              color: Style.backgroundColor,
                            )
                          ],
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
