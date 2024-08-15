import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'add_brand_modal.dart';

class FoodBrandsModal extends ConsumerStatefulWidget {
  const FoodBrandsModal({super.key}) ;

  @override
  ConsumerState<FoodBrandsModal> createState() => _FoodCategoriesModalState();
}

class _FoodCategoriesModalState extends ConsumerState<FoodBrandsModal> {
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(createFoodBrandProvider.notifier)
          .setBrands(ref.watch(foodBrandProvider).brands),
    );
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(createFoodBrandProvider.notifier);
    final state = ref.watch(createFoodBrandProvider);
    return ModalWrap(
      body: Column(
        children: [
          const ModalDrag(),
          GestureDetector(
            onTap: () => AppHelpers.showCustomModalBottomSheet(
              context: context,
              modal: const AddBrandModal(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Remix.play_list_add_line,
                  color: Style.primary,
                  size: 18.r,
                ),
                10.horizontalSpace,
                Text(
                  AppHelpers.getTranslation(TrKeys.addNewBrand),
                  style: Style.interSemi(
                    size: 14,
                    color: Style.primary,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),
          16.verticalSpace,
          Divider(color: Style.toggleColor, height: 1.r, thickness: 1.r),
          24.verticalSpace,
          Expanded(
            child: SmartRefresher(
              enablePullDown: false,
              enablePullUp: true,
              controller: refreshController,
              onLoading: () {
                ref.read(foodBrandProvider.notifier).fetchBrands(
                    context: context,
                    controller: refreshController,
                    onSuccess: () {
                      notifier.setBrands(ref.watch(foodBrandProvider).brands);
                    });
              },
              child: SingleChildScrollView(
                padding: REdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    TitleAndIcon(
                      title: AppHelpers.getTranslation(TrKeys.brands),
                      titleSize: 16,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: state.brands.length,
                      itemBuilder: (context, index) => FoodBrandItem(
                        brand: state.brands[index],
                        onTap: () {
                          notifier.setActiveIndex(index);
                          Navigator.pop(context);
                        },
                        isSelected: state.activeIndex == index,
                      ),
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
