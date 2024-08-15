import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:auto_route/auto_route.dart';
import 'widget/user_membership_item.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserMembershipPage extends ConsumerStatefulWidget {
  const UserMembershipPage({super.key});

  @override
  ConsumerState<UserMembershipPage> createState() => _UserMembershipPageState();
}

class _UserMembershipPageState extends ConsumerState<UserMembershipPage> {
  late RefreshController refreshController;

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(userMembershipProvider.notifier)
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
            final state = ref.watch(userMembershipProvider);
            final notifier = ref.read(userMembershipProvider.notifier);
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
                          AppHelpers.getTranslation(TrKeys.userMembership),
                          style: Style.interNormal(size: 16),
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
                    enablePullDown: true,
                    enablePullUp: true,
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
                                  return UserMembershipItem(
                                    membership: state.list[index],
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
