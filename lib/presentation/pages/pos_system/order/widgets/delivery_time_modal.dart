import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'payment_item.dart';
import 'title_price.dart';

class DeliveryTimeModal extends ConsumerStatefulWidget {
  const DeliveryTimeModal({super.key});

  @override
  ConsumerState<DeliveryTimeModal> createState() => _DeliveryTimePageState();
}

class _DeliveryTimePageState extends ConsumerState<DeliveryTimeModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(orderPaymentProvider.notifier)
          ..fetchPayments()
          ..fetchCurrencies(LocalStorage.getBags()[
                  ref.watch(orderCartProvider).selectedBagIndex]
              .selectedCurrency)
          ..getCalculate(
            bagData: LocalStorage.getBags()[
                ref.watch(orderCartProvider).selectedBagIndex],
            type: ref.watch(orderCartProvider).orderType,
          );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Container(
        padding: MediaQuery.viewInsetsOf(context),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 32.r),
              child: Column(
                children: [
                  const ModalDrag(),
                  Consumer(
                    builder: (context, ref, child) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Style.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r),
                          ),
                        ),
                        padding: REdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Consumer(
                          builder: (context, ref, child) {
                            final timeState = ref.watch(deliveryTimeProvider);
                            final timeEvent =
                                ref.read(deliveryTimeProvider.notifier);
                            return Column(
                              children: [
                                TitleAndIcon(
                                  title: AppHelpers.getTranslation(
                                      TrKeys.deliveryTime),
                                ),
                                24.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppHelpers.getTranslation(
                                          TrKeys.selectedTimeAndDay),
                                      style: Style.interSemi(
                                          size: 14, letterSpacing: -0.3),
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          AppHelpers.showCustomModalBottomSheet(
                                        paddingTop:
                                            MediaQuery.paddingOf(context).top,
                                        context: context,
                                        radius: 12,
                                        modal: SelectDateModal(
                                          initialDate:
                                              DateTime.now().toString(),
                                          onDateSaved: (date) =>
                                              timeEvent.setDeliveryDate(
                                            DateFormat('yyyy-MM-dd HH:mm')
                                                .format(date ?? DateTime.now()),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        timeState.deliveryDate,
                                        style: Style.interNormal(
                                            size: 14, letterSpacing: -0.3),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final orderPaymentState = ref.watch(orderPaymentProvider);
                      final orderPaymentNotifier =
                          ref.read(orderPaymentProvider.notifier);
                      return PopupMenuButton<int>(
                        itemBuilder: (context) {
                          return orderPaymentState.currencies
                              .map(
                                (currency) => PopupMenuItem<int>(
                                  value: currency.id,
                                  child: Text(
                                    '${currency.title ?? ''}(${currency.symbol ?? ''})',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                      color: Style.black,
                                      letterSpacing: -14 * 0.02,
                                    ),
                                  ),
                                ),
                              )
                              .toList();
                        },
                        onSelected: (v) => orderPaymentNotifier
                            .setSelectedCurrency(v,
                                ref.watch(orderCartProvider).selectedBagIndex,
                                success: () {
                          orderPaymentNotifier.getCalculate(
                            bagData: LocalStorage.getBags()[
                                ref.watch(orderCartProvider).selectedBagIndex],
                            type: ref.watch(orderCartProvider).orderType,
                          );
                          // ref
                          //     .read(orderCartProvider.notifier)
                          //     .fetchCarts(isGetBag: false, isCalculate: true);
                        }),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        color: Style.white,
                        elevation: 10,
                        child: SelectFromButton(
                          title: orderPaymentState.selectedCurrency?.title ??
                              AppHelpers.getTranslation(TrKeys.selectCurrency),
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Style.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: REdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        TitleAndIcon(
                          title: AppHelpers.getTranslation(TrKeys.payment),
                        ),
                        12.verticalSpace,
                        Consumer(
                          builder: (context, ref, child) {
                            final paymentState =
                                ref.watch(orderPaymentProvider);
                            final paymentEvent =
                                ref.watch(orderPaymentProvider.notifier);
                            return paymentState.isLoading
                                ? const Loading()
                                : ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: paymentState.payments.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        PaymentItem(
                                      payment: paymentState.payments[index],
                                      isSelected:
                                          paymentState.selectedIndex == index,
                                      isLast: paymentState.payments.length ==
                                          index + 1,
                                      onTap: () =>
                                          paymentEvent.setSelectedIndex(index),
                                    ),
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                  Consumer(builder: (context, ref, child) {
                    final state = ref.watch(orderPaymentProvider);
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Style.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: state.isCalculateLoading
                          ? const Loading()
                          : Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: TitleAndIcon(
                                    title:
                                        "${AppHelpers.getTranslation(TrKeys.payment)} - ${LocalStorage.getSelectedCurrency()?.symbol ?? ''}",
                                  ),
                                ),
                                24.verticalSpace,
                                TitleAndPrice(
                                  title: AppHelpers.getTranslation(
                                      TrKeys.subtotal),
                                  rightTitle: AppHelpers.numberFormat(
                                    number: state.orderCalculate?.price ?? 0,
                                    isOrder: true,
                                    symbol: state.selectedCurrency?.symbol,
                                  ),
                                  textStyle: Style.interRegular(
                                    size: 16,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                16.verticalSpace,
                                TitleAndPrice(
                                  title: AppHelpers.getTranslation(
                                      TrKeys.serviceFee),
                                  rightTitle: AppHelpers.numberFormat(
                                    number:
                                        state.orderCalculate?.serviceFee ?? 0,
                                    isOrder: true,
                                    symbol: state.selectedCurrency?.symbol,
                                  ),
                                  textStyle: Style.interRegular(
                                    size: 16,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                16.verticalSpace,
                                TitleAndPrice(
                                  title: AppHelpers.getTranslation(
                                      TrKeys.deliveryPrice),
                                  rightTitle: AppHelpers.numberFormat(
                                    number:
                                        state.orderCalculate?.deliveryFee ?? 0,
                                    isOrder: true,
                                    symbol: state.selectedCurrency?.symbol,
                                  ),
                                  textStyle: Style.interRegular(
                                      size: 16, letterSpacing: -0.3),
                                ),
                                16.verticalSpace,
                                TitleAndPrice(
                                  title: AppHelpers.getTranslation(
                                      TrKeys.totalTax),
                                  rightTitle: AppHelpers.numberFormat(
                                    number: state.orderCalculate?.totalTax ?? 0,
                                    isOrder: true,
                                    symbol: state.selectedCurrency?.symbol,
                                  ),
                                  textStyle: Style.interRegular(
                                    size: 16,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                16.verticalSpace,
                                if ((state.orderCalculate?.totalDiscount ??
                                        0) !=
                                    0)
                                  Column(
                                    children: [
                                      TitleAndPrice(
                                        title: AppHelpers.getTranslation(
                                            TrKeys.totalDiscount),
                                        rightTitle: "-${AppHelpers.numberFormat(
                                          number: state.orderCalculate
                                                  ?.totalDiscount ??
                                              0,
                                          isOrder: true,
                                          symbol:
                                              state.selectedCurrency?.symbol,
                                        )}",
                                        textStyle: Style.interRegular(
                                          size: 16,
                                          letterSpacing: -0.3,
                                          color: Style.red,
                                        ),
                                      ),
                                      16.verticalSpace,
                                    ],
                                  ),
                                if ((state.orderCalculate?.couponPrice ?? 0) !=
                                    0)
                                  Column(
                                    children: [
                                      TitleAndPrice(
                                        title: AppHelpers.getTranslation(
                                            TrKeys.coupon),
                                        rightTitle: "-${AppHelpers.numberFormat(
                                          number: state.orderCalculate
                                                  ?.couponPrice ??
                                              0,
                                          isOrder: true,
                                          symbol:
                                              state.selectedCurrency?.symbol,
                                        )}",
                                        textStyle: Style.interRegular(
                                          size: 16,
                                          letterSpacing: -0.3,
                                          color: Style.red,
                                        ),
                                      ),
                                      16.verticalSpace,
                                    ],
                                  ),
                                const Divider(color: Style.shimmerBase),
                                16.verticalSpace,
                                TitleAndPrice(
                                  title:
                                      AppHelpers.getTranslation(TrKeys.total),
                                  rightTitle: AppHelpers.numberFormat(
                                    number:
                                        state.orderCalculate?.totalPrice ?? 0,
                                    isOrder: true,
                                    symbol: state.selectedCurrency?.symbol,
                                  ),
                                  textStyle: Style.interSemi(
                                      size: 20, letterSpacing: -0.3),
                                ),
                                24.verticalSpace,
                              ],
                            ),
                    );
                  }),
                  16.verticalSpace,
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    REdgeInsets.only(left: 24, right: 24, bottom: 24, top: 8),
                decoration: const BoxDecoration(
                  color: Style.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                      background: Style.transparent,
                      textColor: Style.black,
                      borderColor: Style.black,
                      title: AppHelpers.getTranslation(TrKeys.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                    8.horizontalSpace,
                    _confirm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _confirm() {
    return Expanded(
      child: Consumer(
        builder: (context, ref, child) {
          final paymentState = ref.watch(orderPaymentProvider);
          final userState = ref.watch(orderUserProvider);
          return CustomButton(
            active: paymentState.payments.isNotEmpty,
            title: AppHelpers.getTranslation(TrKeys.confirmOrder),
            isLoading: ref.watch(createOrderProvider).isCreating,
            onPressed: () {
              if (paymentState.payments.isNotEmpty) {
                if (paymentState.payments[paymentState.selectedIndex].tag ==
                    TrKeys.wallet) {
                  final num walletPrice =
                      userState.selectedUser?.wallet?.price ?? 0;
                  final num orderPrice =
                      paymentState.orderCalculate?.totalPrice ?? 0;
                  if (walletPrice < orderPrice) {
                    AppHelpers.errorSnackBar(
                      context,
                      text: AppHelpers.getTranslation(TrKeys.notEnoughMoney),
                    );
                    return;
                  }
                }
                final cartState = ref.watch(orderCartProvider);
                cartState.orderType == TrKeys.pickup
                    ? ref.read(createOrderProvider.notifier).createOrder(
                        context,
                        deliveryType: DeliveryType.pickup,
                        user: userState.selectedUser,
                        bag: LocalStorage.getBags()[cartState.selectedBagIndex]
                            .copyWith(
                                selectedPayment: paymentState
                                    .payments[paymentState.selectedIndex],
                                selectedCurrency: cartState.selectedCurrency),
                        deliveryDate:
                            ref.watch(deliveryTimeProvider).deliveryDate,
                        orderSuccess: (int orderId) {
                          ref
                              .read(orderCartProvider.notifier)
                              .clearProductBag(context);
                          ref
                              .read(orderCartProvider.notifier)
                              .removeOrderedBag(context);
                          ref
                              .read(orderProductsProvider.notifier)
                              .updateProducts(cartStocks: []);
                          ref
                              .read(orderUserProvider.notifier)
                              .clearSelectedUserInfo();
                          ref.read(newOrdersProvider.notifier).fetchNewOrders(
                                context: context,
                                isRefresh: true,
                                activeTabIndex:
                                    ref.watch(homeAppbarProvider).index,
                              );
                          context.router.popUntilRoot();
                        },
                        stocks: ref
                                .watch(orderCartProvider)
                                .paginateResponse
                                ?.stocks ??
                            [],
                      )
                    : ref.read(createOrderProvider.notifier).createOrder(
                        context,
                        bag: LocalStorage.getBags()[cartState.selectedBagIndex]
                            .copyWith(
                                selectedPayment: paymentState
                                    .payments[paymentState.selectedIndex],
                                selectedCurrency: cartState.selectedCurrency),
                        deliveryType: DeliveryType.delivery,
                        user: userState.selectedUser,
                        deliveryDate:
                            ref.watch(deliveryTimeProvider).deliveryDate,
                        orderSuccess: (int orderId) {
                          ref
                              .read(orderCartProvider.notifier)
                              .clearProductBag(context);
                          ref
                              .read(orderCartProvider.notifier)
                              .removeOrderedBag(context);
                          ref
                              .read(orderProductsProvider.notifier)
                              .updateProducts(cartStocks: []);
                          ref
                              .read(orderUserProvider.notifier)
                              .clearSelectedUserInfo();
                          ref.read(newOrdersProvider.notifier).fetchNewOrders(
                                context: context,
                                isRefresh: true,
                                activeTabIndex:
                                    ref.watch(homeAppbarProvider).index,
                              );
                          context.router.popUntilRoot();
                          // ref
                          //     .read(orderPaymentProvider.notifier)
                          //     .createTransaction( context,orderId,
                          //         paymentState
                          //             .payments[paymentState.selectedIndex]
                          //             .id, () {});
                        },
                        stocks: ref
                                .watch(orderCartProvider)
                                .paginateResponse
                                ?.stocks ??
                            [],
                      );
              }
            },
          );
        },
      ),
    );
  }
}
