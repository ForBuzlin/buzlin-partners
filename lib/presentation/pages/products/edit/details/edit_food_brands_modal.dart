import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EditFoodBrandsModal extends ConsumerStatefulWidget {
  const EditFoodBrandsModal({super.key});

  @override
  ConsumerState<EditFoodBrandsModal> createState() =>
      _FoodCategoriesModalState();
}

class _FoodCategoriesModalState extends ConsumerState<EditFoodBrandsModal> {
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(editFoodBrandProvider.notifier)
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
    final notifier = ref.read(editFoodBrandProvider.notifier);
    final state = ref.watch(editFoodBrandProvider);
    return ModalWrap(
      body: Column(
        children: [
          const ModalDrag(),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: TitleAndIcon(
              title: AppHelpers.getTranslation(TrKeys.brandes),
              titleSize: 16,
            ),
          ),
          8.verticalSpace,
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
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: state.brands.length,
                      itemBuilder: (context, index) => FoodBrandItem(
                        brand: state.brands[index],
                        onTap: () {
                          notifier.setFoodBrand(state.brands[index]);
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
