import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

part 'layout_box.dart';

part 'layout_item.dart';

class LayoutScreen extends StatelessWidget {
  final ValueChanged<LayoutType> onChange;
  final LayoutType selectType;

  const LayoutScreen(
      {super.key, required this.selectType, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          color: Style.white, borderRadius: BorderRadius.circular(AppConstants.radius.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppHelpers.getTranslation(TrKeys.layouts),
            style: Style.interSemi(size: 16),
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: DropDownValues.filterLayouts
                .map(
                  (e) => ButtonEffectAnimation(
                    onTap: () => onChange(e),
                    child: LayoutItem(type: e, selectType: selectType),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
