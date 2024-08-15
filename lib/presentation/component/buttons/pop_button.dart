import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class PopButton extends StatelessWidget {
  final String? heroTag;
  final Color color;

  const PopButton({
   super.key,
    this.heroTag,
    this.color = Style.black,
  }) ;

  @override
  Widget build(BuildContext context) {
    if (heroTag?.isNotEmpty ?? false) {
      return Hero(
        tag: heroTag!,
        child: IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 28.r,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            (LocalStorage.getLangLtr() == TextDirection.rtl)
                ? Icons.keyboard_arrow_right
                : Icons.keyboard_arrow_left,
            color: color,
            size: 28.r,
          ),
        ),
      );
    } else {
      return IconButton(
        padding: EdgeInsets.zero,
        splashRadius: 28.r,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          (LocalStorage.getLangLtr() == TextDirection.rtl)
              ? Icons.keyboard_arrow_right
              : Icons.keyboard_arrow_left,
          color: color,
          size: 28.r,
        ),
      );
    }
  }
}
