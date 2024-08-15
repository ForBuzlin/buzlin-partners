import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:remixicon/remixicon.dart';
import 'widgets/cancelled_masters_body.dart';
import 'package:auto_route/auto_route.dart';
import 'widgets/accepted_masters_body.dart';
import 'widgets/rejected_masters_body.dart';
import 'widgets/new_masters_body.dart';
import 'package:flutter/material.dart';
import 'widgets/masters_tab_bar.dart';

@RoutePage()
class MastersPage extends ConsumerStatefulWidget {
  const MastersPage({super.key}) ;

  @override
  ConsumerState<MastersPage> createState() => _MastersPageState();
}

class _MastersPageState extends ConsumerState<MastersPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late RefreshController newRefreshController;
  late RefreshController acceptedRefreshController;
  late RefreshController rejectedRefreshController;
  late RefreshController cancelledRefreshController;

  @override
  void initState() {
    newRefreshController = RefreshController();
    acceptedRefreshController = RefreshController();
    rejectedRefreshController = RefreshController();
    cancelledRefreshController = RefreshController();
    _tabController = TabController(length: 4, vsync: this);
    _tabController?.addListener(
      () {
        if (!(_tabController?.indexIsChanging ?? false)) {
          ref.read(mastersProvider.notifier).setAppbarDetails(
                _tabController?.index,
              );
        }
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(newMastersProvider.notifier).fetchMembers(isRefresh: true);
      ref
          .read(acceptedMastersProvider.notifier)
          .fetchMembers(isRefresh: true, context: context);
      ref.read(rejectedMastersProvider.notifier).fetchMembers(isRefresh: true);
      ref.read(cancelledMastersProvider.notifier).fetchMembers(isRefresh: true);
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    newRefreshController.dispose();
    acceptedRefreshController.dispose();
    rejectedRefreshController.dispose();
    cancelledRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
              bottomPadding: 0,
              height: 108,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const PopButton(),
                      Text(
                        AppHelpers.getTranslation(TrKeys.masters),
                        style: Style.interNormal(size: 16),
                      ),
                      const Spacer(),
                      SecondButton(
                        title: TrKeys.add,
                        onTap: () {
                          context.pushRoute(const AddMasterRoute());
                        },
                        prefix: Icon(
                          Remix.add_line,
                          size: 20.r,
                          color: Style.white,
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 8.r),
                  Flexible(child: MastersTabBar(tabController: _tabController),),
                ],
              )),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _tabController,
              children: [
                NewMastersBody(refreshController: newRefreshController),
                AcceptedMastersBody(
                    refreshController: acceptedRefreshController),
                CancelledMastersBody(
                    refreshController: cancelledRefreshController),
                RejectedMastersBody(
                    refreshController: rejectedRefreshController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
