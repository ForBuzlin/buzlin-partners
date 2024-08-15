import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'widgets/edit_shop.dart';
import 'widgets/shop_gallary.dart';
import 'widgets/shop_socials.dart';
import 'widgets/working_time.dart';

@RoutePage()
class EditShopPage extends ConsumerStatefulWidget {
  const EditShopPage({super.key});

  @override
  ConsumerState<EditShopPage> createState() => _EditShopPageState();
}

class _EditShopPageState extends ConsumerState<EditShopPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    // ref.read(editShopCategoryProvider.notifier).initial();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Style.black,
          backgroundColor: Style.white,
          elevation: 0.5,
          centerTitle: false,
          leading: const PopButton(),
          title: Text(
            AppHelpers.getTranslation(TrKeys.editShop),
            style: Style.interNormal(),
          ),
          actions: const [
            // Column(
            //   children: [
            //     LogoutButton(
            //       isOpen: ref.watch(shopProvider).shop?.open ?? false,
            //       onChange: () {
            //         ref.read(shopProvider.notifier).setOnlineOffline();
            //       },
            //     ),
            //   ],
            // ),
            // 12.horizontalSpace,
          ],
          bottom: TabBar(
            splashBorderRadius:
                BorderRadius.circular((AppConstants.radius / 1.4).r),
            padding: REdgeInsets.symmetric(horizontal: 8),
            controller: _tabController,
            indicatorPadding: REdgeInsets.symmetric(horizontal: 12),
            indicatorColor: Style.primary,
            labelColor: Style.primary,
            unselectedLabelColor: Style.textColor,
            unselectedLabelStyle: Style.interRegular(size: 15),
            labelStyle: Style.interSemi(size: 15),
            tabs: [
              Tab(child: Text(AppHelpers.getTranslation(TrKeys.shop))),
              Tab(
                  child: Text(
                AppHelpers.getTranslation(TrKeys.workingHours),
                maxLines: 1,
              )),
              Tab(child: Text(AppHelpers.getTranslation(TrKeys.socials))),
              Tab(child: Text(AppHelpers.getTranslation(TrKeys.gallery))),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            EditShop(onSuccess: () => _tabController.animateTo(1)),
            WorkingTime(onNext: () => _tabController.animateTo(2)),
            ShopSocials(onNext: () => _tabController.animateTo(3)),
            const ShopGallery(),
          ],
        ),
      ),
    );
  }
}
