import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';

class AddDisableTimesModal extends ConsumerStatefulWidget {
  final ScrollController? scrollController;

  const AddDisableTimesModal({super.key, this.scrollController});

  @override
  ConsumerState<AddDisableTimesModal> createState() =>
      _AddDisableTimesModalState();
}

class _AddDisableTimesModalState extends ConsumerState<AddDisableTimesModal> {
  late TextEditingController title;
  late TextEditingController desc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    title = TextEditingController();
    desc = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(masterDisableTimesProvider.notifier).clearAll();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(masterDisableTimesProvider);
    final notifier = ref.read(masterDisableTimesProvider.notifier);
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const ModalDrag(),
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  controller: widget.scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppHelpers.getTranslation(TrKeys.addDisableTime),
                        style: Style.interNormal(size: 16, color: Style.black),
                      ),
                      12.verticalSpace,
                      CustomTextFormField(
                        controller: title,
                        label: TrKeys.title,
                        validation: AppValidators.emptyCheck,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                      12.verticalSpace,
                      CustomTextFormField(
                        controller: desc,
                        label: TrKeys.description,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                      12.verticalSpace,
                      CustomDateTimeField(
                        onDateChange: notifier.setDateTime,
                        label: TrKeys.date,
                        mode: CupertinoDatePickerMode.date,
                        minDate: DateTime.now(),
                        validation: AppValidators.emptyCheck,
                      ),
                      12.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: CustomDateTimeField(
                              label: TrKeys.from,
                              onTimeChange: notifier.setTimeFrom,
                              validation: AppValidators.emptyCheck,
                              // minDate: DateTime.now(),
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: CustomDateTimeField(
                              label: TrKeys.to,
                              onTimeChange: notifier.setTimeTo,
                              validation: AppValidators.emptyCheck,
                              // minDate: state.disableTime?.from?.toTime() ??
                              //     DateTime.now().addMinute(5),
                            ),
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      CustomDropDown(
                        label: TrKeys.repeats,
                        value: state.disableTime?.repeats,
                        list: DropDownValues.repeatsList,
                        onChanged: notifier.setRepeats,
                      ),
                      if (state.disableTime?.repeats == 'custom')
                        Padding(
                          padding: REdgeInsets.only(top: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  label: TrKeys.value,
                                  onChanged: notifier.setCustomRepeatValue,
                                  validation: AppValidators.emptyCheck,
                                ),
                              ),
                              12.horizontalSpace,
                              Expanded(
                                child: CustomDropDown(
                                  label: TrKeys.type,
                                  value: state.disableTime?.customRepeatType,
                                  list: DropDownValues.customRepeatType,
                                  onChanged: notifier.setCustomRepeatType,
                                ),
                              ),
                            ],
                          ),
                        ),
                      12.verticalSpace,
                      CustomDropDown(
                        label: TrKeys.endType,
                        value: state.disableTime?.endType,
                        list: DropDownValues.endTypeList,
                        onChanged: notifier.setEndType,
                      ),
                      if (state.disableTime?.endType == 'after')
                        Padding(
                          padding: REdgeInsets.only(top: 12),
                          child: CustomTextFormField(
                            label: TrKeys.value,
                            validation: AppValidators.emptyCheck,
                            onChanged: notifier.setEndValue,
                          ),
                        ),
                      if (state.disableTime?.endType == 'date')
                        Padding(
                          padding: REdgeInsets.only(top: 12),
                          child: CustomDateTimeField(
                            onDateChange: notifier.setEndDate,
                            label: TrKeys.endDate,
                            mode: CupertinoDatePickerMode.date,
                            minDate: state.disableTime?.date ?? DateTime.now(),
                            validation: AppValidators.emptyCheck,
                          ),
                        ),
                      24.verticalSpace,
                      CustomButton(
                        title: TrKeys.save,
                        isLoading: state.isUpdate,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            notifier.addDisableTimes(
                              createdSuccess: () {
                                ref
                                    .read(masterWorkingDaysProvider.notifier)
                                    .getDisableTimes(context, isRefresh: true);
                                Navigator.pop(context);
                              },
                              title: title.text,
                              desc: desc.text,
                            );
                          }
                        },
                      ),
                      MediaQuery.viewInsetsOf(context).bottom.verticalSpace,
                      24.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
