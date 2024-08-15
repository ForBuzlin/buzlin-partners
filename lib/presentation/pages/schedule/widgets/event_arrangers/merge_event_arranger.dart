part of 'event_arrangers.dart';

class MergeEventArranger extends EventArranger {
  const MergeEventArranger();

  @override
  List<OrganizedCalendarEventData> arrange({
    required List<BookingData> events,
    required double height,
    required double width,
    required double heightPerMinute,
  }) {
    final arrangedEvents = <OrganizedCalendarEventData>[];

    for (final event in events) {
      final startTime = event.startDate!;
      final endTime = event.endDate!;

      final eventStart = startTime.getTotalMinutes;
      final eventEnd = endTime.getTotalMinutes == 0
          ? AppConstants.minutesADay
          : endTime.getTotalMinutes;

      final arrangeEventLen = arrangedEvents.length;

      var eventIndex = -1;

      for (var i = 0; i < arrangeEventLen; i++) {
        final arrangedEventStart =
            arrangedEvents[i].startDuration.getTotalMinutes;
        final arrangedEventEnd =
            arrangedEvents[i].endDuration.getTotalMinutes == 0
                ? AppConstants.minutesADay
                : arrangedEvents[i].endDuration.getTotalMinutes;

        if (_checkIsOverlapping(
            arrangedEventStart, arrangedEventEnd, eventStart, eventEnd)) {
          eventIndex = i;
          break;
        }
      }

      if (eventIndex == -1) {
        final top = eventStart * heightPerMinute;
        final bottom = eventEnd * heightPerMinute == height
            ? 0.0
            : height - eventEnd * heightPerMinute;

        final newEvent = OrganizedCalendarEventData(
          top: top,
          bottom: bottom,
          left: 0,
          right: 0,
          startDuration: startTime.copyFromMinutes(eventStart),
          endDuration: endTime.copyFromMinutes(eventEnd),
          events: [event],
        );

        arrangedEvents.add(newEvent);
      } else {
        final arrangedEventData = arrangedEvents[eventIndex];

        final arrangedEventStart =
            arrangedEventData.startDuration.getTotalMinutes;
        final arrangedEventEnd =
            arrangedEventData.endDuration.getTotalMinutes == 0
                ? AppConstants.minutesADay
                : arrangedEventData.endDuration.getTotalMinutes;

        final startDuration = math.min(eventStart, arrangedEventStart);
        final endDuration = math.max(eventEnd, arrangedEventEnd);

        final top = startDuration * heightPerMinute;
        final bottom = endDuration * heightPerMinute == height
            ? 0.0
            : height - endDuration * heightPerMinute;

        final newEvent = OrganizedCalendarEventData(
          top: top,
          bottom: bottom,
          left: 0,
          right: 0,
          startDuration:
              arrangedEventData.startDuration.copyFromMinutes(startDuration),
          endDuration:
              arrangedEventData.endDuration.copyFromMinutes(endDuration),
          events: arrangedEventData.events..add(event),
        );

        arrangedEvents[eventIndex] = newEvent;
      }
    }

    return arrangedEvents;
  }

  bool _checkIsOverlapping(int arrangedEventStart, int arrangedEventEnd,
      int eventStart, int eventEnd) {
    var result = (arrangedEventStart >= eventStart &&
            arrangedEventStart <= eventEnd) ||
        (arrangedEventEnd >= eventStart && arrangedEventEnd <= eventEnd) ||
        (eventStart >= arrangedEventStart && eventStart <= arrangedEventEnd) ||
        (eventEnd >= arrangedEventStart && eventEnd <= arrangedEventEnd);

    if (result) {
      result = result && (arrangedEventEnd != eventStart);
    }
    return result;
  }
}
