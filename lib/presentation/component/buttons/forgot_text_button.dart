import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/presentation/styles/style.dart';

class ForgotTextButton extends ConsumerWidget {
  final String title;
  final Function() onPressed;
  final double? fontSize;
  final Color? fontColor;
  final double? letterSpacing;

  const ForgotTextButton({
   super.key,
    required this.title,
    required this.onPressed,
    this.fontSize,
    this.fontColor = Style.black,
    this.letterSpacing = -14 * 0.02,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
              (states) => Style.greyColor,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: Style.interNormal(
          decoration: TextDecoration.underline,
          size: 12,
          color: Style.black,
        ),
      ),
    );
  }
}
