import 'dart:async';

import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/pages/schedule/widgets/components/event_widget.dart';
import '../event_arrangers/event_arrangers.dart';
import '../hour_indicator.dart';
import '../painters.dart';
import 'event_scroll_notifier.dart';

class LiveTimeIndicator extends StatefulWidget {
  final double width;
  final double height;
  final double timeLineWidth;
  final HourIndicatorSettings liveTimeIndicatorSettings;
  final double heightPerMinute;

  const LiveTimeIndicator(
      {super.key,
      required this.width,
      required this.height,
      required this.timeLineWidth,
      required this.liveTimeIndicatorSettings,
      required this.heightPerMinute});

  @override
  State<LiveTimeIndicator> createState() => _LiveTimeIndicatorState();
}

class _LiveTimeIndicatorState extends State<LiveTimeIndicator> {
  late Timer _timer;
  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();

    _currentDate = DateTime.now();
    _timer = Timer(const Duration(seconds: 1), setTimer);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void setTimer() {
    if (context.mounted) {
      setState(() {
        _currentDate = DateTime.now();
        _timer = Timer(const Duration(seconds: 1), setTimer);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(widget.width, widget.height),
      painter: CurrentTimeLinePainter(
        color: widget.liveTimeIndicatorSettings.color,
        height: widget.liveTimeIndicatorSettings.height,
        offset: Offset(
          widget.timeLineWidth + widget.liveTimeIndicatorSettings.offset,
          _currentDate.getTotalMinutes * widget.heightPerMinute,
        ),
      ),
    );
  }
}

class TimeLine extends StatelessWidget {
  final double timeLineWidth;
  final double hourHeight;
  final double height;
  final double timeLineOffset;
  final Function(DateTime date) timeLineBuilder;
  final bool showHalfHours;
  final bool showQuarterHours;

  static DateTime get _date => DateTime.now();

  double get _halfHourHeight => hourHeight / 2;

  const TimeLine({
    super.key,
    required this.timeLineWidth,
    required this.hourHeight,
    required this.height,
    required this.timeLineOffset,
    required this.timeLineBuilder,
    this.showHalfHours = false,
    this.showQuarterHours = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      key: ValueKey(hourHeight),
      constraints: BoxConstraints(
        maxWidth: timeLineWidth,
        minWidth: timeLineWidth,
        maxHeight: height,
        minHeight: height,
      ),
      child: Stack(
        children: [
          for (int i = 1; i < AppConstants.hoursADay; i++)
            _timelinePositioned(
              topPosition: hourHeight * i - timeLineOffset,
              bottomPosition: height - (hourHeight * (i + 1)) + timeLineOffset,
              hour: i,
            ),
          if (showHalfHours)
            for (int i = 0; i < AppConstants.hoursADay; i++)
              _timelinePositioned(
                topPosition: hourHeight * i - timeLineOffset + _halfHourHeight,
                bottomPosition:
                    height - (hourHeight * (i + 1)) + timeLineOffset,
                hour: i,
                minutes: 30,
              ),
          if (showQuarterHours)
            for (int i = 0; i < AppConstants.hoursADay; i++) ...[
              /// this is for 15 minutes
              _timelinePositioned(
                topPosition:
                    hourHeight * i - timeLineOffset + hourHeight * 0.25,
                bottomPosition:
                    height - (hourHeight * (i + 1)) + timeLineOffset,
                hour: i,
                minutes: 15,
              ),

              /// this is for 45 minutes
              _timelinePositioned(
                topPosition:
                    hourHeight * i - timeLineOffset + hourHeight * 0.75,
                bottomPosition:
                    height - (hourHeight * (i + 1)) + timeLineOffset,
                hour: i,
                minutes: 45,
              ),
            ],
        ],
      ),
    );
  }

  Widget _timelinePositioned({
    required double topPosition,
    required double bottomPosition,
    required int hour,
    int minutes = 0,
  }) {
    return Positioned(
      top: topPosition,
      left: 0,
      right: 0,
      bottom: bottomPosition,
      child: SizedBox(
        height: hourHeight,
        width: timeLineWidth,
        child: timeLineBuilder.call(
          DateTime(_date.year, _date.month, _date.day, hour, minutes),
        ),
      ),
    );
  }
}

class EventGenerator extends StatelessWidget {
  final double height;
  final double width;
  final List<BookingData> events;
  final double heightPerMinute;
  final EventArranger eventArranger;
  final CalendarType calendarType;
  final DateTime date;
  final CellTapCallback? onTileTap;
  final EventScrollConfiguration scrollNotifier;

  const EventGenerator({
    super.key,
    required this.height,
    required this.width,
    required this.events,
    required this.heightPerMinute,
    required this.eventArranger,
    required this.calendarType,
    required this.date,
    required this.onTileTap,
    required this.scrollNotifier,
  });

  List<Widget> _generateEvents(BuildContext context) {
    final events = eventArranger.arrange(
      events: this.events,
      height: height,
      width: width,
      heightPerMinute: heightPerMinute,
    );
    return List.generate(events.length, (index) {
      return Positioned(
        top: events[index].top,
        bottom: events[index].bottom,
        left: events[index].left,
        right: events[index].right,
        child: GestureDetector(
          onTap: () => onTileTap?.call(events[index].events, date),
          child: Builder(builder: (context) {
            if (scrollNotifier.shouldScroll &&
                events[index]
                    .events
                    .any((element) => element == scrollNotifier.event)) {
              _scrollToEvent(context);
            }
            return EventWidget(
              bookingData: events[index].events[0],
              calendarType: calendarType,
            );
          }),
        ),
      );
    });
  }

  void _scrollToEvent(BuildContext context) {
    final duration = scrollNotifier.duration ?? Duration.zero;
    final curve = scrollNotifier.curve ?? Curves.ease;

    scrollNotifier.resetScrollEvent();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await Scrollable.ensureVisible(
          context,
          duration: duration,
          curve: curve,
          alignment: 0.5,
        );
      } finally {
        scrollNotifier.completeScroll();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: _generateEvents(context),
      ),
    );
  }
}

class PressDetector extends StatelessWidget {
  final double height;
  final double width;
  final double heightPerMinute;
  final DateTime date;
  final Function(DateTime date)? onDateLongPress;
  final Function(DateTime date)? onDateTap;
  final MinuteSlotSize minuteSlotSize;

  const PressDetector({
    super.key,
    required this.height,
    required this.width,
    required this.heightPerMinute,
    required this.date,
    required this.onDateLongPress,
    required this.onDateTap,
    required this.minuteSlotSize,
  });

  @override
  Widget build(BuildContext context) {
    final heightPerSlot = minuteSlotSize.minutes * heightPerMinute;
    final slots = (AppConstants.hoursADay * 60) ~/ minuteSlotSize.minutes;

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          for (int i = 0; i < slots; i++)
            Positioned(
              top: heightPerSlot * i,
              left: 0,
              right: 0,
              bottom: height - (heightPerSlot * (i + 1)),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => onDateTap?.call(
                  DateTime(
                    date.year,
                    date.month,
                    date.day,
                    0,
                    minuteSlotSize.minutes * i,
                  ),
                ),
                onLongPress: () => onDateLongPress?.call(
                  DateTime(
                    date.year,
                    date.month,
                    date.day,
                    0,
                    minuteSlotSize.minutes * i,
                  ),
                ),
                child: SizedBox(width: width, height: heightPerSlot),
              ),
            ),
        ],
      ),
    );
  }
}
