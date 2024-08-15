import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/pages/pages.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:remixicon/remixicon.dart';
import 'widgets/delivery_address_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'widgets/pickup_address_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/order_tab_bar.dart';

@RoutePage()
class OrderPage extends ConsumerStatefulWidget {
  const OrderPage({super.key});

  @override
  ConsumerState<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late RefreshController _refreshController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(orderCartProvider.notifier).fetchCarts(
          isCalculate: true,
          onSuccess: () {
            ref
                .read(orderUserProvider.notifier)
                .setInitialUser(ref.watch(orderCartProvider).selectedUser);
          });
      ref.read(orderCartProvider.notifier).setType(TrKeys.pickup);
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderCartProvider);
    final notifier = ref.read(orderCartProvider.notifier);
    final productsNotifier = ref.read(orderProductsProvider.notifier);
    final pointState = ref.watch(pickupPointsProvider);
    final userState = ref.watch(orderUserProvider);
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: SizedBox(
        // onWillPop: () {
        //   // final stocks =
        //   //     LocalStorage.getBags()[ ref.read(orderCartProvider).selectedBagIndex].bagProducts ?? [];
        //   // productsNotifier.updateProducts(cartStocks: stocks);
        //   Navigator.pop(context);
        //   return Future(() => true);
        // },
        child: Scaffold(
          backgroundColor: Style.greyColor,
          appBar: AppBar(
            backgroundColor: Style.white,
            centerTitle: false,
            elevation: 1,
            title: Text(
              "${AppHelpers.getTranslation(TrKeys.bag)} — ${state.selectedBagIndex + 1}",
              style: Style.interNormal(size: 16),
            ),
            leading: const PopButton(),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40.0),
              child: OrderTabBar(
                tabController: _tabController,
                onTap: (v) {
                  notifier.setType(v == 0 ? TrKeys.pickup : TrKeys.delivery);

                  Delayed(milliseconds: 300).run(() {
                    notifier.fetchCarts(isCalculate: true);
                  });
                },
              ),
            ),
          ),
          body: SmartRefresher(
            controller: _refreshController,
            onRefresh: () {
              _refreshController.refreshCompleted();
              notifier.fetchCarts(isCalculate: true);
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Style.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding:
                          REdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SelectUserWidget(),
                          if (userState.selectedUser != null &&
                              state.orderType == TrKeys.pickup &&
                              AppHelpers.getPhoneRequired() &&
                              userState.selectedUser?.phone == null)
                            Column(
                              children: [
                                8.verticalSpace,
                                UnderlinePhoneField(
                                  onchange: (user) => notifier.setPhone(user),
                                  isHint: true,
                                ),
                              ],
                            ),
                          8.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: UnderlinedTextField(
                                  hint: TrKeys.coupon,
                                  onChanged: notifier.setCoupon,
                                  initialText: state.coupon,
                                  suffixIcon: state.checkedCoupon != null &&
                                          state.isCouponLoading == false
                                      ? const Icon(
                                          Remix.check_double_line)
                                      : const SizedBox.shrink(),
                                ),
                              ),
                              8.horizontalSpace,
                              ApplyButton(
                                bgColor: Style.unselect,
                                titleColor: Style.black,
                                radius: 12,
                                title: TrKeys.apply,
                                onTap: () {
                                  notifier.checkCoupon(context: context);
                                },
                                isLoading: state.isCouponLoading,
                              ),
                            ],
                          ),
                          4.verticalSpace,
                          if (state.checkedCoupon?.id != null)
                            Text(
                              "${state.checkedCoupon?.name ?? " "} -${state.checkedCoupon?.type == 'fix' ? AppHelpers.numberFormat(number: state.checkedCoupon?.price) : "${state.checkedCoupon?.price}" "%"}",
                              style: Style.interRegular(
                                  size: 12, color: Style.red),
                            ),
                          12.verticalSpace,
                          state.orderType == TrKeys.pickup
                              ? PickupAddressWidget(
                                  pickupAddress: state.pickupAddress,
                                  pointLoading: pointState.isLoading,
                                  selectedBagIndex: state.selectedBagIndex,
                                )
                              : DeliveryAddressWidget(
                                  pickupAddress: state.pickupAddress,
                                  selectedBagIndex: state.selectedBagIndex,
                                ),
                        ],
                      ),
                    ),
                  ),
                  state.isButtonLoading
                      ? SizedBox(
                          height: MediaQuery.sizeOf(context).height / 3,
                          child: const Loading())
                      : Column(
                          children: [
                            Padding(
                              padding: REdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 24,
                                bottom: 16,
                              ),
                              child: TitleAndIcon(
                                title:
                                    "${state.paginateResponse?.stocks?.length ?? 0} ${AppHelpers.getTranslation(TrKeys.products)}",
                                titleSize: 14,
                                rightTitleColor: Style.red,
                                rightTitle:
                                    state.paginateResponse?.stocks?.isEmpty ??
                                            true
                                        ? null
                                        : AppHelpers.getTranslation(
                                            TrKeys.clearAll),
                                onRightTap: () {
                                  notifier.clearProductBag(context);
                                  notifier.removeOrderedBag(context);
                                  productsNotifier
                                      .updateProducts(cartStocks: []);
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            ListView.builder(
                              padding: REdgeInsets.symmetric(horizontal: 16),
                              shrinkWrap: true,
                              itemCount:
                                  state.paginateResponse?.stocks?.length ?? 0,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final stock =
                                    state.paginateResponse?.stocks?[index];
                                return FoodStockItem(
                                  stock: stock,
                                  onDelete: () => notifier.deleteProductCount(
                                    id: stock?.id,
                                    updateProducts: (stocks) {
                                      if (stocks.isEmpty) {
                                        Navigator.pop(context);
                                      }
                                      productsNotifier.updateProducts(
                                          cartStocks: stocks);
                                    },
                                  ),
                                  onIncrease: () {
                                    notifier.increaseProductCount(
                                      productIndex: index,
                                      onSuccess: () {
                                        final stocks = LocalStorage.getBags()[
                                                    state.selectedBagIndex]
                                                .bagProducts ??
                                            [];
                                        productsNotifier.updateProducts(
                                            cartStocks: stocks);
                                      },
                                    );
                                  },
                                  onDecrease: () {
                                    notifier.decreaseProductCount(
                                      productIndex: index,
                                      context: context,
                                      onSuccess: () {
                                        final stocks = LocalStorage.getBags()[
                                                    state.selectedBagIndex]
                                                .bagProducts ??
                                            [];
                                        productsNotifier.updateProducts(
                                            cartStocks: stocks);
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 110.r,
            padding: REdgeInsets.only(top: 24, left: 24, right: 24),
            decoration: const BoxDecoration(
              color: Style.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2 - 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppHelpers.getTranslation(TrKeys.totalAmount),
                        style:
                            Style.interNormal(color: Style.textColor, size: 14),
                      ),
                      4.verticalSpace,
                      state.isButtonLoading
                          ? Container(
                              height: 28.h,
                              decoration: BoxDecoration(
                                color: Style.bg,
                                 borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
                              ),
                            )
                          : AutoSizeText(
                              AppHelpers.numberFormat(
                                  number: (state.totalPrice)),
                              style: Style.interSemi(size: 24),
                              maxLines: 1,
                            ),
                    ],
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: CustomButton(
                    height: 54,
                    radius: 20,
                    active:
                        (state.paginateResponse?.stocks?.isNotEmpty ?? false) &&
                            userState.selectedUser != null &&
                            (state.orderType == TrKeys.pickup
                                ? state.pickupAddress?.deliveryPoint != null
                                : state.deliveryAddress?.location != null),
                    title: AppHelpers.getTranslation(TrKeys.placeOrder),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        if (state.paginateResponse?.stocks?.isEmpty ?? true) {
                          AppHelpers.errorSnackBar(context,
                              text:
                                  AppHelpers.getTranslation(TrKeys.cartEmpty));
                          return;
                        }
                        if (userState.selectedUser == null) {
                          AppHelpers.errorSnackBar(context,
                              text: AppHelpers.getTranslation(
                                  TrKeys.pleaseSelectAUser));
                          return;
                        }

                        if (state.pickupAddress == null) {
                          AppHelpers.errorSnackBar(context,
                              text: AppHelpers.getTranslation(
                                  TrKeys.pleaseSelectCountry));
                          return;
                        }
                        if ((state.orderType == TrKeys.pickup) &&
                            state.pickupAddress?.deliveryPoint == null) {
                          AppHelpers.errorSnackBar(context,
                              text: AppHelpers.getTranslation(
                                  TrKeys.selectPointAddress));
                          return;
                        }
                        if (state.orderType == TrKeys.delivery) {
                          if (state.deliveryAddress?.location == null) {
                            AppHelpers.errorSnackBar(context,
                                text: AppHelpers.getTranslation(
                                    TrKeys.selectedAddress));
                            return;
                          }
                          if (state.deliveryPrice == null) {
                            AppHelpers.errorSnackBar(context,
                                text: AppHelpers.getTranslation(
                                    TrKeys.noDeliveryPrice));
                            return;
                          }
                        }
                        if (!(state.selectedUser != null &&
                            state.orderType == TrKeys.pickup &&
                            AppHelpers.getPhoneRequired() &&
                            state.selectedUser?.phone == null)) {
                          notifier.setPhone(state.selectedUser?.phone ??
                              state.deliveryAddress?.phone);
                        }
                        AppHelpers.showCustomModalBottomDragSheet(
                          context: context,
                          modal: (m) => const DeliveryTimeModal(),
                          isDismissible: false,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
