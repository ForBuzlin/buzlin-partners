import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';
import 'shop_category_item.dart';

class EditShopCategoryModal extends ConsumerStatefulWidget {
  const EditShopCategoryModal({super.key}) ;

  @override
  ConsumerState<EditShopCategoryModal> createState() =>
      _EditShopCategoryModalState();
}

class _EditShopCategoryModalState extends ConsumerState<EditShopCategoryModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(editShopCategoryProvider.notifier).fetchCategory(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalDrag(),
            TitleAndIcon(
              title: AppHelpers.getTranslation(TrKeys.shopCategory),
              titleSize: 16,
            ),
            24.verticalSpace,
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(editShopCategoryProvider);
                final event = ref.read(editShopCategoryProvider.notifier);
                final editShopEvent = ref.read(shopProvider.notifier);
                return state.isLoading
                    ? const Loading()
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: state.shopCategories.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return EditShopCategoryItem(
                            shopCategoryData: state.shopCategories[index],
                            onTap: () {
                              event.setActiveIndex(index);

                              editShopEvent.setCategoryId(
                                  state.shopCategories[index].id ?? 0);
                            },
                            isSelected: state.activeIndex == index,
                          );
                        });
              },
            ),
            24.verticalSpace,
            CustomButton(
              title: AppHelpers.getTranslation(TrKeys.close),
              onPressed: () => Navigator.pop(context),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
