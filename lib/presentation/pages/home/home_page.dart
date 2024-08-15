import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/pages/home/widgets/dashboard.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:remixicon/remixicon.dart';
import 'package:auto_route/auto_route.dart';
import 'widgets/booking_statistic.dart';
import 'package:flutter/material.dart';
import 'widgets/booking_chart.dart';
import 'widgets/payment_report.dart';
import 'widgets/top_products.dart';
import 'widgets/sales_chart.dart';
import 'widgets/top_masters.dart';

@RoutePage()
class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends ConsumerState<DashboardPage>
    with SingleTickerProviderStateMixin {
  late RefreshController _refreshController;
  late TabController _tabController;

  List<String> list = [
    TrKeys.day,
    TrKeys.week,
  ];

  @override
  void initState() {
    _refreshController = RefreshController();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.refresh(bookingStatisticsProvider.notifier)
        ..fetchBookingReports()
        ..fetchDailyReport();
      if (AppHelpers.getUserRole != TrKeys.master) {
        ref.read(statisticsProvider.notifier)
          ..fetchStatistics()
          ..fetchProducts(isRefresh: true);
        ref.read(incomeProvider.notifier).fetchIncomeCharts();
        ref.read(bookingStatisticsProvider.notifier)
          ..fetchMasters(isRefresh: true)
          ..fetchPaymentReports(isRefresh: true)
          ..fetchBookingCharts();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final statisticState = ref.watch(statisticsProvider);
    final bookingStatisticState = ref.watch(bookingStatisticsProvider);
    return CustomScaffold(
      backgroundColor: Style.white,
      body: (colors) => Column(
        children: [
          _appBar(),
          Expanded(
            child: SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              onRefresh: _refresh,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  12.verticalSpace,
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "${AppHelpers.getTranslation(TrKeys.youHave)} ${bookingStatisticState.dailyReport?.totalCount ?? 0}\n${AppHelpers.getTranslation(TrKeys.entriesToday)}",
                      style: Style.interNormal(size: 28),
                    ),
                  ),
                  12.verticalSpace,
                  if (AppHelpers.getUserRole != TrKeys.master) _overSales(),
                  DashboardWidget(
                    isLoading: statisticState.isLoading,
                    statisticsData: statisticState.countData,
                    rAvg: ref.watch(profileProvider).userData?.shop?.rAvg,
                    walletBalance:
                        ref.watch(profileProvider).userData?.wallet?.price ??
                            LocalStorage.getUser()?.wallet?.price,
                  ),
                  BookingStatistic(
                    statistic: bookingStatisticState.bookingReportsData,
                    isLoading: bookingStatisticState.isLoading,
                  ),
                  if (AppHelpers.getUserRole != TrKeys.master)
                    PaymentReport(
                      payments: bookingStatisticState.payments,
                    ),
                  if (AppHelpers.getUserRole != TrKeys.master)
                    TopMasters(masters: bookingStatisticState.masters),
                  if (AppHelpers.getUserRole != TrKeys.master)
                    TopProductsPage(products: statisticState.topSaleProducts),
                  124.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _refresh() {
    if (AppHelpers.getUserRole != TrKeys.master) {
      ref.read(statisticsProvider.notifier)
        ..fetchStatistics(controller: _refreshController)
        ..fetchProducts(isRefresh: true);
      ref.read(incomeProvider.notifier).fetchIncomeCharts();
      ref.read(bookingStatisticsProvider.notifier)
        ..fetchMasters(isRefresh: true)
        ..fetchBookingCharts()
        ..fetchPaymentReports(isRefresh: true);
    }
    ref.read(bookingStatisticsProvider.notifier)
      ..fetchBookingReports(controller: _refreshController)
      ..fetchDailyReport();
    ref.read(profileProvider.notifier).fetchUser(context);
  }

  _appBar() {
    return CommonAppBar(
      height: 64,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            splashColor: Style.transparent,
            focusColor: Style.transparent,
            hoverColor: Style.transparent,
            highlightColor: Style.transparent,
            icon: Icon(
              Remix.menu_line,
              size: 21.r,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              context.pushRoute(const ChatListRoute());
            },
            splashColor: Style.transparent,
            focusColor: Style.transparent,
            hoverColor: Style.transparent,
            highlightColor: Style.transparent,
            icon: Icon(
              Remix.messenger_line,
              size: 21.r,
            ),
          ),
          IconButton(
            onPressed: () => context.pushRoute(const NotificationRoute()),
            icon: Builder(builder: (context) {
              final notificationState = ref.watch(notificationProvider);
              return Badge(
                backgroundColor: Style.primary,
                isLabelVisible:
                    (notificationState.countOfNotifications?.notification ??
                            0) !=
                        0,
                label: Text(notificationState.countOfNotifications?.notification
                        .toString() ??
                    "0"),
                child: Icon(
                  Remix.notification_line,
                  size: 21.r,
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  _overSales() {
    final bookingStatisticState = ref.watch(bookingStatisticsProvider);
    final incomeState = ref.watch(incomeProvider);
    return Container(
      width: double.infinity,
      height: 300.r,
      margin: REdgeInsets.only(bottom: 12, left: 16, right: 16),
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 12.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((AppConstants.radius / 1.4).r),
          color: Style.white,
          border: Border.all(color: Style.borderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppHelpers.getTranslation(TrKeys.overallSales),
            style: Style.interSemi(size: 18),
          ),
          const Spacer(),
          SizedBox(
            width: 184.w,
            height: 36.r,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Style.black,
              labelColor: Style.black,
              unselectedLabelColor: Style.textColor,
              unselectedLabelStyle: Style.interRegular(size: 14),
              labelStyle: Style.interSemi(size: 14),
              tabs: [
                Tab(
                  text: AppHelpers.getTranslation(TrKeys.services),
                ),
                Tab(
                  text: AppHelpers.getTranslation(TrKeys.products),
                ),
              ],
              padding: EdgeInsets.zero,
              indicatorPadding: REdgeInsets.symmetric(horizontal: 16),
            ),
          ),
          SizedBox(
            height: 204.r,
            child: TabBarView(controller: _tabController, children: [
              BookingChart(
                isDay: bookingStatisticState.selectType == TrKeys.day,
                totalPrice: bookingStatisticState.totalPrices,
                canceledPrice: bookingStatisticState.cancelPrices,
                chart: bookingStatisticState.chart,
                times: bookingStatisticState.time,
                isLoading: bookingStatisticState.isLoading,
              ),
              SalesChart(
                isDay: incomeState.selectType == TrKeys.day,
                price: incomeState.prices,
                chart: incomeState.incomeCharts ?? [],
                times: incomeState.time,
                isLoading: incomeState.isLoading,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
