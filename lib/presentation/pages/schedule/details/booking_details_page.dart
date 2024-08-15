import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/pages/schedule/details/widgets/forms_page.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'widgets/booking_activity_body.dart';
import 'widgets/booking_info_body.dart';
import 'package:flutter/material.dart';
import 'widgets/booking_tab_bar.dart';
import 'widgets/notes_page.dart';

@RoutePage()
class BookingDetailsPage extends ConsumerStatefulWidget {
  final BookingData bookingData;

  const BookingDetailsPage({super.key, required this.bookingData});

  @override
  ConsumerState<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends ConsumerState<BookingDetailsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bookingDetailsProvider.notifier).fetchBookingDetails(
          context: context, bookingData: widget.bookingData,);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bookingDetailsProvider);
    final notifier = ref.read(bookingDetailsProvider.notifier);
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Style.background,
        body: Column(
          children: [
            CustomAppBar(
              bottomPadding: 0,
              height: 136,
              color: AppHelpers.getStatusColor(state.bookingData?.status)
                  .withOpacity(0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${AppHelpers.getTranslation(state.bookingData?.status ?? '')} — #${state.bookingData?.id ?? 0}",
                          style: Style.interSemi(size: 16),
                        ),
                      ),
                      Text(
                        DateService.dateFormatEDMY(
                            state.bookingData?.startDate),
                        style: Style.interNormal(size: 14),
                      ),
                    ],
                  ),
                  Divider(height: 12.r),
                  BookingTabBar(
                    tabController: _tabController,
                    status: state.bookingData?.status ?? '',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                children: const [
                  BookingInfoBody(),
                  NotesPage(),
                  FormsPage(),
                  BookingActivityBody(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const BlackPopButton(),
              8.horizontalSpace,
              Expanded(
                child: state.bookingData?.status == 'ended' ||
                        state.bookingData?.status == 'canceled' ||
                        state.isLoading ||
                        state.bookingData?.status == null
                    ? const SizedBox.shrink()
                    : CustomButton(
                        isLoading: state.isUpdating,
                        background: AppHelpers.getStatusColor(
                            state.bookingData?.status),
                        title: AppHelpers.changeBookingStatusButtonText(
                            state.bookingData?.status),
                        onPressed: () {
                          notifier.updateBookingStatus(
                            context,
                            status: AppHelpers.getUpdatableBookingStatus(
                                state.bookingData?.status),
                            success: () {
                              Navigator.pop(context);
                              ref.read(bookingProvider.notifier).fetchBookings(
                                    context: context,
                                    isRefresh: true,
                                  );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
