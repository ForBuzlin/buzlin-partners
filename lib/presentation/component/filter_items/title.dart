import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class TitleScreen extends StatelessWidget {
  final VoidCallback onTap;

  const TitleScreen({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppHelpers.getTranslation(TrKeys.filter),
          style: Style.interNormal(color: Style.black, size: 22),
        ),
        ButtonEffectAnimation(
          onTap: onTap,
          child: Text(
            AppHelpers.getTranslation(TrKeys.clearAll),
            style: Style.interNormal(color: Style.textColor, size: 14),
          ),
        ),
      ],
    );
  }
}
