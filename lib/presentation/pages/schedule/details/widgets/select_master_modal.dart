import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class SelectMasterModal extends ConsumerStatefulWidget {
  const SelectMasterModal({super.key});

  @override
  ConsumerState<SelectMasterModal> createState() => _SelectMasterModalState();
}

class _SelectMasterModalState extends ConsumerState<SelectMasterModal> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(acceptedMastersProvider.notifier).fetchMembers(
            context: context,
            refreshController: _refreshController,
            isRefresh: true,
          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(acceptedMastersProvider);
    final detailState = ref.watch(bookingDetailsProvider);
    final notifier = ref.read(acceptedMastersProvider.notifier);
    final detailNotifier = ref.read(bookingDetailsProvider.notifier);
    return Container(
      margin: MediaQuery.viewInsetsOf(context),
      child: ModalWrap(
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const ModalDrag(),
              6.verticalSpace,
              Expanded(
                child: Stack(
                  children: [
                    state.isLoading
                        ? const Loading(size: 30)
                        : SmartRefresher(
                            controller: _refreshController,
                            enablePullUp: true,
                            onRefresh: () => notifier.fetchMembers(
                              refreshController: _refreshController,
                              context: context,
                              isRefresh: true,
                            ),
                            onLoading: () => notifier.fetchMembers(
                              refreshController: _refreshController,
                              context: context,
                            ),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.users.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => UserItem(
                                user: state.users[index],
                                isSelected: index == detailState.selectedIndex,
                                onTap: () {
                                  detailNotifier.setMasterIndex(index);
                                },
                              ),
                            ),
                          ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        isLoading: detailState.isUpdating,
                        title: TrKeys.save,
                        onPressed: () {
                          detailNotifier.updateBooking(
                            context,
                            selectedMaster: state.users[detailState.selectedIndex],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
