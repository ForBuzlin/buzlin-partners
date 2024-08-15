import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class EventWidget extends StatefulWidget {
  final BookingData bookingData;
  final CalendarType calendarType;

  const EventWidget({
    super.key,
    required this.bookingData,
    required this.calendarType,
  });

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  late double minFontSize;
  late double maxFontSize;
  late double size;

  getFontSize() {
    switch (widget.calendarType) {
      case CalendarType.day:
        minFontSize = 12;
        maxFontSize = 12;
        size = 12;
        break;
      case CalendarType.threeDay:
        minFontSize = 10;
        maxFontSize = 10;
        size = 10;
        break;
      case CalendarType.week:
        minFontSize = 8;
        maxFontSize = 8;
        size = 8;
        break;
      case CalendarType.list:
        minFontSize = 10;
        maxFontSize = 10;
        size = 10;
        break;
    }
  }

  @override
  void initState() {
    getFontSize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .pushRoute(BookingDetailsRoute(bookingData: widget.bookingData)),
      child: LayoutBuilder(builder: (context, constraints) {
        final height = constraints.maxHeight;
        return Container(
          margin: REdgeInsets.only(right: 1, bottom: 1),
          color: Style.white,
          child: Container(
            decoration: BoxDecoration(
              color: AppHelpers.getStatusColor(widget.bookingData.status).withAlpha(120),
              borderRadius: BorderRadius.circular(size/1.4),
            ),
            child: Row(
              children: [
                Container(
                  width: size/1.4,
                  decoration: BoxDecoration(
                    color: AppHelpers.getStatusColor(widget.bookingData.status),
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(size/1.4)),
                  ),
                ),
                (size/2).horizontalSpace,
                Expanded(
                  child: Padding(
                    padding: REdgeInsets.symmetric(vertical: size / 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AutoSizeText(
                          DateService.timeFormatMulti([
                            widget.bookingData.startDate,
                            widget.bookingData.endDate
                          ]),
                          style: Style.interRegular(
                              color: Style.black, size: maxFontSize),
                          minFontSize: minFontSize,
                          maxLines:
                              widget.calendarType == CalendarType.week ? 1 : 1,
                        ),
                        (height / 30).verticalSpace,
                        if (widget.bookingData.user?.firstname != null)
                          Flexible(
                            child: AutoSizeText(
                              widget.bookingData.user?.firstname ?? '',
                              style: Style.interNormal(
                                  color: Style.black, size: maxFontSize),
                              maxLines: 1,
                              minFontSize: minFontSize,
                            ),
                          ),
                        if (widget.bookingData.serviceMaster?.service?.translation
                                    ?.title !=
                                null &&
                            height > 55)
                          Flexible(
                            child: AutoSizeText(
                              "${widget.bookingData.serviceMaster?.service?.translation?.title ?? ''} ${AppHelpers.getUserRole != TrKeys.master ? "(${widget.bookingData.master?.firstname ?? ''})" : ''}",
                              style: Style.interNormal(
                                color: Style.black,
                                size: maxFontSize,
                              ),
                              maxLines: widget.calendarType == CalendarType.week
                                  ? 1
                                  : 2,
                              minFontSize: minFontSize,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                (size / 2).horizontalSpace,
              ],
            ),
          ),
        );
      }),
    );
  }
}

class FullDayEventView extends StatelessWidget {
  const FullDayEventView({
    super.key,
    this.boxConstraints = const BoxConstraints(maxHeight: 100),
    required this.events,
    this.padding,
    this.itemView,
    this.onEventTap,
    required this.date,
  });

  final BoxConstraints boxConstraints;

  final List<BookingData> events;

  final EdgeInsets? padding;
  final Widget Function(BookingData? event)? itemView;
  final Function(BookingData event, DateTime date)? onEventTap;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: boxConstraints,
      child: ListView.builder(
        itemCount: events.length,
        padding: padding ?? EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          onTap: () => onEventTap?.call(events[index], date),
          child: itemView?.call(events[index]) ??
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(1),
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  events[index].serviceMaster?.translation?.title ?? '',
                  style: Style.interNormal(),
                  maxLines: 1,
                ),
              ),
        ),
      ),
    );
  }
}
