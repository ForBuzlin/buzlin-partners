import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/component/components.dart';

import '../../masters/service_masters/widgets/service_list_item.dart';

class ServiceMultiSelection extends ConsumerStatefulWidget {
  final bool isEdit;

  const ServiceMultiSelection({super.key, this.isEdit = false});

  @override
  ConsumerState<ServiceMultiSelection> createState() =>
      _ServiceMultiSelectionState();
}

class _ServiceMultiSelectionState extends ConsumerState<ServiceMultiSelection> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (ref.watch(serviceProvider).services.isEmpty) {
          ref
              .read(serviceProvider.notifier)
              .fetchServices(context: context, isRefresh: true);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(serviceProvider);
    final notifier = ref.read(serviceProvider.notifier);
    final addNotifier = ref.read(addMembershipProvider.notifier);
    final editNotifier = ref.read(editMembershipProvider.notifier);
    final addState = ref.watch(addMembershipProvider);
    final editState = ref.watch(editMembershipProvider);
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const ModalDrag(),
            Expanded(
              child: state.isLoading
                  ? const Loading()
                  : SmartRefresher(
                      controller: _refreshController,
                      enablePullUp: true,
                      onRefresh: () => notifier.fetchServices(
                        context: context,
                        controller: _refreshController,
                        isRefresh: true,
                      ),
                      onLoading: () => notifier.fetchServices(
                        context: context,
                        controller: _refreshController,
                      ),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.services.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ServiceListItem(
                            service: state.services[index],
                            isSelected: widget.isEdit
                                ? editState.services.any((element) =>
                                    element.id == state.services[index].id)
                                : addState.services.any((element) =>
                                    element.id == state.services[index].id),
                            onTap: () {
                              widget.isEdit
                                  ? editNotifier
                                      .setServices(state.services[index])
                                  : addNotifier
                                      .setServices(state.services[index]);
                            },
                          );
                        },
                      ),
                    ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    height: 54,
                    title: AppHelpers.getTranslation(TrKeys.save),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
