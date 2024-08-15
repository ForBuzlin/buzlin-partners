import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class StatusDialog extends ConsumerWidget {
  final String status;
  final int? id;

  const StatusDialog({super.key, required this.status, this.id});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(deliverymenProvider);
    final notifier = ref.read(deliverymenProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...AppHelpers.getMasterStatuses(status).mapIndexed((e, i) => Padding(
              padding: REdgeInsets.only(bottom: 8),
              child: ButtonEffectAnimation(
                onTap: () => notifier.setStatusIndex(i),
                child: Row(
                  children: [
                    CustomCheckbox(
                      isActive: i == state.statusIndex,
                      onTap: () => notifier.setStatusIndex(i),
                    ),
                    6.horizontalSpace,
                    Text(AppHelpers.getTranslation(e)),
                  ],
                ),
              ),
            )),
        16.verticalSpace,
        CustomButton(
            height: 44,
            title: TrKeys.save,
            isLoading: state.isUpdate,
            onPressed: () {
              if (state.statusIndex == -1) {
                return;
              }
              notifier.updateStatus(
                  id: id,
                  status:
                      AppHelpers.getMasterStatuses(status)[state.statusIndex],
                  onSuccess: (index) {
                    ref.read(deliverymenProvider.notifier).fetchDeliverymen(
                          isRefresh: true,
                        );
                    Navigator.pop(context);
                  });
            }),
      ],
    );
  }
}
