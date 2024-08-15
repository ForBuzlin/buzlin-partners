import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/pages/profile/masters/widgets/status_dialog.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'masters_item.dart';

class NewMastersBody extends ConsumerWidget {
  final RefreshController refreshController;

  const NewMastersBody({super.key, required this.refreshController});

  @override
  Widget build(context, ref) {
    final state = ref.watch(newMastersProvider);
    final notifier = ref.read(newMastersProvider.notifier);
    return state.isLoading
        ? const Loading()
        : SmartRefresher(
            controller: refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: () => notifier.fetchMembers(
                refreshController: refreshController, isRefresh: true),
            onLoading: () =>
                notifier.fetchMembers(refreshController: refreshController),
            child: state.users.isEmpty
                ? const NoItem(title: TrKeys.noNewMasters)
                : AnimationLimiter(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: REdgeInsets.only(
                          top: 16, bottom: 56, left: 12, right: 12),
                      shrinkWrap: true,
                      itemCount: state.users.length,
                      itemBuilder: (context, index) =>
                          AnimationConfiguration.staggeredList(
                        position: index,
                        duration: AppConstants.animationDuration,
                        child: ScaleAnimation(
                          scale: 0.5,
                          child: FadeInAnimation(
                            child: MastersItem(
                              user: state.users[index],
                              spacing: 10,
                              onTap: () {
                                AppHelpers.showAlertDialog(
                                  context: context,
                                  child:  StatusDialog(
                                    id:  state.users[index].invitations?.first.id,
                                    status: TrKeys.newKey,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          );
  }
}
