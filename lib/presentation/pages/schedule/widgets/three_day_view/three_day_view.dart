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
import 'three_day_view_body.dart';

class ThreeDayView extends StatefulWidget {
  final CalendarPageChangeCallBack? onPageChange;
  final Duration startDuration;
  final double heightPerMinute;
  final double? timeLineWidth;
  final double timeLineOffset;
  final double? width;
  final bool showVerticalLines;
  final double weekTitleHeight;
  final CellTapCallback? onEventTap;
  final bool showWeekends;
  final Function(DateTime date)? onDateLongPress;
  final Function(DateTime date)? onDateTap;
  final MinuteSlotSize minuteSlotSize;
  final bool showHalfHours;
  final bool showQuarterHours;
  final double emulateVerticalOffsetBy;
  final Function(DateTime date)? onHeaderTitleTap;
  final bool showWeekDayAtBottom;
  final bool isLoading;

  const ThreeDayView({
    super.key,
    this.heightPerMinute = 1,
    this.timeLineOffset = 0,
    this.showVerticalLines = true,
    this.width,
    this.timeLineWidth,
    this.onPageChange,
    this.weekTitleHeight = 48,
    this.onEventTap,
    this.onDateLongPress,
    this.onDateTap,
    this.showWeekends = true,
    this.minuteSlotSize = MinuteSlotSize.minutes5,
    this.onHeaderTitleTap,
    this.showHalfHours = false,
    this.showQuarterHours = false,
    this.emulateVerticalOffsetBy = 0,
    this.showWeekDayAtBottom = false,
    required this.isLoading,
    required this.startDuration,
  })  : assert((timeLineOffset) >= 0,
            "timeLineOffset must be greater than or equal to 0"),
        assert(width == null || width > 0,
            "Calendar width must be greater than 0."),
        assert(timeLineWidth == null || timeLineWidth > 0,
            "Time line width must be greater than 0."),
        assert(
            heightPerMinute > 0, "Height per minute must be greater than 0.");

  @override
  ThreeDayViewState createState() => ThreeDayViewState();
}

class ThreeDayViewState extends State<ThreeDayView> {
  late double _width;
  late double _height;
  late double _timeLineWidth;
  late double _hourHeight;
  late DateTime _currentStartDate;
  late DateTime _currentEndDate;
  late DateTime _maxDate;
  late DateTime _minDate;
  late DateTime _currentWeek;
  late int _totalWeeks;
  late int _currentIndex;
  late EventArranger _eventArranger;
  late HourIndicatorSettings _hourIndicatorSettings;

  late HourIndicatorSettings _halfHourIndicatorSettings;
  late HourIndicatorSettings _liveTimeIndicatorSettings;
  late HourIndicatorSettings _quarterHourIndicatorSettings;

  late PageController _pageController;

  late double _weekTitleWidth;

  late VoidCallback _reloadCallback;

  EventController? _controller;

  late ScrollController _scrollController;

  ScrollController get scrollController => _scrollController;

  late List<WeekDays> _weekDays;

  final _scrollConfiguration = EventScrollConfiguration();

  @override
  void initState() {
    super.initState();
    _reloadCallback = _reload;
    _currentWeek = DateTime.now().withoutTime;
    _setWeekDays();
    _setDateRange();
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

    if (_controller != newController) {
      _controller = newController;

      _controller!
        ..removeListener(_reloadCallback)
        ..addListener(_reloadCallback);
    }
  }

  @override
  void didUpdateWidget(ThreeDayView oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newController = CalendarControllerProvider.of(context)?.controller;

    if (newController != _controller) {
      _controller?.removeListener(_reloadCallback);
      _controller = newController;
      _controller?.addListener(_reloadCallback);
    }

    _setWeekDays();

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
      _width = widget.width ?? constraint.maxWidth;
      _updateViewDimensions();
      return SizedBox(
        width: _width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _defaultWeekPageHeaderBuilder(_currentStartDate, _currentEndDate),
            Expanded(
              child: DecoratedBox(
                decoration: const BoxDecoration(color: Style.white),
                child: Stack(
                  children: [
                    SizedBox(
                      height: _height,
                      width: _width,
                      child: PageView.builder(
                        itemCount: _totalWeeks,
                        controller: _pageController,
                        onPageChanged: _onPageChange,
                        itemBuilder: (_, index) {
                          final dates = DateTime(_minDate.year, _minDate.month,
                                  _minDate.day + (index * 3))
                              .datesOfThree();
                          return ValueListenableBuilder(
                            valueListenable: _scrollConfiguration,
                            builder: (_, __, ___) => ThreeDayViewBody(
                              key: ValueKey(
                                  _hourHeight.toString() + dates[0].toString()),
                              height: _height,
                              width: _width,
                              weekTitleWidth: _weekTitleWidth,
                              weekTitleHeight: widget.weekTitleHeight,
                              weekDayBuilder: _defaultWeekDayBuilder,
                              weekNumberBuilder: _defaultWeekNumberBuilder,
                              weekDetectorBuilder: _defaultPressDetectorBuilder,
                              liveTimeIndicatorSettings:
                                  _liveTimeIndicatorSettings,
                              onTileTap: widget.onEventTap,
                              onDateLongPress: widget.onDateLongPress,
                              onDateTap: widget.onDateTap,
                              heightPerMinute: widget.heightPerMinute,
                              hourIndicatorSettings: _hourIndicatorSettings,
                              halfHourIndicatorSettings:
                                  _halfHourIndicatorSettings,
                              quarterHourIndicatorSettings:
                                  _quarterHourIndicatorSettings,
                              dates: dates,
                              showLiveLine: _showLiveTimeIndicator(dates),
                              timeLineOffset: widget.timeLineOffset,
                              timeLineWidth: _timeLineWidth,
                              verticalLineOffset: 0,
                              showVerticalLine: widget.showVerticalLines,
                              controller: controller,
                              hourHeight: _hourHeight,
                              scrollController: _scrollController,
                              eventArranger: _eventArranger,
                              weekDays: _weekDays,
                              minuteSlotSize: widget.minuteSlotSize,
                              scrollConfiguration: _scrollConfiguration,
                              showHalfHours: widget.showHalfHours,
                              showQuarterHours: widget.showQuarterHours,
                              emulateVerticalOffsetBy:
                                  widget.emulateVerticalOffsetBy,
                              showWeekDayAtBottom: widget.showWeekDayAtBottom,
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
        ),
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
    if (mounted) setState(() {});
  }

  void _setWeekDays() {
    _weekDays = _currentWeek.threeDay;

    if (!widget.showWeekends) {
      _weekDays
        ..remove(WeekDays.saturday)
        ..remove(WeekDays.sunday);
    }
  }

  void _updateViewDimensions() {
    _timeLineWidth = widget.timeLineWidth ?? _width * 0.13;

    _liveTimeIndicatorSettings = HourIndicatorSettings(
      color: Style.defaultLiveTimeIndicatorColor,
      height: widget.heightPerMinute,
      offset: 5,
    );

    _hourIndicatorSettings = HourIndicatorSettings(
      color: Theme.of(context).dividerColor,
    );

    _weekTitleWidth =
        (_width - _timeLineWidth - _hourIndicatorSettings.offset) / 3;

    _halfHourIndicatorSettings = HourIndicatorSettings(
      color: Theme.of(context).dividerColor,
      lineStyle: LineStyle.dashed,
    );

    _quarterHourIndicatorSettings = const HourIndicatorSettings(
      color: Style.defaultBorderColor,
    );
  }

  void _calculateHeights() {
    _hourHeight = widget.heightPerMinute * 60;
    _height = _hourHeight * AppConstants.hoursADay;
  }

  void _regulateCurrentDate() {
    if (_currentWeek.isBefore(_minDate)) {
      _currentWeek = _minDate;
    } else if (_currentWeek.isAfter(_maxDate)) {
      _currentWeek = _maxDate;
    }
    _currentStartDate = _currentWeek.subtractDay(1);
    _currentEndDate = _currentWeek.addDay(1);
    _currentIndex = _minDate.getThreeDayDifference(_currentEndDate) - 1;
  }

  void _setDateRange() {
    _minDate = LocalStorage.getShop()?.createdAt?.fixThreeDay ??
        DateTime.now().subtractDay(365).fixThreeDay;

    _maxDate = DateTime.now().addDay(3 * 100 + 1).withoutTime;

    _totalWeeks = _minDate.getThreeDayDifference(_maxDate);
  }

  Widget _defaultPressDetectorBuilder({
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
                onTap: () => widget.onDateTap?.call(
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

  Widget _defaultWeekDayBuilder(DateTime date) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppHelpers.getTranslation(WeekDays.values[date.weekday - 1].name).substring(0,3)),
          Text(date.day.toString()),
        ],
      ),
    );
  }

  Widget _defaultWeekNumberBuilder(DateTime date) {
    final daysToAdd = DateTime.thursday - date.weekday;
    final thursday = daysToAdd > 0
        ? date.add(Duration(days: daysToAdd))
        : date.subtract(Duration(days: daysToAdd.abs()));
    final weekNumber =
        (date.difference(DateTime(thursday.year)).inDays / 3).floor() + 1;
    return Center(
      child: Text("$weekNumber"),
    );
  }

  Widget _defaultWeekPageHeaderBuilder(
    DateTime startDate,
    DateTime endDate,
  ) {
    return CalendarAppBar(
      startDate: _currentStartDate,
      endDate: _currentEndDate,
      onFilterTap: onFilterTap,
      onTipTap: onTipTap,
      onTitleTapped: () async {
        if (widget.onHeaderTitleTap != null) {
          widget.onHeaderTitleTap!(startDate);
        } else {
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: startDate,
            firstDate: _minDate,
            lastDate: _maxDate,
          );

          if (selectedDate == null) return;
          jumpToWeek(selectedDate);
        }
      },
      calendarType: CalendarType.threeDay,
      isFilter: _controller?.isFilter,
    );
  }

  void _onPageChange(int index) {
    if (context.mounted) {
      setState(() {
        _currentStartDate = DateTime(
          _currentStartDate.year,
          _currentStartDate.month,
          _currentStartDate.day + (index - _currentIndex) * 3,
        );
        _currentEndDate = _currentStartDate.add(const Duration(days: 2));
        _currentIndex = index;
      });
    }
    widget.onPageChange?.call(_currentStartDate, _currentIndex);
  }

  void onFilterTap() => Scaffold.of(context).openEndDrawer();

  void onTipTap() {
    AppHelpers.showCustomModalBottomSheet(
      context: context,
      modal: const ZoomModal(),
    );
  }

  int get currentPage => _currentIndex;

  void jumpToWeek(DateTime week) {
    _pageController.jumpToPage(_minDate.getThreeDayDifference(week));
  }

  DateTime get currentDate => DateTime(
      _currentStartDate.year, _currentStartDate.month, _currentStartDate.day);

  bool _showLiveTimeIndicator(List<DateTime> dates) =>
      dates.any((date) => date.compareWithoutTime(DateTime.now()));
}
