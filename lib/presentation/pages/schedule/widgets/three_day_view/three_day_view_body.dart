import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import '../components/_internal_components.dart';
import '../components/event_scroll_notifier.dart';
import '../components/event_widget.dart';
import '../event_arrangers/event_arrangers.dart';
import '../event_controller.dart';
import '../hour_indicator.dart';
import '../painters.dart';

class ThreeDayViewBody extends StatelessWidget {
  final double width;
  final double height;
  final List<DateTime> dates;
  final EventController controller;
  final HourIndicatorSettings hourIndicatorSettings;
  final HourIndicatorSettings halfHourIndicatorSettings;
  final HourIndicatorSettings quarterHourIndicatorSettings;
  final bool showLiveLine;
  final HourIndicatorSettings liveTimeIndicatorSettings;
  final double heightPerMinute;
  final double timeLineWidth;
  final double timeLineOffset;
  final double hourHeight;
  final EventArranger eventArranger;
  final bool showVerticalLine;
  final double verticalLineOffset;
  final Function(DateTime date) weekDayBuilder;
  final Function(DateTime date) weekNumberBuilder;
  final DetectorBuilder weekDetectorBuilder;
  final double weekTitleHeight;
  final double weekTitleWidth;
  final ScrollController scrollController;
  final CellTapCallback? onTileTap;
  final List<WeekDays> weekDays;
  final Function(DateTime date)? onDateLongPress;
  final Function(DateTime date)? onDateTap;
  final MinuteSlotSize minuteSlotSize;
  final EventScrollConfiguration scrollConfiguration;
  final bool showWeekDayAtBottom;
  final bool showHalfHours;
  final bool showQuarterHours;
  final double emulateVerticalOffsetBy;

  const ThreeDayViewBody(
      {super.key,
      required this.showVerticalLine,
      required this.weekTitleHeight,
      required this.weekDayBuilder,
      required this.weekNumberBuilder,
      required this.width,
      required this.dates,
      required this.controller,
      required this.hourIndicatorSettings,
      required this.halfHourIndicatorSettings,
      required this.quarterHourIndicatorSettings,
      required this.showLiveLine,
      required this.liveTimeIndicatorSettings,
      required this.heightPerMinute,
      required this.timeLineWidth,
      required this.timeLineOffset,
      required this.height,
      required this.hourHeight,
      required this.eventArranger,
      required this.verticalLineOffset,
      required this.weekTitleWidth,
      required this.scrollController,
      required this.onTileTap,
      required this.onDateLongPress,
      required this.onDateTap,
      required this.weekDays,
      required this.minuteSlotSize,
      required this.scrollConfiguration,
      required this.weekDetectorBuilder,
      required this.showWeekDayAtBottom,
      required this.showHalfHours,
      required this.showQuarterHours,
      required this.emulateVerticalOffsetBy});

  @override
  Widget build(BuildContext context) {
    final filteredDates = _filteredDate();
    return SizedBox(
      height: height + weekTitleHeight,
      width: width,
      child: Column(
        verticalDirection:
            showWeekDayAtBottom ? VerticalDirection.up : VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: weekTitleHeight,
                  width: timeLineWidth + hourIndicatorSettings.offset,
                  child: weekNumberBuilder.call(filteredDates[0]),
                ),
                ...List.generate(
                  filteredDates.length,
                  (index) => SizedBox(
                    height: weekTitleHeight,
                    width: weekTitleWidth,
                    child: weekDayBuilder(
                      filteredDates[index],
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            height: 1,
          ),
          SizedBox(
            width: width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: timeLineWidth + hourIndicatorSettings.offset),
                ...List.generate(
                  filteredDates.length,
                  (index) {
                    final fullDayEventList =
                        controller.getFullDayEvent(filteredDates[index]);
                    return fullDayEventList.isEmpty
                        ? const SizedBox.shrink()
                        : SizedBox(
                            width: weekTitleWidth,
                            child: FullDayEventView(
                              events: fullDayEventList,
                              boxConstraints: const BoxConstraints(maxHeight: 80),
                              date: dates[index],
                            ),
                          );
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: SizedBox(
                height: height,
                width: width,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(width, height),
                      painter: HourLinePainter(
                        lineColor: hourIndicatorSettings.color,
                        lineHeight: hourIndicatorSettings.height,
                        offset: timeLineWidth + hourIndicatorSettings.offset,
                        minuteHeight: heightPerMinute,
                        verticalLineOffset: verticalLineOffset,
                        showVerticalLine: showVerticalLine,
                        lineStyle: hourIndicatorSettings.lineStyle,
                        dashWidth: hourIndicatorSettings.dashWidth,
                        dashSpaceWidth: hourIndicatorSettings.dashSpaceWidth,
                        emulateVerticalOffsetBy: 0,
                      ),
                    ),
                    if (showHalfHours)
                      CustomPaint(
                        size: Size(width, height),
                        painter: HalfHourLinePainter(
                          lineColor: halfHourIndicatorSettings.color,
                          lineHeight: halfHourIndicatorSettings.height,
                          offset:
                              timeLineWidth + halfHourIndicatorSettings.offset,
                          minuteHeight: heightPerMinute,
                          lineStyle: halfHourIndicatorSettings.lineStyle,
                          dashWidth: halfHourIndicatorSettings.dashWidth,
                          dashSpaceWidth:
                              halfHourIndicatorSettings.dashSpaceWidth,
                        ),
                      ),
                    if (showQuarterHours)
                      CustomPaint(
                        size: Size(width, height),
                        painter: QuarterHourLinePainter(
                          lineColor: quarterHourIndicatorSettings.color,
                          lineHeight: quarterHourIndicatorSettings.height,
                          offset: timeLineWidth +
                              quarterHourIndicatorSettings.offset,
                          minuteHeight: heightPerMinute,
                          lineStyle: quarterHourIndicatorSettings.lineStyle,
                          dashWidth: quarterHourIndicatorSettings.dashWidth,
                          dashSpaceWidth:
                              quarterHourIndicatorSettings.dashSpaceWidth,
                        ),
                      ),
                    if (showLiveLine && liveTimeIndicatorSettings.height > 0)
                      LiveTimeIndicator(
                        liveTimeIndicatorSettings: liveTimeIndicatorSettings,
                        width: width,
                        height: height,
                        heightPerMinute: heightPerMinute,
                        timeLineWidth: timeLineWidth,
                      ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: weekTitleWidth * filteredDates.length,
                        height: height,
                        child: Row(
                          children: List.generate(
                            filteredDates.length,
                            (index) => Container(
                              decoration: showVerticalLine
                                  ? BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: hourIndicatorSettings.color,
                                          width: hourIndicatorSettings.height,
                                        ),
                                      ),
                                    )
                                  : null,
                              height: height,
                              width: weekTitleWidth,
                              child: Stack(
                                children: [
                                  weekDetectorBuilder(
                                    width: weekTitleWidth,
                                    height: height,
                                    heightPerMinute: heightPerMinute,
                                    date: dates[index],
                                    minuteSlotSize: minuteSlotSize,
                                  ),
                                  EventGenerator(
                                    height: height,
                                    date: filteredDates[index],
                                    onTileTap: onTileTap,
                                    width: weekTitleWidth,
                                    eventArranger: eventArranger,
                                    calendarType: CalendarType.threeDay,
                                    scrollNotifier: scrollConfiguration,
                                    events: controller
                                        .getEventsOnDay(filteredDates[index]),
                                    heightPerMinute: heightPerMinute,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TimeLine(
                      timeLineWidth: timeLineWidth,
                      hourHeight: hourHeight,
                      height: height,
                      timeLineOffset: timeLineOffset,
                      timeLineBuilder: _timeLineBuilder,
                      showHalfHours: showHalfHours,
                      showQuarterHours: showQuarterHours,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DateTime> _filteredDate() {
    final output = <DateTime>[];
    final weekDays = this.weekDays.toList();

    for (final date in dates) {
      if (weekDays.any((weekDay) => weekDay.index + 1 == date.weekday)) {
        output.add(date);
      }
    }
    return dates;
  }

  Widget _timeLineBuilder(DateTime date) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          top: -8,
          right: 8,
          child: Text(
            DateService.timeFormat(date),
            textAlign: TextAlign.right,
            style: Style.interNormal(
              color: date.minute != 0 ? Style.black.withAlpha(40) : Style.black,
              fontStyle: date.minute != 0 ? FontStyle.italic : null,
              size: 12,
            ),
          ),
        ),
      ],
    );
  }
}
