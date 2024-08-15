import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'gallery/edit_product_gallery_body.dart';
import 'stocks/edit_product_stocks_body.dart';
import 'details/edit_food_details_body.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'stocks/whole_sale_stocks_body.dart';

@RoutePage()
class EditProductPage extends StatefulWidget {
  const EditProductPage({super.key});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              bottomPadding: 0,
              height: 146,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const PopButton(),
                      Text(
                        AppHelpers.getTranslation(TrKeys.editProduct),
                        style: Style.interNormal(size: 16),
                      ),
                      const Spacer(),
                      Center(child: Consumer(builder: (context, ref, child) {
                        final status =
                            ref.read(editFoodDetailsProvider).product?.status;
                        if (status == null) {
                          return const SizedBox.shrink();
                        } else {
                          return StatusButton(status: status);
                        }
                      })),
                      16.horizontalSpace,
                    ],
                  ),
                  Divider(height: 8.r),
                  Consumer(builder: (context, ref, child) {
                    final state = ref.watch(editFoodDetailsProvider);
                    return TabBar(
                      onTap: (index) {
                        if (state.isLoading) {
                          if (_tabController.indexIsChanging) {
                            _tabController.index = _tabController.previousIndex;
                          } else {
                            return;
                          }
                        }
                      },
                     splashBorderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      controller: _tabController,
                      indicatorPadding: REdgeInsets.symmetric(horizontal: 12),
                      indicatorColor: Style.primary,
                      labelColor: Style.primary,
                      isScrollable: true,
                      unselectedLabelColor: Style.textColor,
                      unselectedLabelStyle: Style.interRegular(size: 14),
                      labelStyle: Style.interSemi(size: 15),
                      tabs: [
                        Tab(
                            child: Text(
                                AppHelpers.getTranslation(TrKeys.product))),
                        Tab(
                            child:
                                Text(AppHelpers.getTranslation(TrKeys.stocks))),
                        Tab(
                            child:
                                Text(AppHelpers.getTranslation(TrKeys.wholeSale))),
                        Tab(
                            child: Text(
                                AppHelpers.getTranslation(TrKeys.gallery))),
                      ],
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  EditFoodDetailsBody(
                    onNext: () => _tabController.animateTo(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    ),
                  ),
                  EditProductStocksBody(
                    onNext: () => _tabController.animateTo(
                      2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    ),
                  ),
                  EditWholeSaleStocksBody(
                    onNext: () => _tabController.animateTo(
                      3,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    ),
                  ),
                  const EditProductGalleryBody(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
