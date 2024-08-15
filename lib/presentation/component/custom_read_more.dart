import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

// ignore: depend_on_referenced_packages
import 'package:html/parser.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class CustomReadMoreText extends StatelessWidget {
  final String? description;
  final int trimLines;
  final TextStyle? style;

  const CustomReadMoreText(
    this.description, {
    super.key,
    this.trimLines = 3,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      '${parse(description ?? "").body?.text ?? ''} ',
      trimLines: trimLines,
      trimMode: TrimMode.Line,
      trimCollapsedText: AppHelpers.getTranslation(TrKeys.showMore),
      trimExpandedText: AppHelpers.getTranslation(TrKeys.showLess),
      lessStyle: Style.interRegular(
          size: 14, textDecoration: TextDecoration.underline),
      moreStyle: Style.interRegular(
          size: 14, textDecoration: TextDecoration.underline),
      style: style ?? Style.interRegular(size: 14),
    );
  }
}
