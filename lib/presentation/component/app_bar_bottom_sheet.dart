import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import '../styles/style.dart';
import 'buttons/animation_button_effect.dart';

class AppBarBottomSheet extends StatelessWidget {
  final String title;
  final bool noBack;
  final VoidCallback? onBack;

  const AppBarBottomSheet(
      {super.key, required this.title, this.noBack = false, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        noBack
            ? const SizedBox.shrink()
            : ButtonEffectAnimation(
                child: GestureDetector(
                  onTap: onBack ?? () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    color: Style.textColor,
                    size: 24.r,
                  ),
                ),
              ),
        Text(
          title,
          style: Style.interSemi(
            size: 20,
            color: Style.textColor,
            letterSpacing: -0.01,
          ),
        ),
        Container(
            width: 24.r,
            height: 24.r,
            margin: REdgeInsets.all(AppConstants.radius / 2)),
      ],
    );
  }
}
