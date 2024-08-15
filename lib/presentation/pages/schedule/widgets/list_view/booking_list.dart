import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/application/bookings/booking_provider.dart';
import 'package:venderuzmart/infrastructure/services/enums.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/pages/schedule/widgets/components/calendar_app_bar.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'booking_item.dart';

class BookingList extends StatefulWidget {
  const BookingList({super.key});

  @override
  State<BookingList> createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final notifier = ref.read(bookingProvider.notifier);
      final state = ref.watch(bookingProvider);
      return Column(
        children: [
          CalendarAppBar(
            startDate: DateTime.now(),
            calendarType: CalendarType.list,
            onFilterTap: () => Scaffold.of(context).openEndDrawer(),
            isFilter: state.selectMaster != -1 || state.status != null,
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(color: Style.bg),
            child: state.isLoading
                ? const Loading()
                : SmartRefresher(
                    controller: _refreshController,
                    onLoading: () {
                      notifier.fetchBookings(
                        context: context,
                        controller: _refreshController,
                      );
                    },
                    onRefresh: () {
                      notifier.fetchBookings(
                        context: context,
                        isRefresh: true,
                        controller: _refreshController,
                      );
                    },
                    child: ListView.builder(
                        itemCount: state.bookings.length,
                        padding:
                            REdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        itemBuilder: (context, index) {
                          return BookingItem(booking: state.bookings[index]);
                        }),
                  ),
          )),
        ],
      );
    });
  }
}
