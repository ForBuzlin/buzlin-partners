import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class OrdersTabBar extends ConsumerWidget {
  final TabController? tabController;

  const OrdersTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(homeAppbarProvider);
    return TabBar(
        labelPadding: REdgeInsets.symmetric(horizontal: 10),
        controller: tabController,
        indicatorColor: Style.primary,
        labelColor: Style.black,
        isScrollable: true,
        unselectedLabelColor: Style.textColor,
        unselectedLabelStyle: Style.interRegular(size: 13),
        labelStyle: Style.interNormal(size: 13),
        tabs: [
          Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppHelpers.getTranslation(TrKeys.newOrder)),
                state.index == 0
                    ? Row(
                        children: [
                          4.horizontalSpace,
                          Container(
                            padding: REdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Style.primary,
                            ),
                            child: Text(
                              '${ref.watch(newOrdersProvider).totalCount}',
                              style: Style.interNormal(
                                color: Style.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.accepted),
                  maxLines: 1,
                ),
                state.index == 1
                    ? Row(
                        children: [
                          4.horizontalSpace,
                          Container(
                            padding: REdgeInsets.all(6),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Style.primary),
                            child: Text(
                              '${ref.watch(acceptedOrdersProvider).totalCount}',
                              style: Style.interNormal(
                                color: Style.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppHelpers.getTranslation(TrKeys.readyOrders)),
                state.index == 2
                    ? Row(
                        children: [
                          4.horizontalSpace,
                          Container(
                            padding: REdgeInsets.all(6),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Style.primary),
                            child: Text(
                              '${ref.watch(readyOrdersProvider).totalCount}',
                              style: Style.interNormal(
                                color: Style.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Tab(
            child: Row(
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.onAWayOrders),
                  maxLines: 1,
                ),
                state.index == 3
                    ? Row(
                        children: [
                          4.horizontalSpace,
                          Container(
                            padding: REdgeInsets.all(6),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Style.primary),
                            child: Text(
                              '${ref.watch(onAWayOrdersProvider).totalCount}',
                              style: Style.interNormal(
                                color: Style.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Tab(
            child: Row(
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.pause),
                  maxLines: 1,
                ),
                state.index == 4
                    ? Row(
                        children: [
                          4.horizontalSpace,
                          Container(
                            padding: REdgeInsets.all(6),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Style.primary),
                            child: Text(
                              '${ref.watch(pauseOrdersProvider).totalCount}',
                              style: Style.interNormal(
                                color: Style.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ]);
  }
}
