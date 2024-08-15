import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

part 'merge_event_arranger.dart';

part 'side_event_arranger.dart';

abstract class EventArranger {
  const EventArranger();
  List<OrganizedCalendarEventData> arrange({
    required List<BookingData> events,
    required double height,
    required double width,
    required double heightPerMinute,
  });
}

class OrganizedCalendarEventData {
  final double top;
  final double bottom;
  final double left;
  final double right;
  final List<BookingData> events;
  final DateTime startDuration;
  final DateTime endDuration;
  OrganizedCalendarEventData({
    required this.startDuration,
    required this.endDuration,
    required this.top,
    required this.bottom,
    required this.left,
    required this.right,
    required this.events,
  });

  OrganizedCalendarEventData.empty()
      : startDuration = DateTime.now(),
        endDuration = DateTime.now(),
        right = 0,
        left = 0,
        events = const [],
        top = 0,
        bottom = 0;

  OrganizedCalendarEventData getWithUpdatedRight(double right) =>
      OrganizedCalendarEventData(
        top: top,
        bottom: bottom,
        endDuration: endDuration,
        events: events,
        left: left,
        right: right,
        startDuration: startDuration,
      );
}
