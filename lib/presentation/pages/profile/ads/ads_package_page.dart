import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/pages/profile/ads/widgets/ads_package_item.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';

import 'widgets/product_multi_selection.dart';

@RoutePage()
class AdsPackagePage extends ConsumerStatefulWidget {
  const AdsPackagePage({super.key}) ;

  @override
  ConsumerState<AdsPackagePage> createState() => _AdsPackagePageState();
}

class _AdsPackagePageState extends ConsumerState<AdsPackagePage> {
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(adsPackageProvider.notifier).fetchAds(isRefresh: true),
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
      body: Directionality(
        textDirection: LocalStorage.getLangLtr(),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(adsPackageProvider);
            final notifier = ref.read(adsPackageProvider.notifier);
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
                          AppHelpers.getTranslation(TrKeys.adPackages),
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
                                itemBuilder: (context, index) =>
                                    AdsPackagesItem(
                                  ads: state.list[index],
                                  assign: () {
                                    ref
                                        .read(createAdsProvider.notifier)
                                        .setPackage(state.list[index]);
                                    AppHelpers.showCustomModalBottomSheet(
                                      context: context,
                                      modal: const MultiSelectionWidget(),
                                    );
                                  },
                                ),
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
