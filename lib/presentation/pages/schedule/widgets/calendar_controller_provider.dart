import 'package:flutter/widgets.dart';
import 'event_controller.dart';

class CalendarControllerProvider extends InheritedWidget {
  final EventController controller;

  const CalendarControllerProvider({
    super.key,
    required this.controller,
    required super.child,
  }) ;

  static CalendarControllerProvider? of(
      BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<CalendarControllerProvider>();
    return result;
  }

  @override
  bool updateShouldNotify(CalendarControllerProvider oldWidget) =>
      oldWidget.controller != controller;
}
