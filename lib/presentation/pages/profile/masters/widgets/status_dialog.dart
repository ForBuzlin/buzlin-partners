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
    final state = ref.watch(mastersProvider);
    final notifier = ref.read(mastersProvider.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < AppHelpers.getMasterStatuses(status).length; i++)
          Padding(
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
                  Text(AppHelpers.getTranslation(
                      AppHelpers.getMasterStatuses(status)[i])),
                ],
              ),
            ),
          ),
        16.verticalSpace,
        CustomButton(
            height: 44,
            title: TrKeys.save,
            isLoading: state.isUpdate,
            onPressed: () {
              if (state.statusIndex == -1) {
                return;
              }
              notifier.updateMasterStatus(
                  id: id,
                  status:
                      AppHelpers.getMasterStatuses(status)[state.statusIndex],
                  onSuccess: (index) {
                    _fetch(ref, state.index,context);
                    _fetch(ref, index,context);
                    Navigator.pop(context);
                  });
            }),
      ],
    );
  }

  _fetch(ref, int index,context) {
    if (index == 0) {
      ref.read(newMastersProvider.notifier).fetchMembers(isRefresh: true,);
    } else if (index == 1) {
      ref
          .read(acceptedMastersProvider.notifier)
          .fetchMembers(isRefresh: true, context: context);
    } else if (index == 2) {
      ref.read(cancelledMastersProvider.notifier).fetchMembers(isRefresh: true);
    } else if (index == 3) {
      ref.read(rejectedMastersProvider.notifier).fetchMembers(isRefresh: true);
    }
  }
}
