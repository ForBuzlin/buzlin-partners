import 'package:flutter/material.dart';
import 'package:venderuzmart/presentation/component/components.dart';

import '../styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class TitleAndIcon extends StatelessWidget {
  final String title;
  final double titleSize;
  final String? rightTitle;
  final bool isIcon;
  final Color rightTitleColor;
  final VoidCallback? onRightTap;

  const TitleAndIcon({
   super.key,
    this.isIcon = false,
    required this.title,
    this.rightTitle,
    this.rightTitleColor = Style.black,
    this.onRightTap,
    this.titleSize = 16,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              AppHelpers.getTranslation(title),
              style: Style.interNormal(size: titleSize, color: Style.black),
            ),
          ),
          ButtonEffectAnimation(
            onTap: onRightTap ?? () {},
            child: Row(
              children: [
                Text(
                  rightTitle ?? '',
                  style: Style.interNormal(
                    size: 14,
                    color: rightTitleColor,
                  ),
                ),
                isIcon
                    ? Icon(
                        (LocalStorage.getLangLtr() == TextDirection.ltr)
                            ? Icons.keyboard_arrow_right
                            : Icons.keyboard_arrow_left,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
