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

class NewOrdersBody extends StatelessWidget {
  const NewOrdersBody({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final event = ref.read(newOrdersProvider.notifier);
        final state = ref.watch(newOrdersProvider);
        final appbarState = ref.watch(homeAppbarProvider);
        final filtersState = ref.watch(ordersFilterProvider);
        return state.refreshController == null
            ? const Loading()
            : SmartRefresher(
                physics: const BouncingScrollPhysics(),
                controller: state.refreshController!,
                enablePullDown: true,
                enablePullUp: true,
                onLoading: () {
                  event.fetchNewOrders(
                    context: context,
                    activeTabIndex: appbarState.index,
                    from: filtersState.selectTime.isNotEmpty
                        ? DateService.dateFormatDay(
                            filtersState.selectTime.first)
                        : null,
                    to: filtersState.selectTime.isNotEmpty
                        ? DateService.dateFormatDay(
                            filtersState.selectTime.last)
                        : null,
                    deliveryType: filtersState.selectOrderType,
                    paymentStatus: filtersState.selectPaymentStatus,
                    paymentId: filtersState.selectPaymentType,
                    paymentIds: filtersState.paymentIds,
                  );
                },
                onRefresh: () {
                  event.fetchNewOrders(
                    context: context,
                    isRefresh: true,
                    activeTabIndex: appbarState.index,
                    from: filtersState.selectTime.isNotEmpty
                        ? DateService.dateFormatDay(
                            filtersState.selectTime.first)
                        : null,
                    to: filtersState.selectTime.isNotEmpty
                        ? DateService.dateFormatDay(
                            filtersState.selectTime.last)
                        : null,
                    deliveryType: filtersState.selectOrderType,
                    paymentStatus: filtersState.selectPaymentStatus,
                    paymentId: filtersState.selectPaymentType,
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
                                    newOrdersController:
                                        state.refreshController,
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
