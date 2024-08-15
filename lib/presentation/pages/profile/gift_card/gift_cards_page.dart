import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/gift_cards/gift_card_provider.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import '../../../routes/app_router.dart';
import 'widgets/gift_card_item.dart';

@RoutePage()
class GiftCardsPage extends ConsumerStatefulWidget {
  const GiftCardsPage({super.key});

  @override
  ConsumerState<GiftCardsPage> createState() => _GiftCardsPageState();
}

class _GiftCardsPageState extends ConsumerState<GiftCardsPage> {
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(giftCardProvider.notifier)
          .fetchGiftCards(isRefresh: true),
    );
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(giftCardProvider);
            final notifier = ref.read(giftCardProvider.notifier);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomAppBar(
                    bottomPadding: 12,
                    height: 102,
                    child: Row(
                      children: [
                        const PopButton(),
                        Text(
                          AppHelpers.getTranslation(TrKeys.giftCards),
                          style: Style.interNormal(size: 16),
                        ),
                        const Spacer(),
                        SecondButton(
                          title: TrKeys.add,
                          onTap: () {
                            refreshController.resetNoData();
                            context.pushRoute(const AddGiftCardRoute());
                          },
                          prefix: Icon(
                            Remix.add_line,
                            size: 20.r,
                            color: Style.white,
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  child: SmartRefresher(
                    controller: refreshController,
                    onRefresh: () => notifier.fetchGiftCards(
                      context: context,
                      controller: refreshController,
                      isRefresh: true,
                    ),
                    child: state.isLoading
                        ? const LoadingList(
                            verticalPadding: 12,
                            itemBorderRadius: 12,
                            horizontalPadding: 12,
                            itemHeight: 86,
                          )
                        : state.list.isEmpty
                            ? const NoItem()
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.list.length,
                                padding: REdgeInsets.all(12),
                                itemBuilder: (context, index) {
                                  return GiftCardItem(
                                    giftCard: state.list[index],
                                    onEdit: () {
                                      refreshController.resetNoData();
                                      context.pushRoute(
                                        EditGiftCardRoute(
                                          giftCardData: state.list[index],
                                        ),
                                      );
                                    },
                                    onDelete: () {
                                      AppHelpers
                                          .showCustomModalBottomSheet(
                                        context: context,
                                        modal: DeleteModal(
                                          onDelete: () {
                                            notifier.deleteGiftCard(
                                              context,
                                              state.list[index].id,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
