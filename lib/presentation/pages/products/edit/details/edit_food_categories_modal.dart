import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EditFoodCategoriesModal extends StatelessWidget {
  final List<CategoryData> categories;

  const EditFoodCategoriesModal({super.key, required this.categories})
      ;

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const ModalDrag(),
              TitleAndIcon(
                title: AppHelpers.getTranslation(TrKeys.categories),
                titleSize: 16,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final notifier =
                      ref.read(editFoodCategoriesProvider.notifier);
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return FoodCategoryItem(
                        category: categories[index],
                        onSelect: notifier.setSelectCategory,
                        onChange: notifier.setActiveIndex,
                      );
                    },
                  );
                },
              ),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
