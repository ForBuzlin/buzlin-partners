import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/presentation/pages/profile/brands/widgets/brand_item.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';

@RoutePage()
class BrandsPage extends ConsumerStatefulWidget {
  const BrandsPage({super.key}) ;

  @override
  ConsumerState<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends ConsumerState<BrandsPage> {
  late RefreshController brandController;

  @override
  void initState() {
    brandController = RefreshController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(brandProvider.notifier)
          .fetchBrands(context: context, isRefresh: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            CommonAppBar(
                height: 72,
                bottomPadding: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const PopButton(),
                    Text(
                      AppHelpers.getTranslation(TrKeys.brands),
                      style: Style.interNormal(size: 16),
                    ),
                    const Spacer(),
                    SecondButton(
                      title: TrKeys.add,
                      onTap: () {
                        brandController.resetNoData();
                        context.pushRoute(const AddBrandRoute());
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
              child: Consumer(
                builder: (context, ref, child) {
                  final brandState = ref.watch(brandProvider);
                  final brandEvent = ref.read(brandProvider.notifier);
                  return brandState.isLoading
                      ? const LoadingList(
                          verticalPadding: 16,
                          itemBorderRadius: 12,
                          horizontalPadding: 12,
                          itemPadding: 10,
                          itemHeight: 80,
                        )
                      : SmartRefresher(
                          controller: brandController,
                          enablePullDown: true,
                          enablePullUp: true,
                          onRefresh: () => brandEvent.fetchBrands(
                              controller: brandController, isRefresh: true),
                          onLoading: () => brandEvent.fetchBrands(
                              controller: brandController),
                          child: brandState.brands.isEmpty
                              ? const NoItem(title: TrKeys.noBrands)
                              : AnimationLimiter(
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: REdgeInsets.only(
                                        top: 16,
                                        bottom: 56.r,
                                        left: 12,
                                        right: 12),
                                    shrinkWrap: true,
                                    itemCount: brandState.brands.length,
                                    itemBuilder: (context, index) =>
                                        AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration: AppConstants.animationDuration,
                                      child: ScaleAnimation(
                                        scale: 0.5,
                                        child: FadeInAnimation(
                                          child: BrandItem(
                                            brand: brandState.brands[index],
                                            spacing: 10,
                                            onTap: () {
                                              brandController.resetNoData();
                                              ref
                                                  .read(editBrandsProvider
                                                      .notifier)
                                                  .setBrandDetails(
                                                      brandState.brands[index],
                                                      (fullBrand) {});
                                              context.pushRoute(EditBrandRoute(
                                                  onSave: () {}));
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
