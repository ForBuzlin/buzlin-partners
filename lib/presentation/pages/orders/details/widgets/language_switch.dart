import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class LanguageSwitch extends StatelessWidget {
  final List<LanguageData> languages;
  final String locale;
  final ValueChanged<int> onSelect;

  const LanguageSwitch({
    super.key,
    required this.languages,
    required this.locale,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...languages.mapIndexed((e, i) => _SwitcherItem(
              title: e.locale ?? '',
              isActive: locale == e.locale,
              onTap: () {
                onSelect.call(i);
              },
              index: i,
              isLast: languages.length == i + 1,
            )),
      ],
    );
  }
}

class _SwitcherItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isLast;
  final int index;
  final VoidCallback onTap;

  const _SwitcherItem({
    required this.title,
    required this.isActive,
    required this.onTap,
    this.isLast = false,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool isLtr = LocalStorage.getLangLtr() == TextDirection.ltr;
    bool leftIsLeft = isLtr ? index == 0 : isLast;
    bool rightIsLeft = isLtr ? isLast : index == 0;

    return ButtonEffectAnimation(
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(leftIsLeft ? 12 : 0),
          right: Radius.circular(rightIsLeft ? 12 : 0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(leftIsLeft ? 12 : 0),
            right: Radius.circular(rightIsLeft ? 12 : 0),
          ),
          onTap: onTap,
          child: Container(
            width: 56.w,
            padding: REdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isActive ? Style.primary : Style.white,
              border: Border.all(
                color: isActive ? Style.primary : Style.borderColor,
              ),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(leftIsLeft ? 12 : 0),
                right: Radius.circular(rightIsLeft ? 12 : 0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title.toUpperCase(),
                  style: Style.interNormal(
                      color: isActive ? Style.white : Style.textColor,
                      size: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
