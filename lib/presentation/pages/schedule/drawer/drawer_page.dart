import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/bookings/booking_masters/booking_masters_provider.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class ScheduleDrawerPage extends ConsumerStatefulWidget {
  const ScheduleDrawerPage({super.key});

  @override
  ConsumerState<ScheduleDrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends ConsumerState<ScheduleDrawerPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(AppHelpers.getUserRole != 'master') {
        ref
          .read(bookingMastersProvider.notifier)
          .fetchMasters(isInitial: true, context: context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mastersState = ref.watch(bookingMastersProvider);
    final state = ref.watch(bookingProvider);
    final notifier = ref.read(bookingProvider.notifier);

    return KeyboardDismisser(
      child: Padding(
        padding: EdgeInsets.only(left: 10.r),
        child: BlurWrap(
          radius: BorderRadius.horizontal(
            left: Radius.circular(AppConstants.radius.r),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Style.white.withOpacity(0.95),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(AppConstants.radius.r),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MediaQuery.paddingOf(context).top.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  12.verticalSpace,
                  Padding(
                    padding: REdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppHelpers.getTranslation(TrKeys.calendarView),
                          style: Style.interSemi(size: 18),
                        ),
                        16.verticalSpace,
                        SizedBox(
                            height: 84,
                            child: ListView.builder(
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: REdgeInsets.only(right: 16),
                                    child: GestureDetector(
                                      onTap: () {
                                        notifier.changeCalendarType(
                                          index: index,
                                          context: context,
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          AbsorbPointer(
                                            child: CircleButton(
                                              size: 40,
                                              borderColor:
                                                  state.calendarType == index
                                                      ? Style.primary
                                                      : Style.colorGrey,
                                              backgroundColor:
                                                  state.calendarType == index
                                                      ? Style.primary
                                                      : Style.greyColor,
                                              iconColor:
                                                  state.calendarType == index
                                                      ? Style.white
                                                      : Style.black,
                                              icon: index == 0
                                                  ? Icons.view_day_outlined
                                                  : index == 1
                                                      ? Icons
                                                          .width_normal_outlined
                                                      : index == 2
                                                          ? Icons
                                                              .calendar_view_week
                                                          : Icons.list,
                                              onTap: () {},
                                            ),
                                          ),
                                          8.verticalSpace,
                                          Text(
                                            AppHelpers.getTranslation(
                                              index == 0
                                                  ? TrKeys.day
                                                  : index == 1
                                                      ? TrKeys.threeDay
                                                      : index == 2
                                                          ? TrKeys.week
                                                          : TrKeys.list,
                                            ),
                                            style: Style.interRegular(size: 14),
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                })),
                        24.verticalSpace,
                        Text(
                          AppHelpers.getTranslation(TrKeys.status),
                          style: Style.interSemi(size: 18),
                        ),
                        12.verticalSpace,
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            ...BookingStatus.values.map((e) => _statusItem(
                                status: AppHelpers.getBookingStatus(e),
                                onTap: () {
                                  notifier.changeStatus(
                                    status: AppHelpers.getBookingStatus(e),
                                    context: context,
                                  );
                                },
                                active: state.status ==
                                    AppHelpers.getBookingStatus(e))),
                          ],
                        ),
                        24.verticalSpace,

                      ],
                    ),
                  ),
                  if(AppHelpers.getUserRole != 'master')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: REdgeInsets.only(left: 16,bottom: 12),
                        child: Text(
                          AppHelpers.getTranslation(TrKeys.masters),
                          style: Style.interSemi(size: 18),
                        ),
                      ),
                      _filterItem(
                        isActive: state.selectMaster == -1,
                        title: TrKeys.all,
                        icon: Remix.team_line,
                        onTap: () {
                          notifier.changeMaster(id: -1, context: context);
                        },
                      ),
                      // _filterItem(
                      //   isActive: state.selectMaster == 1,
                      //   title: TrKeys.working,
                      //   icon: Remix.briefcase_line,
                      //   onTap: () {
                      //     notifier.changeMaster(id: 1, context: context);
                      //   },
                      // ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: mastersState.users.length,
                        itemBuilder: (context, index) => UserItem(
                          user: mastersState.users[index],
                          onTap: () {
                            notifier.changeMaster(
                                id: mastersState.users[index].id,
                                context: context);
                          },
                          isSelected: state.selectMaster ==
                              mastersState.users[index].id,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _filterItem({
    required bool isActive,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 68.r,
        margin: REdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          color: isActive ? Style.primary.withOpacity(0.08) : Style.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: REdgeInsets.symmetric(vertical: 12),
              width: 4,
              decoration: ShapeDecoration(
                color: isActive ? Style.primary : Style.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  ),
                ),
              ),
            ),
            12.horizontalSpace,
            Container(
              padding: REdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Style.black.withOpacity(0.05),
              ),
              // alignment: Alignment.center,
              child: Container(
                height: 40.r,
                width: 40.r,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Style.primary.withOpacity(0.06)),
                child: Icon(
                  icon,
                  color: Style.primary,
                  size: 21.r,
                ),
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Text(
                AppHelpers.getTranslation(title),
                style: Style.interSemi(size: 15),
              ),
            ),
            16.horizontalSpace,
          ],
        ),
      ),
    );
  }
}

_statusItem({
  required String status,
  required bool active,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: REdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: active ? Style.primary : Style.greyColor,
        border: Border.all(
          color: active ? Style.primary : Style.colorGrey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppHelpers.getTranslation(status),
            style: Style.interNormal(
                size: 14, color: active ? Style.white : Style.black),
          ),
        ],
      ),
    ),
  );
}
