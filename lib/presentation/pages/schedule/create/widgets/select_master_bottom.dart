import 'package:venderuzmart/infrastructure/models/data/user_data.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';

class SelectMasterBottomSheet extends ConsumerStatefulWidget {
  final String? title;
  final int? serviceId;
  final int? masterId;
  final ValueChanged<UserData>? onSelect;
  final ScrollController controller;

  const SelectMasterBottomSheet({
    super.key,
    required this.controller,
    required this.title,
    this.serviceId,
    this.masterId,
    this.onSelect,
  });

  @override
  ConsumerState<SelectMasterBottomSheet> createState() =>
      _SelectMasterBottomSheetState();
}

class _SelectMasterBottomSheetState
    extends ConsumerState<SelectMasterBottomSheet> {
  late RefreshController controller;

  @override
  void initState() {
    controller = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(acceptedMastersProvider.notifier).fetchMembers(
            context: context,
            serviceId: widget.serviceId,
            isRefresh: true,
          );
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(acceptedMastersProvider);
    final notifier = ref.read(acceptedMastersProvider.notifier);
    return KeyboardDismisser(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 400,
        decoration: BoxDecoration(
          color: Style.greyColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        padding: EdgeInsets.only(
          left: 16.r,
          right: 16.r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.verticalSpace,
            Container(
              height: 4.r,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width / 2 - 48.r),
              decoration: BoxDecoration(
                  color: Style.icon,
                  borderRadius: BorderRadius.circular(100.r)),
            ),
            16.verticalSpace,
            Text(
              widget.title ?? "",
              style: Style.interNormal(size: 22),
            ),
            state.isLoading
                ? Padding(
                    padding: EdgeInsets.only(top: 32.r),
                    child: const Loading(),
                  )
                : Expanded(
                    child: SmartRefresher(
                      controller: controller,
                      scrollController: widget.controller,
                      enablePullUp: true,
                      enablePullDown: false,
                      onRefresh: () {
                        notifier.fetchMembers(
                          context: context,
                          refreshController: controller,
                          isRefresh: true,
                          serviceId: widget.serviceId,
                        );
                      },
                      onLoading: () {
                        notifier.fetchMembers(
                          context: context,
                          refreshController: controller,
                          serviceId: widget.serviceId,
                        );
                      },
                      child: GridView.builder(
                        shrinkWrap: true,
                        controller: widget.controller,
                        padding: EdgeInsets.only(top: 24.r),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 264.r,
                          mainAxisSpacing: 8.r,
                          crossAxisSpacing: 8.r,
                        ),
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          return MasterItem(
                            selectService: true,
                            onTap: () {
                              if (widget.onSelect == null) {
                                ref
                                    .read(createBookingProvider.notifier)
                                    .selectMaster(
                                        serviceId: widget.serviceId,
                                        master: state.users[index]);
                                Navigator.pop(context);
                              } else {
                                Navigator.pop(context);
                                if (widget.masterId != state.users[index].id) {
                                  widget.onSelect?.call(state.users[index]);
                                }
                              }
                            },
                            height: 140,
                            master: state.users[index],
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
