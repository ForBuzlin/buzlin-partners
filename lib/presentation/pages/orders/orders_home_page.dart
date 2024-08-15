import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remixicon/remixicon.dart';
import 'package:auto_route/auto_route.dart';
import 'widgets/accepted_orders_body.dart';
import 'widgets/on_a_way_orders_body.dart';
import 'widgets/orders_filter_modal.dart';
import 'widgets/pause_orders_body.dart';
import 'widgets/ready_orders_body.dart';
import 'package:flutter/material.dart';
import 'widgets/new_orders_body.dart';
import 'widgets/orders_tab_bar.dart';

@RoutePage()
class OrdersHomePage extends ConsumerStatefulWidget {
  const OrdersHomePage({super.key});

  @override
  ConsumerState<OrdersHomePage> createState() => _OrdersHomePageState();
}

class _OrdersHomePageState extends ConsumerState<OrdersHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    if (AppHelpers.getUserRole != TrKeys.master) {
      _tabController?.addListener(
        () {
          if (!(_tabController?.indexIsChanging ?? false)) {
            ref.read(homeAppbarProvider.notifier).setAppbarDetails(
                  _tabController?.index,
                );
          }
        },
      );
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ref.read(newOrdersProvider.notifier).fetchNewOrders(
                isRefresh: true,
                context: context,
                activeTabIndex: ref.read(homeAppbarProvider).index,
                updateTotal: (count) =>
                    ref.read(homeAppbarProvider.notifier).setAppbarDetails(0),
              );
          ref
              .read(acceptedOrdersProvider.notifier)
              .fetchAcceptedOrders(isRefresh: true);
          ref
              .read(readyOrdersProvider.notifier)
              .fetchReadyOrders(isRefresh: true);
          ref
              .read(onAWayOrdersProvider.notifier)
              .fetchOnAWayOrders(isRefresh: true);
          ref
              .read(pauseOrdersProvider.notifier)
              .fetchPauseOrders(isRefresh: true);
        },
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    listeners();
    return CustomScaffold(
      backgroundColor: Style.greyColor,
      body: (colors) => AppHelpers.getUserRole == TrKeys.master
          ? const NotPermission()
          : Column(
              children: [
                CustomAppBar(
                  bottomPadding: 0,
                  height: 146,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppHelpers.getTranslation(TrKeys.orders),
                            style: Style.interNormal(size: 16),
                          ),
                          const Spacer(),
                          SecondButton(
                            title: TrKeys.addOrder,
                            onTap: () {
                              context.pushRoute(const PosSystemRoute());
                            },
                            prefix: Icon(
                              Remix.add_line,
                              size: 20.r,
                              color: Style.white,
                            ),
                          ),
                          8.horizontalSpace,
                          IconButton(
                            onPressed: () {
                              AppHelpers.showCustomModalBottomDragSheet(
                                  initSize: 0.78,
                                  isDrag: false,
                                  context: context,
                                  modal: (s) => const OrdersFilterModal());
                            },
                            icon: Icon(
                              Remix.sound_module_line,
                              size: 24.r,
                              color: Style.black,
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 8.r),
                      Flexible(
                          child: OrdersTabBar(tabController: _tabController)),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    controller: _tabController,
                    children: const [
                      NewOrdersBody(),
                      AcceptedOrdersBody(),
                      ReadyOrdersBody(),
                      OnAWayOrdersBody(),
                      PauseOrdersBody(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  listeners() {
    if (AppHelpers.getUserRole != TrKeys.master) {
      ref.listen(ordersFilterProvider, (previous, next) {
        if (previous?.selectPaymentStatus != next.selectPaymentStatus ||
            previous?.selectPaymentType != next.selectPaymentType ||
            previous?.selectOrderType != next.selectOrderType ||
            previous?.selectTime != next.selectTime) {
          ref.read(newOrdersProvider.notifier).fetchNewOrders(
              context: context,
              isRefresh: true,
              activeTabIndex: ref.watch(homeAppbarProvider).index,
              from: next.selectTime.isNotEmpty
                  ? DateService.dateFormatDay(next.selectTime.first)
                  : null,
              to: next.selectTime.isNotEmpty
                  ? DateService.dateFormatDay(next.selectTime.last)
                  : null,
              deliveryType: next.selectOrderType,
              paymentStatus: next.selectPaymentStatus,
              paymentId: next.selectPaymentType,
              paymentIds: next.paymentIds);
          ref.read(acceptedOrdersProvider.notifier).fetchAcceptedOrders(
              isRefresh: true,
              from: next.selectTime.isNotEmpty
                  ? DateService.dateFormatDay(next.selectTime.first)
                  : null,
              to: next.selectTime.isNotEmpty
                  ? DateService.dateFormatDay(next.selectTime.last)
                  : null,
              deliveryType: next.selectOrderType,
              paymentStatus: next.selectPaymentStatus,
              paymentId: next.selectPaymentType,
              paymentIds: next.paymentIds);
          ref.read(onAWayOrdersProvider.notifier).fetchOnAWayOrders(
              isRefresh: true,
              from: next.selectTime.isNotEmpty
                  ? DateService.dateFormatDay(next.selectTime.first)
                  : null,
              to: next.selectTime.isNotEmpty
                  ? DateService.dateFormatDay(next.selectTime.last)
                  : null,
              deliveryType: next.selectOrderType,
              paymentStatus: next.selectPaymentStatus,
              paymentId: next.selectPaymentType,
              paymentIds: next.paymentIds);
          ref.read(readyOrdersProvider.notifier).fetchReadyOrders(
              isRefresh: true,
              from: next.selectTime.isNotEmpty
                  ? DateService.dateFormatDay(next.selectTime.first)
                  : null,
              to: next.selectTime.isNotEmpty
                  ? DateService.dateFormatDay(next.selectTime.last)
                  : null,
              deliveryType: next.selectOrderType,
              paymentStatus: next.selectPaymentStatus,
              paymentId: next.selectPaymentType,
              paymentIds: next.paymentIds);
        }
      });
    }
  }
}
