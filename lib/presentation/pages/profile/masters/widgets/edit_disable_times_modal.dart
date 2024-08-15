import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';

class EditDisableTimesModal extends ConsumerStatefulWidget {
  final DisableTimes? disableTime;
  final ScrollController? scrollController;

  const EditDisableTimesModal({
    super.key,
    required this.disableTime,
    this.scrollController,
  });

  @override
  ConsumerState<EditDisableTimesModal> createState() =>
      _EditDisableTimesModalState();
}

class _EditDisableTimesModalState extends ConsumerState<EditDisableTimesModal> {
  late TextEditingController title;
  late TextEditingController desc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    title = TextEditingController(
        text: widget.disableTime?.translation?.title ?? '');
    desc = TextEditingController(
        text: widget.disableTime?.translation?.description ?? '');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(masterDisableTimesProvider.notifier)
          .fetchDisableTimeDetails(context, disableTime: widget.disableTime);
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
                child: state.isLoading
                    ? const Loading()
                    : SingleChildScrollView(
                        controller: widget.scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppHelpers.getTranslation(TrKeys.editDisableTime),
                              style: Style.interNormal(
                                  size: 16, color: Style.black),
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
                              initialDate: state.disableTime?.date,
                              mode: CupertinoDatePickerMode.date,
                              minDate: (state.disableTime?.date
                                          ?.isBefore(DateTime.now()) ??
                                      false)
                                  ? state.disableTime?.date
                                  : DateTime.now(),
                              validation: AppValidators.emptyCheck,
                            ),
                            12.verticalSpace,
                            Row(
                              children: [
                                Expanded(
                                  child: CustomDateTimeField(
                                    label: TrKeys.from,
                                    initialDate: state.disableTime?.date
                                        ?.toTime(state.disableTime?.from),
                                    onTimeChange: notifier.setTimeFrom,
                                    validation: AppValidators.emptyCheck,
                                  ),
                                ),
                                12.horizontalSpace,
                                Expanded(
                                  child: CustomDateTimeField(
                                    label: TrKeys.to,
                                    initialDate: state.disableTime?.date
                                        ?.toTime(state.disableTime?.to),
                                    onTimeChange: notifier.setTimeTo,
                                    validation: AppValidators.emptyCheck,
                                    minDate:
                                        state.disableTime?.from?.toTime() ??
                                            DateTime.now().addMinute(5),
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
                                        initialText: (widget
                                                    .disableTime
                                                    ?.customRepeatValue
                                                    ?.isNotEmpty ??
                                                false)
                                            ? widget
                                                    .disableTime
                                                    ?.customRepeatValue
                                                    ?.first ??
                                                ''
                                            : '',
                                        onChanged:
                                            notifier.setCustomRepeatValue,
                                        validation: AppValidators.emptyCheck,
                                      ),
                                    ),
                                    12.horizontalSpace,
                                    Expanded(
                                      child: CustomDropDown(
                                        label: TrKeys.type,
                                        value:
                                            state.disableTime?.customRepeatType,
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
                                  initialText: state.disableTime?.endValue,
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
                                  initialDate: DateTime.tryParse(
                                    state.disableTime?.endValue ?? '',
                                  ),
                                  mode: CupertinoDatePickerMode.date,
                                  minDate: state.disableTime?.endValue == null
                                      ? DateTime.now()
                                      : state.disableTime?.date ??
                                          DateTime.now(),
                                  validation: AppValidators.emptyCheck,
                                ),
                              ),
                            24.verticalSpace,
                            CustomButton(
                              title: TrKeys.save,
                              isLoading: state.isUpdate,
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  notifier.updateDisableTimes(
                                    updateSuccess: () {
                                      ref
                                          .read(masterWorkingDaysProvider
                                              .notifier)
                                          .getDisableTimes(context,
                                              isRefresh: true);
                                      Navigator.pop(context);
                                    },
                                    title: title.text,
                                    desc: desc.text,
                                  );
                                }
                              },
                            ),
                            MediaQuery.viewInsetsOf(context)
                                .bottom
                                .verticalSpace,
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
