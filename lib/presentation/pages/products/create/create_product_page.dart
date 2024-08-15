import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'details/create_food_details_body.dart';
import 'gallery/create_product_gallery_body.dart';
import 'stocks/create_food_stocks_body.dart';
import 'stocks/whole_sale_stocks_body.dart';

@RoutePage()
class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage>
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
        appBar: AppBar(
          foregroundColor: Style.black,
          backgroundColor: Style.white,
          elevation: 0.5,
          centerTitle: false,
          leading: const PopButton(),
          titleTextStyle: Style.interNormal(size: 16),
          title: Text(AppHelpers.getTranslation(TrKeys.addProduct)),
          actions: _tabController.index == -1
              ? [
                  24.horizontalSpace,
                  Center(
                    child: SecondButton(
                      title: TrKeys.addNewExtras,
                      onTap: () {},
                    ),
                  ),
                  24.horizontalSpace,
                ]
              : [],
          bottom: TabBar(
            isScrollable: true,
            onTap: (index) {
              if (_tabController.indexIsChanging) {
                _tabController.index = _tabController.previousIndex;
              } else {
                return;
              }
            },
            splashBorderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
            padding: REdgeInsets.symmetric(horizontal: 16),
            controller: _tabController,
            indicatorPadding: REdgeInsets.symmetric(horizontal: 12),
            indicatorColor: Style.primary,
            labelColor: Style.primary,
            unselectedLabelColor: Style.textColor,
            unselectedLabelStyle: Style.interRegular(size: 14),
            labelStyle: Style.interSemi(size: 15),
            tabs: [
              Tab(child: Text(AppHelpers.getTranslation(TrKeys.product))),
              Tab(child: Text(AppHelpers.getTranslation(TrKeys.stocks))),
              Tab(child: Text(AppHelpers.getTranslation(TrKeys.wholeSale))),
              Tab(child: Text(AppHelpers.getTranslation(TrKeys.gallery))),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            CreateFoodDetailsBody(onNext: () => _tabController.animateTo(1)),
            CreateFoodStocksBody(onNext: () => _tabController.animateTo(2)),
            CreateWholeSaleStocksBody(onNext: () => _tabController.animateTo(3)),
            const CreateProductGalleryBody(),
          ],
        ),
      ),
    );
  }
}
