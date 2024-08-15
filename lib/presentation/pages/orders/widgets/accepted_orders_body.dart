import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'no_orders.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';

class AcceptedOrdersBody extends StatefulWidget {
  const AcceptedOrdersBody({super.key}) ;

  @override
  State<AcceptedOrdersBody> createState() => _AcceptedOrdersBodyState();
}

class _AcceptedOrdersBodyState extends State<AcceptedOrdersBody> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final event = ref.read(acceptedOrdersProvider.notifier);
        final state = ref.watch(acceptedOrdersProvider);
        return SmartRefresher(
          physics: const BouncingScrollPhysics(),
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onLoading: () {
            final filtersState = ref.watch(ordersFilterProvider);

            event.fetchAcceptedOrders(
              refreshController: _refreshController,
              from: filtersState.selectTime.isNotEmpty
                  ? DateService.dateFormatDay(filtersState.selectTime.first)
                  : null,
              to: filtersState.selectTime.isNotEmpty
                  ? DateService.dateFormatDay(filtersState.selectTime.last)
                  : null,
              deliveryType: filtersState.selectOrderType,
              paymentStatus: filtersState.selectPaymentStatus,
              paymentId: filtersState.selectPaymentType,
              paymentIds: filtersState.paymentIds,
            );
          },
          onRefresh: () {
            final filtersState = ref.watch(ordersFilterProvider);

            event.fetchAcceptedOrders(
              refreshController: _refreshController,
              isRefresh: true,
              from: filtersState.selectTime.isNotEmpty
                  ? DateService.dateFormatDay(filtersState.selectTime.first)
                  : null,
              to: filtersState.selectTime.isNotEmpty
                  ? DateService.dateFormatDay(filtersState.selectTime.last)
                  : null,
              deliveryType: filtersState.selectOrderType,
              paymentStatus: filtersState.selectPaymentStatus,
              paymentId: filtersState.selectPaymentType,
              paymentIds: filtersState.paymentIds,
            );
          },
          child: state.isLoading
              ? const LoadingList(
                  horizontalPadding: 16,
                  verticalPadding: 16,
                )
              : state.orders.isNotEmpty
                  ? ListView.builder(
                      padding: REdgeInsets.only(
                          right: 16, left: 16, top: 16, bottom: 100),
                      shrinkWrap: true,
                      itemCount: state.orders.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => OrderItem(
                        order: state.orders[index],
                        onTap: () {
                          context.pushRoute(
                            OrderDetailsRoute(
                              order: state.orders[index],
                              acceptedOrdersController: _refreshController,
                            ),
                          );
                        },
                      ),
                    )
                  : const NoOrders(),
        );
      },
    );
  }
}
