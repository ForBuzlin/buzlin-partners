import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/pages/profile/gift_card/widgets/user_gift_card_item.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:venderuzmart/application/gift_cards/user_gift_card/user_gift_card_provider.dart';

@RoutePage()
class UserGiftCardPage extends ConsumerStatefulWidget {
  const UserGiftCardPage({super.key});

  @override
  ConsumerState<UserGiftCardPage> createState() => _UserGiftCardPageState();
}

class _UserGiftCardPageState extends ConsumerState<UserGiftCardPage> {
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(userGiftCardProvider.notifier)
          .fetchUserGiftCards(isRefresh: true),
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
            final state = ref.watch(userGiftCardProvider);
            final notifier = ref.read(userGiftCardProvider.notifier);
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
                          AppHelpers.getTranslation(TrKeys.userGiftCards),
                          style: Style.interNormal(size: 16),
                        ),
                      ],
                    )),
                Expanded(
                  child: SmartRefresher(
                    controller: refreshController,
                    onRefresh: () => notifier.fetchUserGiftCards(
                      context: context,
                      controller: refreshController,
                      isRefresh: true,
                    ),
                    enablePullDown: true,
                    enablePullUp: true,
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
                                  return UserGiftCardItem(
                                    userGiftCard: state.list[index],
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
