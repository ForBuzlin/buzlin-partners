import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'dashboard_item.dart';

class DashboardWidget extends StatelessWidget {
  final num? rAvg;
  final num? walletBalance;
  final bool isLoading;
  final StatisticsData? statisticsData;

  const DashboardWidget({
    super.key,
    required this.isLoading,
    required this.statisticsData,
    required this.rAvg,
    required this.walletBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 24),
            child: Text(
              AppHelpers.getTranslation(TrKeys.dashboard),
              style: Style.interSemi(size: 20),
            ),
          ),
          SizedBox(
            height: 148.r,
            child: ListView(
              shrinkWrap: true,
              padding: REdgeInsets.only(left: 16, right: 16, top: 12),
              scrollDirection: Axis.horizontal,
              children: AppHelpers.getUserRole != TrKeys.master
                  ? [
                      DashboardItem(
                        title: TrKeys.walletBalance,
                        price: walletBalance,
                        svg: Assets.svgWallet,
                        color: Style.green,
                        isLoading: isLoading,
                        onTap: () {
                          context.pushRoute(const TransactionListRoute());
                        },
                      ),
                      DashboardItem(
                        title: TrKeys.rating,
                        count: rAvg ?? LocalStorage.getShop()?.rAvg,
                        icon: Remix.star_line,
                        color: Style.yellow,
                        isLoading: isLoading,
                      ),
                      DashboardItem(
                        title: TrKeys.products,
                        count: statisticsData?.productsCount,
                        icon: Remix.archive_line,
                        isLoading: isLoading,
                        color: Style.orange,
                      ),
                      DashboardItem(
                        title: TrKeys.totalOrders,
                        count: statisticsData?.ordersCount,
                        icon: Remix.file_list_line,
                        color: Style.purple,
                        isLoading: isLoading,
                      ),
                      DashboardItem(
                        title: TrKeys.comments,
                        count: statisticsData?.reviewsCount,
                        icon: Remix.chat_1_fill,
                        color: Style.blueColor,
                        isLoading: isLoading,
                      ),
                      DashboardItem(
                        title: TrKeys.accepted,
                        count: statisticsData?.accepted,
                        icon: Remix.flashlight_fill,
                        color: AppHelpers.getStatusColor(TrKeys.accepted),
                        isLoading: isLoading,
                      ),
                      DashboardItem(
                        title: TrKeys.readyOrders,
                        count: statisticsData?.ready,
                        icon: Remix.check_double_line,
                        color: AppHelpers.getStatusColor(TrKeys.readyOrders),
                        isLoading: isLoading,
                      ),
                      DashboardItem(
                        title: TrKeys.onAWayOrders,
                        count: statisticsData?.onAWay,
                        icon: Remix.takeaway_line,
                        color: AppHelpers.getStatusColor(TrKeys.onAWayOrders),
                        isLoading: isLoading,
                      ),
                      DashboardItem(
                        title: TrKeys.delivered,
                        count: statisticsData?.deliveredOrdersCount,
                        icon: Remix.takeaway_line,
                        color: AppHelpers.getStatusColor(TrKeys.delivered),
                        isLoading: isLoading,
                      ),
                      DashboardItem(
                        title: TrKeys.cancelOrders,
                        count: statisticsData?.cancelOrdersCount,
                        icon: Remix.close_circle_fill,
                        color: AppHelpers.getStatusColor(TrKeys.cancelOrders),
                        isLoading: isLoading,
                      ),
                      DashboardItem(
                        title: TrKeys.totalEarned,
                        price: statisticsData?.totalEarned,
                        icon: Remix.money_dollar_circle_line,
                        color: Style.green,
                        isLoading: isLoading,
                      ),
                      DashboardItem(
                        title: TrKeys.outOfStock,
                        count: statisticsData?.productsOutOfCount,
                        icon: Icons.crisis_alert,
                        color: Style.red,
                        isLoading: isLoading,
                      ),
                    ]
                  : [
                      DashboardItem(
                        title: TrKeys.walletBalance,
                        price: walletBalance,
                        svg: Assets.svgWallet,
                        color: Style.pendingDark,
                        isLoading: isLoading,
                        onTap: () {
                          context.pushRoute(const TransactionListRoute());
                        },
                      ),
                      DashboardItem(
                        title: TrKeys.rating,
                        count: rAvg ?? LocalStorage.getUser()?.rAvg,
                        icon: Remix.star_line,
                        color: Style.yellow,
                        isLoading: isLoading,
                      ),
                    ],
            ),
          ),
        ],
      ),
    );
  }
}
