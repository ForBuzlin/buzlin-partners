import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/pages/schedule/create/booking_payment_modal.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddNotePage extends ConsumerStatefulWidget {
  final DateTime startTime;

  const AddNotePage({super.key, required this.startTime});

  @override
  ConsumerState<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<AddNotePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(createBookingProvider.notifier)
          .calculateBooking(context: context, date: widget.startTime);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createBookingProvider);
    final notifier = ref.read(createBookingProvider.notifier);
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: Style.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              height: 90,
              bottomPadding: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppHelpers.getTranslation(TrKeys.optionalNotes)),
                ],
              ),
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                            vertical: 24.r, horizontal: 16.r),
                        shrinkWrap: true,
                        itemCount: state.calculate?.items?.length ?? 0,
                        itemBuilder: (context, index) {
                          final selectMaster = state.calculate?.items?[index];
                          final errors = state.calculate?.items
                                  ?.firstWhere(
                                      (element) =>
                                          element.serviceMaster?.service?.id ==
                                          selectMaster
                                              ?.serviceMaster?.service?.id,
                                      orElse: () => CalculateItem())
                                  .errors ??
                              [];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              24.verticalSpace,
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      selectMaster?.serviceMaster?.service
                                              ?.translation?.title ??
                                          "",
                                      style: Style.interNormal(),
                                    ),
                                  ),
                                  Text(
                                    AppHelpers.numberFormat(
                                        number:
                                            selectMaster?.serviceMaster?.price),
                                    style: Style.interNormal(size: 18),
                                  ),
                                ],
                              ),
                              4.verticalSpace,
                              ...?selectMaster?.extras?.map((e) => Padding(
                                padding: REdgeInsets.only(bottom: 2),
                                child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            e.translation?.title ?? "",
                                            style: Style.interNormal(size: 14),
                                          ),
                                        ),
                                        Text(
                                          AppHelpers.numberFormat(
                                              number: e.price),
                                          style: Style.interNormal(size: 16),
                                        ),
                                      ],
                                    ),
                              )),
                              Padding(
                                padding: EdgeInsets.only(top: 4.r),
                                child: Text(
                                  errors.toList().join(", "),
                                  style: Style.interNormal(
                                      color: Style.red, size: 12),
                                ),
                              ),
                              8.verticalSpace,
                              CustomTextFormField(
                                hint: TrKeys.notesAndSpecial,
                                onChanged: (text) {
                                  notifier.addNote(note: text, index: index);
                                },
                              ),
                              if (selectMaster?.serviceMaster?.service?.type ==
                                  TrKeys.offlineOut)
                                Padding(
                                  padding: EdgeInsets.only(top: 8.r),
                                  child: CustomTextFormField(
                                    validation: AppValidators.emptyCheck,
                                    hint: TrKeys.address,
                                    onChanged: (text) {
                                      notifier.addAddress(
                                          address: text, index: index);
                                    },
                                  ),
                                ),
                            ],
                          );
                        }),
                    state.isLoading
                        ? const Loading()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PriceItem(
                                title: TrKeys.subtotal,
                                price: state.calculate?.price,
                              ),
                              PriceItem(
                                title: TrKeys.extrasPrice,
                                price: state.calculate?.totalExtrasPrice,
                              ),
                              // PriceItem(
                              //   title: TrKeys.commissionFee,
                              //   price: state.calculate?.totalCommissionFee,
                              // ),
                              PriceItem(
                                title: TrKeys.serviceFee,
                                price: state.calculate?.totalServiceFee,
                              ),
                              if ((state.calculate?.totalDiscount ?? 0) > 0)
                                PriceItem(
                                  title: TrKeys.discount,
                                  price: state.calculate?.totalDiscount,
                                  discount: true,
                                ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  16.verticalSpace,
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.r),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          AppHelpers.getTranslation(
                                              TrKeys.total),
                                          style: Style.interNormal(size: 16),
                                        ),
                                        Text(
                                          AppHelpers.numberFormat(
                                              number:
                                                  state.calculate?.totalPrice),
                                          style: Style.interNormal(size: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                    100.verticalSpace,
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Row(
              children: [
                const BlackPopButton(),
                10.horizontalSpace,
                Expanded(
                  child: CustomButton(
                      title: AppHelpers.getTranslation(TrKeys.next),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            modal: BookingPaymentBottomSheet(
                              startTime: widget.startTime,
                            ),
                          );
                          return;
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
