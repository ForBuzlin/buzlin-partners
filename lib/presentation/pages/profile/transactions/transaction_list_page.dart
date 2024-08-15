import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'widgets/transaction_item.dart';
import 'package:lottie/lottie.dart';
import 'fill_wallet_screen.dart';
import 'send_price_screen.dart';

@RoutePage()
class TransactionListPage extends ConsumerStatefulWidget {
  const TransactionListPage({super.key});

  @override
  ConsumerState<TransactionListPage> createState() =>
      _TransactionListPageState();
}

class _TransactionListPageState extends ConsumerState<TransactionListPage> {
  late RefreshController controller;

  @override
  void initState() {
    controller = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(walletProvider.notifier)
          .fetchTransactions(context: context, isRefresh: true);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        body: Column(
          children: [
            CommonAppBar(
              child: Row(
                children: [
                  const PopButton(),
                  Text(
                    AppHelpers.getTranslation(TrKeys.transactions),
                    style: Style.interNormal(size: 18),
                  ),
                  const Spacer(),
                  SecondButton(
                      title: AppHelpers.getTranslation(TrKeys.send),
                      bgColor: Style.primary,
                      titleColor: Style.white,
                      onTap: () {
                        AppHelpers.showCustomModalBottomDragSheet(
                          context: context,
                          modal: (c) => const SendPriceScreen(),
                        );
                      }),
                  8.horizontalSpace,
                  SecondButton(
                      title: AppHelpers.getTranslation(TrKeys.add),
                      bgColor: Style.primary,
                      titleColor: Style.white,
                      onTap: () {
                        AppHelpers.showCustomModalBottomDragSheet(
                          context: context,
                          modal: (c) => const FillWalletScreen(),
                        );
                      }),
                  16.horizontalSpace
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(walletProvider);
                final notifier = ref.read(walletProvider.notifier);
                return state.isTransactionLoading
                    ? const Expanded(
                        child: LoadingList(
                          verticalPadding: 16,
                          itemBorderRadius: 12,
                          horizontalPadding: 12,
                          itemPadding: 10,
                          itemHeight: 124,
                        ),
                      )
                    : Expanded(
                        child: SmartRefresher(
                          controller: controller,
                          enablePullUp: true,
                          enablePullDown: true,
                          onLoading: () {
                            notifier.fetchTransactions(
                                context: context, controller: controller);
                          },
                          onRefresh: () {
                            notifier.fetchTransactions(
                              context: context,
                              controller: controller,
                              isRefresh: true,
                            );
                          },
                          child: state.transactions.isNotEmpty
                              ? ListView.builder(
                                  padding:
                                      EdgeInsets.only(bottom: 100.r, top: 16.r),
                                  shrinkWrap: true,
                                  itemCount: state.transactions.length,
                                  itemBuilder: (context, index) {
                                    return TransactionItem(
                                        transaction: state.transactions[index]);
                                  },
                                )
                              : _empty(context),
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _empty(BuildContext context) {
    return Column(
      children: [
        32.verticalSpace,
        Lottie.asset(Assets.lottieNotificationEmpty,
            width: MediaQuery.sizeOf(context).width / 1.5),
        32.verticalSpace,
        Text(
          AppHelpers.getTranslation(TrKeys.yourTransactionsListIsEmpty),
          style: Style.interNormal(size: 18),
        )
      ],
    );
  }
}
