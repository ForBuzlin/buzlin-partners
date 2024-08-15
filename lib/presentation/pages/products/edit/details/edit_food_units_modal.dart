import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EditFoodUnitsModal extends ConsumerStatefulWidget {
  const EditFoodUnitsModal({super.key}) ;

  @override
  ConsumerState<EditFoodUnitsModal> createState() => _EditFoodUnitsModalState();
}

class _EditFoodUnitsModalState extends ConsumerState<EditFoodUnitsModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(editFoodUnitsProvider.notifier).fetchUnits(),
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
              title: AppHelpers.getTranslation(TrKeys.units),
              titleSize: 16,
            ),
            24.verticalSpace,
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(editFoodUnitsProvider);
                final event = ref.read(editFoodUnitsProvider.notifier);
                return state.isLoading
                    ? const Loading()
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: state.units.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => FoodUnitItem(
                          unit: state.units[index],
                          onTap: () => event.setActiveIndex(index),
                          isSelected: state.activeIndex == index,
                        ),
                      );
              },
            ),
            24.verticalSpace,
            CustomButton(
              title: TrKeys.close,
              onPressed: () => Navigator.pop(context),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
