import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

import '../styles/style.dart';

class CustomDatePicker extends StatelessWidget {
  final List<DateTime?>? range;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool isSingle;
  final bool isMulti;
  final Function(List<DateTime?>)? onValueChanged;
  final Function(DateTime)? onDisplayedMonthChanged;

  const CustomDatePicker({
    super.key,
    this.range,
    this.onValueChanged,
    this.onDisplayedMonthChanged,
    this.firstDate,
    this.isSingle = false,
    this.lastDate,
    this.isMulti = false,
  });

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
      config: CalendarDatePicker2Config(
        firstDate: firstDate,
        lastDate: (isSingle && lastDate == null)
            ? DateTime.now().subtract(const Duration(days: 365 * 10))
            : lastDate,
        calendarType: isSingle
            ? CalendarDatePicker2Type.single
            : isMulti
                ? CalendarDatePicker2Type.multi
                : CalendarDatePicker2Type.range,
        selectedDayHighlightColor: Style.primary,
        weekdayLabelTextStyle: Style.interNormal(
          size: 14,
          letterSpacing: -0.3,
          color: Style.black,
        ),
        controlsTextStyle: Style.interNormal(
          size: 14,
          letterSpacing: -0.3,
          color: Style.black,
        ),
        dayTextStyle: Style.interNormal(
          size: 14,
          letterSpacing: -0.3,
          color: Style.black,
        ),
        disabledDayTextStyle: Style.interNormal(
          size: 14,
          letterSpacing: -0.3,
          color: Style.textColor,
        ),
        dayBorderRadius: BorderRadius.circular(10.r),
      ),
      value: range ?? [],
      onValueChanged: (value) {
        onValueChanged?.call(value);
        if (isSingle || value.length > 1) {
          Navigator.pop(context);
        }
      },
      onDisplayedMonthChanged: onDisplayedMonthChanged ?? (value) {},
    );
  }
}
