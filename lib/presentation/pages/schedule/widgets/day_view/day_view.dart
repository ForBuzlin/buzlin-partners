import 'dart:async';

import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import '../calendar_controller_provider.dart';
import '../components/calendar_app_bar.dart';
import '../components/event_scroll_notifier.dart';
import '../components/zoom_modal.dart';
import '../event_arrangers/event_arrangers.dart';
import '../event_controller.dart';
import '../hour_indicator.dart';
import 'day_view_body.dart';

class DayView extends StatefulWidget {
  final CalendarPageChangeCallBack? onPageChange;
  final double heightPerMinute;
  final double? timeLineWidth;
  final bool showLiveTimeLineInAllDays;
  final bool showVerticalLine;
  final double verticalLineOffset;
  final CellTapCallback? onEventTap;
  final Function(DateTime date)? onDateLongPress;
  final Function(DateTime date)? onDateTap;
  final MinuteSlotSize minuteSlotSize;
  final bool showHalfHours;
  final bool showQuarterHours;
  final Duration startDuration;
  final Function(DateTime date)? onHeaderTitleTap;
  final double emulateVerticalOffsetBy;
  final bool isLoading;

  const DayView({
    super.key,
    this.showVerticalLine = true,
    this.heightPerMinute = 0.7,
    this.timeLineWidth,
    this.showLiveTimeLineInAllDays = false,
    this.onPageChange,
    this.verticalLineOffset = 10,
    this.onEventTap,
    this.onDateLongPress,
    this.onDateTap,
    this.minuteSlotSize = MinuteSlotSize.minutes60,
    this.showHalfHours = false,
    this.showQuarterHours = false,
    this.startDuration = const Duration(hours: 0),
    this.onHeaderTitleTap,
    this.emulateVerticalOffsetBy = 0,
    required this.isLoading,
  });

  @override
  DayViewState createState() => DayViewState();
}

class DayViewState extends State<DayView> {
  late double _width;
  late double _height;
  late double _timeLineWidth;
  late double _hourHeight;
  late DateTime _currentDate;
  late DateTime _maxDate;
  late DateTime _minDate;
  late int _totalDays;
  late int _currentIndex;
  late EventArranger _eventArranger;
  late HourIndicatorSettings _hourIndicatorSettings;
  late HourIndicatorSettings _halfHourIndicatorSettings;
  late HourIndicatorSettings _quarterHourIndicatorSettings;
  late HourIndicatorSettings _liveTimeIndicatorSettings;
  late PageController _pageController;
  EventController? _controller;
  late ScrollController _scrollController;

  ScrollController get scrollController => _scrollController;
  late VoidCallback _reloadCallback;
  final _scrollConfiguration = EventScrollConfiguration();

  @override
  void initState() {
    super.initState();
    _reloadCallback = _reload;
    _setDateRange();
    _currentDate = DateTime.now().withoutTime;
    _regulateCurrentDate();
    _calculateHeights();
    _scrollController = ScrollController(
        initialScrollOffset:
            widget.startDuration.inMinutes * widget.heightPerMinute);

    _pageController = PageController(initialPage: _currentIndex);
    _eventArranger = const SideEventArranger();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final newController = CalendarControllerProvider.of(context)?.controller;

    if (newController != _controller) {
      _controller = newController;

      _controller!
        ..removeListener(_reloadCallback)
        ..addListener(_reloadCallback);
    }
  }

  @override
  void didUpdateWidget(DayView oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newController = CalendarControllerProvider.of(context)?.controller;

    if (newController != _controller) {
      _controller?.removeListener(_reloadCallback);
      _controller = newController;
      _controller?.addListener(_reloadCallback);
    }

    _eventArranger = const SideEventArranger();
    _calculateHeights();
  }

  @override
  void dispose() {
    _controller?.removeListener(_reloadCallback);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      _width = constraint.maxWidth;
      _updateViewDimensions();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _dayAppBar(_currentDate),
          Expanded(
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Style.white),
              child: Stack(
                children: [
                  SizedBox(
                    height: _height,
                    child: PageView.builder(
                      itemCount: _totalDays,
                      controller: _pageController,
                      onPageChanged: _onPageChange,
                      itemBuilder: (_, index) {
                        final date = DateTime(_minDate.year, _minDate.month,
                            _minDate.day + index);
                        return ValueListenableBuilder(
                          valueListenable: _scrollConfiguration,
                          builder: (_, __, ___) => DayViewBody(
                            key: ValueKey(
                                _hourHeight.toString() + date.toString()),
                            width: _width,
                            liveTimeIndicatorSettings:
                                _liveTimeIndicatorSettings,
                            dayDetectorBuilder: _pressDetectorBuilder,
                            heightPerMinute: widget.heightPerMinute,
                            hourIndicatorSettings: _hourIndicatorSettings,
                            date: date,
                            onTileTap: widget.onEventTap,
                            showLiveLine: widget.showLiveTimeLineInAllDays ||
                                date.compareWithoutTime(DateTime.now()),
                            timeLineWidth: _timeLineWidth,
                            verticalLineOffset: widget.verticalLineOffset,
                            showVerticalLine: widget.showVerticalLine,
                            height: _height,
                            controller: controller,
                            hourHeight: _hourHeight,
                            eventArranger: _eventArranger,
                            minuteSlotSize: widget.minuteSlotSize,
                            scrollNotifier: _scrollConfiguration,
                            scrollController: _scrollController,
                            showHalfHours: widget.showHalfHours,
                            showQuarterHours: widget.showQuarterHours,
                            halfHourIndicatorSettings:
                                _halfHourIndicatorSettings,
                            quarterHourIndicatorSettings:
                                _quarterHourIndicatorSettings,
                          ),
                        );
                      },
                    ),
                  ),
                  if (widget.isLoading) const CustomLoading(),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  EventController get controller {
    if (_controller == null) {
      throw "EventController is not initialized yet.";
    }

    return _controller!;
  }

  void _reload() {
    if (context.mounted) {
      setState(() {});
    }
  }

  void _updateViewDimensions() {
    _timeLineWidth = widget.timeLineWidth ?? _width * 0.13;
    _liveTimeIndicatorSettings = HourIndicatorSettings(
      color: Style.defaultLiveTimeIndicatorColor,
      height: widget.heightPerMinute,
      offset: 5 + widget.verticalLineOffset,
    );

    _hourIndicatorSettings = HourIndicatorSettings(
      color: Theme.of(context).dividerColor,
    );

    _halfHourIndicatorSettings = HourIndicatorSettings(
      color: Theme.of(context).dividerColor,
      lineStyle: LineStyle.dashed,
    );

    assert(_halfHourIndicatorSettings.height < _hourHeight,
        "halfHourIndicator height must be less than minuteHeight * 60");

    _quarterHourIndicatorSettings = HourIndicatorSettings(
      height: widget.heightPerMinute,
      color: Style.defaultBorderColor,
      offset: 5,
    );

    assert(_quarterHourIndicatorSettings.height < _hourHeight,
        "quarterHourIndicator height must be less than minuteHeight * 60");
  }

  void _calculateHeights() {
    _hourHeight = widget.heightPerMinute * 60;
    _height = _hourHeight * AppConstants.hoursADay;
  }

  void _regulateCurrentDate() {
    if (_currentDate.isBefore(_minDate)) {
      _currentDate = _minDate;
    } else if (_currentDate.isAfter(_maxDate)) {
      _currentDate = _maxDate;
    }

    _currentIndex = _currentDate.getDayDifference(_minDate);
  }

  void _setDateRange() {
    _minDate = LocalStorage.getShop()?.createdAt ??
        DateTime.now().subtractDay(365).withoutTime;
    _maxDate = DateTime.now().addDay(365).withoutTime;

    _totalDays = _maxDate.getDayDifference(_minDate) + 1;
  }

  Widget _pressDetectorBuilder({
    required DateTime date,
    required double height,
    required double width,
    required double heightPerMinute,
    required MinuteSlotSize minuteSlotSize,
  }) {
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
                onLongPress: () => widget.onDateLongPress?.call(
                  DateTime(
                    date.year,
                    date.month,
                    date.day,
                    0,
                    minuteSlotSize.minutes * i,
                  ),
                ),
                onTap: () {
                  widget.onDateTap?.call(
                    DateTime(
                      date.year,
                      date.month,
                      date.day,
                      0,
                      minuteSlotSize.minutes * i,
                    ),
                  );
                },
                child: SizedBox(width: width, height: heightPerSlot),
              ),
            ),
        ],
      ),
    );
  }

  Widget _dayAppBar(DateTime date) {
    return CalendarAppBar(
      startDate: _currentDate,
      onFilterTap: onFilterTap,
      onTipTap: onTipTap,
      onTitleTapped: () async {
        if (widget.onHeaderTitleTap != null) {
          widget.onHeaderTitleTap!(date);
        } else {
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: _minDate,
            lastDate: _maxDate,
          );

          if (selectedDate == null) return;
          jumpToDate(selectedDate);
        }
      },
      calendarType: CalendarType.day,
      isFilter: _controller?.isFilter,
    );
  }

  void _onPageChange(int index) {
    if (context.mounted) {
      setState(() {
        _currentDate = DateTime(
          _currentDate.year,
          _currentDate.month,
          _currentDate.day + (index - _currentIndex),
        );
        _currentIndex = index;
      });
    }
    animateToDuration(widget.startDuration);
    widget.onPageChange?.call(_currentDate, _currentIndex);
  }

  void onFilterTap() => Scaffold.of(context).openEndDrawer();

  void onTipTap() {
    AppHelpers.showCustomModalBottomSheet(
      context: context,
      modal: const ZoomModal(),
    );
  }

  void jumpToDate(DateTime date) {
    if (date.isBefore(_minDate) || date.isAfter(_maxDate)) {
      throw "Invalid date selected.";
    }
    _pageController.jumpToPage(_minDate.getDayDifference(date));
  }

  Future<void> animateToDate(DateTime date,
      {Duration? duration, Curve? curve}) async {
    if (date.isBefore(_minDate) || date.isAfter(_maxDate)) {
      throw "Invalid date selected.";
    }
    await _pageController.animateToPage(
      _minDate.getDayDifference(date),
      duration: duration ?? const Duration(milliseconds: 300),
      curve: curve ?? Curves.ease,
    );
  }

  Future<void> animateToDuration(
    Duration startDuration, {
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = Curves.linear,
  }) async {
    final offSetForSingleMinute = _height / 24 / 60;
    final startDurationInMinutes = startDuration.inMinutes;

    final offset = offSetForSingleMinute *
        (startDurationInMinutes > 3600 ? 3600 : startDurationInMinutes);
    animateTo(offset.toDouble(), duration: duration, curve: curve);
  }

  void animateTo(
    double offset, {
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = Curves.linear,
  }) {
    _scrollController.animateTo(offset, duration: duration, curve: curve);
  }
}
