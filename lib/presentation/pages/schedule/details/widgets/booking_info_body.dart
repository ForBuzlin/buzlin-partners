import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/pages/schedule/create/widgets/select_master_bottom.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter/material.dart';
import 'client_widget.dart';
import 'service_widget.dart';

class BookingInfoBody extends ConsumerWidget {
  const BookingInfoBody({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(bookingDetailsProvider);
    final notifier = ref.read(bookingDetailsProvider.notifier);
    return state.isLoading
        ? const Loading()
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                children: [
                  ClientWidget(
                    title: TrKeys.client,
                    user: state.bookingData?.user,
                  ),
                  8.verticalSpace,
                  ClientWidget(
                    title: TrKeys.master,
                    onTap: state.bookingData?.status == 'ended' ||
                            state.bookingData?.status == 'cancelled' ||
                            AppHelpers.getUserRole == TrKeys.master
                        ? null
                        : () {
                            AppHelpers.showCustomModalBottomDragSheet(
                              initSize: 0.7,
                              context: context,
                              modal: (c) => SizedBox(
                                  child: SelectMasterBottomSheet(
                                controller: c,
                                title: state.bookingData?.serviceMaster?.service
                                        ?.translation?.title ??
                                    "",
                                serviceId: state
                                    .bookingData?.serviceMaster?.service?.id,
                                masterId: state.bookingData?.master?.id,
                                onSelect: (master) {
                                  notifier.updateBooking(
                                    context,
                                    selectedMaster: master,
                                  );
                                },
                              )),
                            );
                          },
                    user: state.bookingData?.master,
                  ),
                  8.verticalSpace,
                  ServiceWidget(
                    title: TrKeys.service,
                    bookingData: state.bookingData,
                  ),
                  12.verticalSpace,
                  if ((state.bookingData?.extrasPrice ?? 0) != 0)
                    Column(
                      children: [
                        CustomDetailItem(
                          title: TrKeys.extrasPrice,
                          value: AppHelpers.numberFormat(
                              number: state.bookingData?.extrasPrice),
                        ),
                        const Divider(color: Style.colorGrey),
                      ],
                    ),
                  // CustomDetailItem(
                  //   title: TrKeys.commissionFee,
                  //   value: AppHelpers.numberFormat(
                  //       number: state.bookingData?.commissionFee),
                  // ),
                  const Divider(color: Style.colorGrey),
                  CustomDetailItem(
                    title: TrKeys.serviceFee,
                    value: AppHelpers.numberFormat(
                        number: state.bookingData?.serviceFee),
                  ),
                  if ((state.bookingData?.giftCartPrice ?? 0) != 0)
                    Column(
                      children: [
                        const Divider(color: Style.colorGrey),
                        CustomDetailItem(
                          title: TrKeys.giftCartPrice,
                          value: AppHelpers.numberFormat(
                              number: state.bookingData?.giftCartPrice),
                        ),
                      ],
                    ),

                  if (state.bookingData?.totalPrice != null)
                    Column(
                      children: [
                        const Divider(color: Style.colorGrey),
                        CustomDetailItem(
                          title: TrKeys.totalAmount,
                          value: AppHelpers.numberFormat(
                              number: state.bookingData?.totalPrice),
                        ),
                      ],
                    ),
                  const Divider(color: Style.colorGrey),
                  CustomDetailItem(
                    title: TrKeys.paymentMethod,
                    value: AppHelpers.getTranslation(
                        state.bookingData?.transaction?.tag ?? ''),
                  ),
                  const Divider(color: Style.colorGrey),
                  CustomDetailItem(
                    title: TrKeys.paymentStatus,
                    value: AppHelpers.getTranslation(
                        state.bookingData?.transaction?.status ?? ''),
                  ),
                  const Divider(color: Style.colorGrey),
                  if (state.bookingData?.note != null)
                    Container(
                      decoration: BoxDecoration(
                        color: Style.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      margin: REdgeInsets.only(top: 8),
                      padding:
                          REdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Remix.chat_1_fill,
                            size: 24.r,
                            color: Style.black,
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: Text(
                              state.bookingData?.note ?? '',
                              style: Style.interRegular(
                                size: 13,
                                color: Style.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  100.verticalSpace,
                ],
              ),
            ),
          );
  }
}
