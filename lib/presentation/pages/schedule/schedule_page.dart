import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'drawer/drawer_page.dart';
import 'widgets/calendar_controller_provider.dart';
import 'widgets/calendar_view_body.dart';
import 'widgets/event_controller.dart';

class SchedulePage extends ConsumerStatefulWidget {
  const SchedulePage({super.key});

  @override
  ConsumerState<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends ConsumerState<SchedulePage> {
  late JustTheController tooltipController;

  @override
  void initState() {
    tooltipController = JustTheController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.refresh(bookingProvider.notifier).fetchBookings(
            context: context,
            isRefresh: true,
            startTime: DateTime.now(),
            endTime: DateTime.now(),
          );
    });
    super.initState();
  }

  @override
  void dispose() {
    tooltipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bookingProvider);
    return CalendarControllerProvider(
      controller: EventController()
        ..addAll(state.bookings)
        ..setFilter(state.selectMaster != -1 || state.status != null),
      child: CustomScaffold(
        extendBody: true,
        backgroundColor: Style.white,
        endDrawer: (c) => Drawer(
          width: MediaQuery.sizeOf(context).width / 1.5,
          backgroundColor: Style.transparent,
          child: const ScheduleDrawerPage(),
        ),
        body: (c) => const CalendarViewBody(),
        bottomNavigationBar: (c) => Padding(
          padding: REdgeInsets.only(bottom: 20, right: 16, left: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              JustTheTooltip(
                preferredDirection: AxisDirection.up,
                controller: tooltipController,
                content: Padding(
                  padding: REdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppHelpers.getTranslation(TrKeys.statusInformation)),
                      4.verticalSpace,
                      ...BookingStatus.values.mapIndexed((e, i) =>
                          _statusColorItem(AppHelpers.getBookingStatus(e))),
                    ],
                  ),
                ),
                child: CustomActionButton(
                  onPressed: () {
                    tooltipController.showTooltip();
                  },
                  icon: Icons.info_outline,
                ),
              ),
              12.verticalSpace,
              CustomActionButton(
                onPressed: () {
                  context.pushRoute(const CreateEventRoute());
                },
                icon: Icons.add,
              ),
              100.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  _statusColorItem(String status) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 16.r,
            width: 16.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppHelpers.getStatusColor(status),
            ),
          ),
          2.horizontalSpace,
          Text(
            AppHelpers.getTranslation(status),
            style: Style.interNormal(size: 12),
          ),
        ],
      ),
    );
  }
}
