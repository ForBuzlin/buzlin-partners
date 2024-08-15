import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class SmallWeekdayItem extends StatelessWidget {
  final bool isSelected;
  final WorkingDay day;
  final int size;
  final int fontSize;
  final int borderRadius;

  const SmallWeekdayItem({
   super.key,
    required this.isSelected,
    required this.day,
    this.size = 40,
    this.fontSize = 14,
    this.borderRadius = 10,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.r,
      width: size.r,
      decoration: BoxDecoration(
        color: isSelected ? Style.primary : Style.white,
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      alignment: Alignment.center,
      child: Text(
        '${toBeginningOfSentenceCase(day.day?.substring(0, 2))}',
        style: Style.interNormal(
          size: fontSize.toDouble(),
          color: isSelected ? Style.white : Style.black,
        ),
      ),
    );
  }
}
