part of 'event_arrangers.dart';

class SideEventArranger extends EventArranger {
  const SideEventArranger();

  @override
  List<OrganizedCalendarEventData> arrange({
    required List<BookingData> events,
    required double height,
    required double width,
    required double heightPerMinute,
  }) {
    final mergedEvents = const MergeEventArranger().arrange(
      events: events,
      height: height,
      width: width,
      heightPerMinute: heightPerMinute,
    );

    final arrangedEvents = <OrganizedCalendarEventData>[];

    for (final event in mergedEvents) {
      if (event.events.length == 1) {
        arrangedEvents.add(event);
        continue;
      }

      final concurrentEvents = event.events;

      if (concurrentEvents.isEmpty) continue;

      var column = 1;
      final sideEventData = <_SideEventData>[];
      var currentEventIndex = 0;

      while (concurrentEvents.isNotEmpty) {
        final event = concurrentEvents[currentEventIndex];
        final end = event.endDate!.getTotalMinutes == 0
            ? AppConstants.minutesADay
            : event.endDate!.getTotalMinutes;
        sideEventData.add(_SideEventData(column: column, event: event));
        concurrentEvents.removeAt(currentEventIndex);

        while (currentEventIndex < concurrentEvents.length) {
          if (end <
              concurrentEvents[currentEventIndex].startDate!.getTotalMinutes) {
            break;
          }

          currentEventIndex++;
        }

        if (concurrentEvents.isNotEmpty &&
            currentEventIndex >= concurrentEvents.length) {
          column++;
          currentEventIndex = 0;
        }
      }

      final slotWidth = width / column;

      for (final sideEvent in sideEventData) {
        if (sideEvent.event.startDate == null ||
            sideEvent.event.endDate == null) {
          assert(() {
            debugPrint("Start time or end time of an event can not be null. "
                "This ${sideEvent.event} will be ignored.");

            return true;
          }(), "Can not add event in the list.");

          continue;
        }

        final startTime = sideEvent.event.startDate!;
        final endTime = sideEvent.event.endDate!;
        final bottom = height -
            (endTime.getTotalMinutes == 0
                    ? AppConstants.minutesADay
                    : endTime.getTotalMinutes) *
                heightPerMinute;
        arrangedEvents.add(OrganizedCalendarEventData(
          left: slotWidth * (sideEvent.column - 1),
          right: slotWidth * (column - sideEvent.column),
          top: startTime.getTotalMinutes * heightPerMinute,
          bottom: bottom,
          startDuration: startTime,
          endDuration: endTime,
          events: [sideEvent.event],
        ));
      }
    }

    return arrangedEvents;
  }
}

class _SideEventData {
  final int column;
  final BookingData event;

  const _SideEventData({required this.column, required this.event});
}
