import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/presentation/pages/schedule/widgets/list_view/booking_list.dart';
import 'three_day_view/three_day_view.dart';
import 'package:flutter/material.dart';
import 'week_view/week_view.dart';
import 'day_view/day_view.dart';

class CalendarViewBody extends ConsumerWidget {
  final double? width;

  const CalendarViewBody({super.key, this.width});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(bookingProvider);
    final notifier = ref.read(bookingProvider.notifier);
    return Padding(
      padding: REdgeInsets.only(bottom: 0),
      child: state.calendarType == 0
          ? DayView(
              startDuration: Duration(hours: DateTime.now().hour - 1),
              showHalfHours: true,
              heightPerMinute: state.calendarZoom,
              onDateTap: (s) {},
              onDateLongPress: (s) {},
              onPageChange: (s, i) {
                notifier.changeDate(context, startDate: s);
              },
              minuteSlotSize: MinuteSlotSize.minutes5,
              timeLineWidth: 48.w,
              isLoading: state.isLoading,
            )
          : state.calendarType == 1
              ? ThreeDayView(
                  startDuration: Duration(hours: DateTime.now().hour - 1),
                  showHalfHours: true,
                  heightPerMinute: state.calendarZoom,
                  onDateTap: (s) {},
                  onDateLongPress: (s) {},
                  onPageChange: (s, i) {
                    notifier.changeDate(context, startDate: s);
                  },
                  minuteSlotSize: MinuteSlotSize.minutes5,
                  timeLineWidth: 48.w,
                  isLoading: state.isLoading,
                )
              : state.calendarType == 2
                  ? WeekView(
                      startDuration: Duration(hours: DateTime.now().hour - 1),
                      showHalfHours: true,
                      heightPerMinute: state.calendarZoom,
                      onDateTap: (s) {},
                      onDateLongPress: (s) {},
                      onPageChange: (s, i) {
                        notifier.changeDate(context, startDate: s);
                      },
                      minuteSlotSize: MinuteSlotSize.minutes5,
                      timeLineWidth: 48.w,
                      isLoading: state.isLoading,
                    )
                  : const BookingList(),
    );
  }
}
