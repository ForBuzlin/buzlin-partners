import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EventController extends ChangeNotifier {
  EventController({EventFilter? eventFilter}) : _eventFilter = eventFilter;

  EventFilter? _eventFilter;
  bool _isFilter = false;
  final CalendarData _calendarData = CalendarData();

  List<BookingData> get events =>
      _calendarData.eventList.toList(growable: false);

  EventFilter? get eventFilter => _eventFilter;

  bool get isFilter => _isFilter;

  void addAll(List<BookingData>? events) {
    if (events == null) return;
    for (final event in events) {
      _addEvent(event);
    }
    notifyListeners();
  }

  void setFilter(bool isFilter) {
    _isFilter = isFilter;
    notifyListeners();
  }

  void add(BookingData? event) {
    if (event == null) return;
    _addEvent(event);

    notifyListeners();
  }

  void remove(BookingData event) {
    final date = event.startDate?.withoutTime;

    if (_calendarData.events[date] != null) {
      if (_calendarData.events[date]!.remove(event)) {
        _calendarData.eventList.remove(event);
        notifyListeners();
        return;
      }
    }

    _calendarData.eventList.remove(event);
    _calendarData.rangingEventList.remove(event);
    _calendarData.fullDayEventList.remove(event);
    notifyListeners();
  }

  void removeWhere(bool Function(BookingData element) test) {
    for (final e in _calendarData.events.values) {
      e.removeWhere(test);
    }
    _calendarData.rangingEventList.removeWhere(test);
    _calendarData.eventList.removeWhere(test);
    _calendarData.fullDayEventList.removeWhere(test);
    notifyListeners();
  }

  List<BookingData> getEventsOnDay(DateTime date) {
    if (_eventFilter != null) return _eventFilter!.call(date, this.events);

    final events = <BookingData>[];

    if (_calendarData.events[date] != null) {
      events.addAll(_calendarData.events[date]!);
    }

    for (final rangingEvent in _calendarData.rangingEventList) {
      if (date == rangingEvent.startDate ||
          date == rangingEvent.endDate ||
          (date.isBefore(rangingEvent.endDate ?? DateTime.now()) &&
              date.isAfter(rangingEvent.startDate ?? DateTime.now()))) {
        events.add(rangingEvent);
      }
    }

    events.addAll(getFullDayEvent(date));

    return events;
  }

  List<BookingData> getFullDayEvent(DateTime dateTime) {
    final events = <BookingData>[];
    for (final event in _calendarData.fullDayEventList) {
      if (dateTime.difference(event.startDate ?? DateTime.now()).inDays >= 0 &&
          (event.endDate?.difference(dateTime).inDays ?? 0) > 0) {
        events.add(event);
      }
    }
    return events;
  }

  void updateFilter({required EventFilter newFilter}) {
    if (newFilter != _eventFilter) {
      _eventFilter = newFilter;
      notifyListeners();
    }
  }

  void _addEvent(BookingData event) {
    assert(
        (event.endDate?.difference(event.startDate ?? DateTime.now()).inDays ??
                0) >=
            0,
        'The end date must be greater or equal to the start date');
    if (_calendarData.eventList.contains(event)) return;
    if ((event.endDate?.difference(event.startDate ?? DateTime.now()).inDays ??
            0) >
        0) {
      if (event.startDate!.isDayStart && event.endDate!.isDayStart) {
        _calendarData.fullDayEventList.addEventInSortedManner(event);
      } else {
        _calendarData.rangingEventList.addEventInSortedManner(event);
      }
    } else {
      final date = event.startDate?.withoutTime ?? DateTime.now();

      if (_calendarData.events[date] == null) {
        _calendarData.events.addAll({
          date: [event],
        });
      } else {
        _calendarData.events[date]!.addEventInSortedManner(event);
      }
    }

    _calendarData.eventList.add(event);

    notifyListeners();
  }
}

class CalendarData {
  final eventList = <BookingData>[];
  final events = <DateTime, List<BookingData>>{};
  final rangingEventList = <BookingData>[];
  final fullDayEventList = <BookingData>[];
}
