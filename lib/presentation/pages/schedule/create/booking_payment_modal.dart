import 'package:auto_route/auto_route.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/pages/schedule/widgets/calendar_controller_provider.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter/material.dart';

class BookingPaymentBottomSheet extends ConsumerStatefulWidget {
  final DateTime? startTime;

  const BookingPaymentBottomSheet({super.key, required this.startTime});

  @override
  ConsumerState<BookingPaymentBottomSheet> createState() =>
      _BookingPaymentBottomSheetState();
}

class _BookingPaymentBottomSheetState
    extends ConsumerState<BookingPaymentBottomSheet> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(createBookingProvider.notifier).fetchPayments();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createBookingProvider);
    final notifier = ref.read(createBookingProvider.notifier);
    return KeyboardDismisser(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: Style.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        padding: EdgeInsets.only(
          left: 16.r,
          right: 16.r,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            8.verticalSpace,
            Container(
              height: 4.r,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width / 2 - 48.r),
              decoration: BoxDecoration(
                  color: Style.icon,
                  borderRadius: BorderRadius.circular(100.r)),
            ),
            16.verticalSpace,
            Text(
              AppHelpers.getTranslation(TrKeys.payment),
              style: Style.interSemi(size: 22),
            ),
            16.verticalSpace,
            state.isPaymentLoading
                ? const Loading()
                : ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.zero,
                    itemCount: state.payments?.length ?? 0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          notifier.selectPayment(
                            state.payments?[index].id ?? -1,
                          );
                        },
                        child: Column(
                          children: [
                            8.verticalSpace,
                            Row(
                              children: [
                                Icon(
                                  state.payments?[index].id ==
                                          state.selectPayment
                                      ? Remix.checkbox_circle_fill
                                      : Remix.checkbox_blank_circle_line,
                                  color: state.payments?[index].id ==
                                          state.selectPayment
                                      ? Style.primary
                                      : Style.black,
                                ),
                                10.horizontalSpace,
                                Text(
                                  AppHelpers.getTranslation(
                                      state.payments?[index].tag ?? ""),
                                  style: Style.interNormal(size: 14),
                                )
                              ],
                            ),
                            const Divider(),
                            8.verticalSpace
                          ],
                        ),
                      );
                    }),
            16.verticalSpace,
            CustomButton(
                isLoading: state.isLoading,
                title: TrKeys.confirm,
                onPressed: () {
                  if (state.selectPayment != -1) {
                    notifier.createBooking(context, date: widget.startTime,
                        created: (bookingData) {
                      CalendarControllerProvider.of(context)
                          ?.controller
                          .addAll(bookingData);
                     context.router.popUntil((route) =>  route.isFirst);
                      ref
                          .read(bookingProvider.notifier)
                          .fetchBookings(context: context, isRefresh: true);
                    });
                  }
                }),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
