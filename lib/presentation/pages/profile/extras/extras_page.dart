import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'create/create_extras_group_modal.dart';
import 'widgets/main_group_item.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'details/extras_group_details_modal.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

@RoutePage()
class ExtrasPage extends ConsumerStatefulWidget {
  const ExtrasPage({super.key}) ;

  @override
  ConsumerState<ExtrasPage> createState() => _ExtrasBodyState();
}

class _ExtrasBodyState extends ConsumerState<ExtrasPage> {
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(extrasProvider.notifier).fetchGroups(),
    );
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(extrasProvider);
          final notifier = ref.read(extrasProvider.notifier);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(
                  bottomPadding: 12,
                  height: 102,
                  child: Row(
                    children: [
                      const PopButton(),
                      Text(
                        AppHelpers.getTranslation(TrKeys.extras),
                        style: Style.interNormal(size: 16),
                      ),
                      const Spacer(),
                      SecondButton(
                        title: TrKeys.addExtrasGroup,
                        onTap: () {
                          AppHelpers.showCustomModalBottomSheet(
                              context: context,
                              modal: const CreateExtrasGroupModal());
                        },
                        prefix: Icon(
                          Remix.add_line,
                          size: 20.r,
                          color: Style.white,
                        ),
                      ),
                    ],
                  )),
              Expanded(
                child: SmartRefresher(
                  controller: refreshController,
                  onRefresh: () => notifier.fetchGroups(
                      refreshController: refreshController),
                  child: state.isLoading
                      ? const LoadingList(
                          verticalPadding: 16,
                          itemBorderRadius: 12,
                          horizontalPadding: 12,
                          itemPadding: 10,
                          itemHeight: 68,
                        )
                      : state.groups.isEmpty
                          ? NoDataInfo(
                              title: AppHelpers.getTranslation(TrKeys.noData))
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.groups.length,
                              padding: REdgeInsets.only(
                                  right: 16, top: 20, left: 16, bottom: 100),
                              itemBuilder: (context, index) => MainGroupItem(
                                group: state.groups[index],
                                onTap: () =>
                                    AppHelpers.showCustomModalBottomSheet(
                                  context: context,
                                  modal: ExtrasGroupDetailsModal(
                                    group: state.groups[index],
                                  ),
                                ),
                              ),
                            ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
