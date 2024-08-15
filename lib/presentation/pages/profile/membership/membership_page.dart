import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';

import 'widget/membership_item.dart';

@RoutePage()
class MembershipPage extends ConsumerStatefulWidget {
  const MembershipPage({super.key});

  @override
  ConsumerState<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends ConsumerState<MembershipPage> {
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(membershipProvider.notifier)
          .fetchMemberships(isRefresh: true),
    );
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(membershipProvider);
            final notifier = ref.read(membershipProvider.notifier);
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
                          AppHelpers.getTranslation(TrKeys.membership),
                          style: Style.interNormal(size: 16),
                        ),
                        const Spacer(),
                        SecondButton(
                          title: TrKeys.add,
                          onTap: () {
                            refreshController.resetNoData();
                            context.pushRoute(const AddMembershipRoute());
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
                    onRefresh: () => notifier.fetchMemberships(
                      context: context,
                      controller: refreshController,
                      isRefresh: true,
                    ),
                    child: state.isLoading
                        ? const LoadingList(
                            verticalPadding: 12,
                            itemBorderRadius: 12,
                            horizontalPadding: 12,
                            itemHeight: 86,
                          )
                        : state.list.isEmpty
                            ? const NoItem()
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.list.length,
                                padding: REdgeInsets.all(12),
                                itemBuilder: (context, index) {
                                  return MembershipItem(
                                    membership: state.list[index],
                                    onEdit: () {
                                      refreshController.resetNoData();
                                      context.pushRoute(
                                        EditMembershipRoute(
                                          membership: state.list[index],
                                        ),
                                      );
                                    },
                                    onDelete: () {
                                      AppHelpers
                                          .showCustomModalBottomSheet(
                                        context: context,
                                        modal: DeleteModal(
                                          onDelete: () {
                                            notifier.deleteMembership(
                                              context,
                                              state.list[index].id,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
