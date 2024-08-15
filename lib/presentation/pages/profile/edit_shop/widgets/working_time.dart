import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class WorkingTime extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const WorkingTime({super.key, required this.onNext});

  @override
  ConsumerState<WorkingTime> createState() => _WorkingTimeState();
}

class _WorkingTimeState extends ConsumerState<WorkingTime> {
  List<WorkingDay> _workingDays = [];
  List temp = [];
  List<WorkingDay> _savingWorkingDays = [];
  bool _shouldUpdate = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _workingDays = ref.read(shopProvider).shop?.shopWorkingDays ?? [];
          if (_workingDays.isNotEmpty) {
            for (int i = 0; i < _workingDays.length; i++) {
              temp.add(_workingDays[i].day);
            }
            for (int i = 0; i < WeekDays.values.length; i++) {
              if (temp.contains(WeekDays.values[i].name)) {
                continue;
              } else {
                _workingDays.add(WorkingDay(
                  id: i,
                  day: WeekDays.values[i].name,
                  from: "00:00",
                  to: "00:00",
                  disabled: false,
                ));
              }
            }
          } else {
            for (int i = 0; i < WeekDays.values.length; i++) {
              _workingDays.add(WorkingDay(
                id: i,
                day: WeekDays.values[i].name,
                from: "00:00",
                to: "00:00",
                disabled: false,
              ));
            }
          }
        _savingWorkingDays = _workingDays;
        ref
            .read(workingDaysProvider.notifier)
            .setShopWorkingDays(_workingDays);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(workingDaysProvider);
          final shopState = ref.watch(shopProvider);
          final event = ref.read(workingDaysProvider.notifier);
          final shopEvent = ref.read(shopProvider.notifier);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              24.verticalSpace,
              Text(
                AppHelpers.getTranslation(TrKeys.enterOpeningHours),
                style: Style.interNormal(
                  size: 14,
                  color: Style.black,
                ),
              ),
              24.verticalSpace,
              SizedBox(
                height: 40.r,
                width: MediaQuery.sizeOf(context).width - 32.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_workingDays.isNotEmpty)
                      ..._workingDays.map(
                        (WorkingDay day) => ButtonEffectAnimation(
                          onTap: () {
                            event.changeIndex(day);
                            _savingWorkingDays = _workingDays;
                          },
                          child: SmallWeekdayItem(
                            isSelected:
                                state.currentIndex == _workingDays.indexOf(day),
                            day: day,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              30.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppHelpers.getTranslation(TrKeys.setBusinessDay),
                    style: Style.interNormal(
                      size: 16,
                      letterSpacing: -0.3,
                    ),
                  ),
                  CustomToggle(
                    key: UniqueKey(),
                    controller: ValueNotifier<bool>(
                      _savingWorkingDays.isNotEmpty
                          ? !(_savingWorkingDays[state.currentIndex].disabled ??
                              false)
                          : false,
                    ),
                    onChange: (value) {
                      _setDisabledDay(
                        currentIndex: state.currentIndex,
                        disabled: value,
                      );
                    },
                  ),
                ],
              ),
              40.verticalSpace,
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 160.h,
                      child: CupertinoDatePicker(
                        key: UniqueKey(),
                        mode: CupertinoDatePickerMode.time,
                        initialDateTime: DateTime.now().copyWith(
                          hour: _savingWorkingDays.isNotEmpty ? int.parse(_savingWorkingDays[state.currentIndex].from?.substring(0, 2) ?? '') : 0,
                          minute: _savingWorkingDays.isNotEmpty ? int.parse(_savingWorkingDays[state.currentIndex].from?.substring(3, 5) ?? '') : 0,
                        ),
                        onDateTimeChanged: (DateTime newDateTime) {
                          _setTimeToDay(
                            time: TimeOfDay.fromDateTime(newDateTime),
                            currentIndex: state.currentIndex,
                          );
                        },
                        use24hFormat: true,
                        minuteInterval: 1,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 160.h,
                      child: CupertinoDatePicker(
                        key: UniqueKey(),
                        mode: CupertinoDatePickerMode.time,
                        use24hFormat: true,
                        minuteInterval: 1,
                        initialDateTime: DateTime.now().copyWith(
                          hour: _savingWorkingDays.isNotEmpty ? int.parse(_savingWorkingDays[state.currentIndex].to?.substring(0, 2) ?? '') : 0,
                          minute: _savingWorkingDays.isNotEmpty ? int.parse(_savingWorkingDays[state.currentIndex].to?.substring(3, 5) ?? '') : 0,
                        ),
                        onDateTimeChanged: (DateTime newDateTime) {
                          _setTimeToDay(
                            time: TimeOfDay.fromDateTime(newDateTime),
                            isFrom: false,
                            currentIndex: state.currentIndex,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                title: AppHelpers.getTranslation(TrKeys.save),
                isLoading: state.isLoading,
                onPressed: () {
                  _savingWorkingDays = _workingDays;
                  if (_shouldUpdate) {
                    event.updateWorkingDays(
                      days: _savingWorkingDays,
                      shopUuid: shopState.shop?.uuid,
                      updateSuccess: () {
                        shopEvent.updateWorkingDays(_savingWorkingDays);
                        widget.onNext.call();
                      },
                    );
                  } else {
                    widget.onNext.call();
                  }
                },
              ),
              30.verticalSpace,
            ],
          );
        },
      ),
    );
  }

  void _setDisabledDay({
    bool? disabled,
    required int currentIndex,
  }) {
    _shouldUpdate = true;
    _workingDays[currentIndex] =
        _workingDays[currentIndex].copyWith(disabled: !(disabled ?? false));
  }

  void _setTimeToDay({
    required TimeOfDay time,
    bool isFrom = true,
    required int currentIndex,
  }) {
    _shouldUpdate = true;
    if (isFrom) {
      _workingDays[currentIndex] = _workingDays[currentIndex].copyWith(
        from:
            '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
      );
    } else {
      _workingDays[currentIndex] = _workingDays[currentIndex].copyWith(
        to: '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
      );
    }
  }
}
