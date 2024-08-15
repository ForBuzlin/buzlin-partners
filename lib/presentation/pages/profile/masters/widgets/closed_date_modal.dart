import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/masters/working_days/working_days_provider.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

import 'package:venderuzmart/application/providers.dart';

class ClosedDateModal extends ConsumerStatefulWidget {
  const ClosedDateModal({super.key});

  @override
  ConsumerState<ClosedDateModal> createState() => _ClosedDateModalState();
}

class _ClosedDateModalState extends ConsumerState<ClosedDateModal> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(masterWorkingDaysProvider.notifier)
          .getClosedDays(DateTime.now());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(masterWorkingDaysProvider);
    final notifier = ref.read(masterWorkingDaysProvider.notifier);
    return ModalWrap(
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ModalDrag(),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: const TitleAndIcon(title: TrKeys.closedDays),
              ),
              CustomDatePicker(
                isMulti: true,
                range: state.closedDays.map((e) => e.date).toList(),
                onDisplayedMonthChanged: notifier.getClosedDays,
                onValueChanged: notifier.setClosedDays,
              ),
              if (state.masterStatus == TrKeys.approved || AppHelpers.getUserRole==TrKeys.master)
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: CustomButton(
                    title: TrKeys.save,
                    isLoading: state.isUpdating,
                    onPressed: () {
                      notifier.updateClosedDays(updateSuccess: () {
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
              24.verticalSpace,
            ],
          ),
          if (state.isCloseDayLoading)
            SizedBox(height: 340.r, child: const CustomLoading())
        ],
      ),
    );
  }
}
