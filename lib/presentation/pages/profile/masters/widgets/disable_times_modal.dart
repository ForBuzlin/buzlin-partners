import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/pages/profile/masters/widgets/add_disable_times_modal.dart';
import 'package:venderuzmart/presentation/pages/profile/masters/widgets/edit_disable_times_modal.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'disable_time_item.dart';

class DisableTimesModal extends ConsumerStatefulWidget {
  const DisableTimesModal({super.key});

  @override
  ConsumerState<DisableTimesModal> createState() => _DisableTimesModalState();
}

class _DisableTimesModalState extends ConsumerState<DisableTimesModal> {
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(masterWorkingDaysProvider.notifier)
          .getDisableTimes(context, isRefresh: true);
    });

    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(masterWorkingDaysProvider);
    final notifier = ref.read(masterWorkingDaysProvider.notifier);
    return ModalWrap(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ModalDrag(),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.disableTimes),
                    style: Style.interNormal(size: 16, color: Style.black),
                  ),
                ),
                SecondButton(
                  title: TrKeys.add,
                  onTap: () {
                    AppHelpers.showCustomModalBottomDragSheet(
                      paddingTop: 50,
                      initSize: 0.8,
                      context: context,
                      modal: (controller) => AddDisableTimesModal(
                        scrollController: controller,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          if (!state.isDisableLoading)
            Expanded(
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: () {
                  notifier.getDisableTimes(
                    context,
                    isRefresh: true,
                    refreshController: _refreshController,
                  );
                },
                onLoading: () {
                  notifier.getDisableTimes(
                    context,
                    refreshController: _refreshController,
                  );
                },
                child: state.disableTimes.isEmpty
                    ? const NoItem()
                    : ListView.builder(
                        shrinkWrap: true,
                        padding: REdgeInsets.symmetric(vertical: 12),
                        itemCount: state.disableTimes.length,
                        itemBuilder: (context, index) {
                          return DisableTimeItem(
                            disableTime: state.disableTimes[index],
                            onDelete: () {
                              notifier.deleteDisableTime(
                                context,
                                state.disableTimes[index].id,
                              );
                            },
                            onTap: () {
                              if (state.masterStatus == TrKeys.approved) {
                                AppHelpers.showCustomModalBottomDragSheet(
                                  paddingTop: 50,
                                  initSize: 0.8,
                                  context: context,
                                  modal: (controller) => EditDisableTimesModal(
                                    disableTime: state.disableTimes[index],
                                    scrollController: controller,
                                  ),
                                );
                              }
                            },
                          );
                        }),
              ),
            ),
          if (state.isDisableLoading) const Expanded(child: Loading()),
          24.verticalSpace,
        ],
      ),
    );
  }
}
