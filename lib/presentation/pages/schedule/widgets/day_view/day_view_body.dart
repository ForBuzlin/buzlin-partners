import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/pages/schedule/widgets/components/event_widget.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import '../components/_internal_components.dart';
import '../components/event_scroll_notifier.dart';
import '../event_arrangers/event_arrangers.dart';
import '../event_controller.dart';
import '../hour_indicator.dart';
import '../painters.dart';

class DayViewBody extends StatelessWidget {
  final double width;
  final double height;
  final DateTime date;
  final EventController controller;
  final DetectorBuilder dayDetectorBuilder;
  final HourIndicatorSettings hourIndicatorSettings;
  final bool showLiveLine;
  final HourIndicatorSettings liveTimeIndicatorSettings;
  final double heightPerMinute;
  final double timeLineWidth;
  final double hourHeight;
  final EventArranger eventArranger;
  final bool showVerticalLine;
  final double verticalLineOffset;
  final CellTapCallback? onTileTap;
  final MinuteSlotSize minuteSlotSize;
  final EventScrollConfiguration scrollNotifier;
  final bool showHalfHours;
  final bool showQuarterHours;
  final HourIndicatorSettings halfHourIndicatorSettings;
  final HourIndicatorSettings quarterHourIndicatorSettings;
  final ScrollController scrollController;

  const DayViewBody({
    super.key,
    required this.showVerticalLine,
    required this.width,
    required this.date,
    required this.controller,
    required this.hourIndicatorSettings,
    required this.showLiveLine,
    required this.liveTimeIndicatorSettings,
    required this.heightPerMinute,
    required this.timeLineWidth,
    required this.height,
    required this.hourHeight,
    required this.eventArranger,
    required this.verticalLineOffset,
    required this.onTileTap,
    required this.minuteSlotSize,
    required this.scrollNotifier,
    required this.scrollController,
    required this.dayDetectorBuilder,
    required this.showHalfHours,
    required this.showQuarterHours,
    required this.halfHourIndicatorSettings,
    required this.quarterHourIndicatorSettings,
  });

  @override
  Widget build(BuildContext context) {
    final fullDayEventList = controller.getFullDayEvent(date);
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        children: [
          fullDayEventList.isEmpty
              ? const SizedBox.shrink()
              : FullDayEventView(events: fullDayEventList, date: date),
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
                    dayDetectorBuilder(
                      width: width,
                      height: height,
                      heightPerMinute: heightPerMinute,
                      date: date,
                      minuteSlotSize: minuteSlotSize,
                    ),
                    Align(
                      alignment: LocalStorage.getLangLtr().index == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: EventGenerator(
                        height: height,
                        date: date,
                        onTileTap: onTileTap,
                        eventArranger: eventArranger,
                        events: controller.getEventsOnDay(date),
                        heightPerMinute: heightPerMinute,
                        calendarType: CalendarType.day,
                        scrollNotifier: scrollNotifier,
                        width: width -
                            timeLineWidth -
                            hourIndicatorSettings.offset -
                            verticalLineOffset,
                      ),
                    ),
                    TimeLine(
                      height: height,
                      hourHeight: hourHeight,
                      timeLineBuilder: _timeLineBuilder,
                      timeLineOffset: 0,
                      timeLineWidth: timeLineWidth,
                      showHalfHours: showHalfHours,
                      showQuarterHours: showQuarterHours,
                      key: ValueKey(heightPerMinute),
                    ),
                    if (showLiveLine && liveTimeIndicatorSettings.height > 0)
                      IgnorePointer(
                        child: LiveTimeIndicator(
                          liveTimeIndicatorSettings: liveTimeIndicatorSettings,
                          width: width,
                          height: height,
                          heightPerMinute: heightPerMinute,
                          timeLineWidth: timeLineWidth,
                        ),
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
