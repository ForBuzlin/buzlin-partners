import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/ads/ads_provider.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'widgets/ads_item.dart';

@RoutePage()
class AdsPage extends ConsumerStatefulWidget {
  const AdsPage({super.key}) ;

  @override
  ConsumerState<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends ConsumerState<AdsPage> {
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(adsProvider.notifier).fetchAds(isRefresh: true),
    );
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(adsProvider);
          final notifier = ref.read(adsProvider.notifier);
          return Directionality(
            textDirection: LocalStorage.getLangLtr(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomAppBar(
                    bottomPadding: 12,
                    height: 102,
                    child: Row(
                      children: [
                        const PopButton(),
                        Text(
                          AppHelpers.getTranslation(TrKeys.ads),
                          style: Style.interNormal(size: 16),
                        ),
                      ],
                    )),
                Expanded(
                  child: SmartRefresher(
                    controller: refreshController,
                    onRefresh: () => notifier.fetchAds(
                      context: context,
                      controller: refreshController,
                      isRefresh: true,
                    ),
                    child: state.isLoading
                        ? const LoadingList(
                            verticalPadding: 16,
                            itemBorderRadius: 12,
                            horizontalPadding: 12,
                            itemPadding: 10,
                            itemHeight: 68,
                          )
                        : state.list.isEmpty
                            ? NoDataInfo(
                                title: AppHelpers.getTranslation(TrKeys.noData))
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.list.length,
                                padding: REdgeInsets.only(
                                    right: 16, top: 20, left: 16, bottom: 100),
                                itemBuilder: (context, index) => AdsItem(
                                  ads: state.list[index],
                                  purchase: () {
                                    notifier.purchaseAds(context, index: index,
                                        updated: () {
                                      notifier.fetchAds(
                                          isRefresh: true,
                                          context: context,
                                          controller: refreshController);
                                    });
                                  },
                                ),
                              ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
