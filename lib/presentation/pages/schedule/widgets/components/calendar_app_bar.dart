import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class CalendarAppBar extends StatelessWidget {
  final VoidCallback? onFilterTap;
  final VoidCallback? onTipTap;
  final AsyncCallback? onTitleTapped;
  final DateTime startDate;
  final bool? isFilter;
  final CalendarType calendarType;
  final DateTime? endDate;

  final Color iconColor;

  const CalendarAppBar({
    super.key,
    required this.startDate,
    this.onFilterTap,
    this.onTitleTapped,
    this.onTipTap,
    this.endDate,
    this.iconColor = Style.black,
    required this.calendarType,
    this.isFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 56.h),
      decoration: const BoxDecoration(color: Style.white),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          onTipTap != null
              ? IconButton(
                  onPressed: onTipTap,
                  splashColor: Style.transparent,
                  focusColor: Style.transparent,
                  hoverColor: Style.transparent,
                  highlightColor: Style.transparent,
                  icon: Icon(
                    Icons.more_vert,
                    size: 21.r,
                    color: iconColor,
                  ),
                )
              : 50.horizontalSpace,
          Expanded(
            child: InkWell(
              onTap: onTitleTapped,
              child: Text(
                calendarType == CalendarType.list
                    ? AppHelpers.getTranslation(TrKeys.bookings)
                    : calendarType == CalendarType.day
                        ? DateService.dateFormatEDMY(startDate)
                        : DateService.dateFormatMulti([startDate, endDate]),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          IconButton(
            onPressed: onFilterTap,
            splashColor: Style.transparent,
            focusColor: Style.transparent,
            hoverColor: Style.transparent,
            highlightColor: Style.transparent,
            icon: Badge(
              isLabelVisible: isFilter ?? false,
              child: Icon(Remix.sound_module_line,
                  size: 21.r, color: iconColor),
            ),
          ),
          8.horizontalSpace,
        ],
      ),
    );
  }
}
