import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';

class MastersModal extends ConsumerStatefulWidget {
  final ValueChanged<UserData> onChange;
  final UserData? user;

  const MastersModal({
    super.key,
    required this.onChange,
    this.user,
  }) ;

  @override
  ConsumerState<MastersModal> createState() => _MastersModalState();
}

class _MastersModalState extends ConsumerState<MastersModal> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (ref.watch(acceptedMastersProvider).users.isEmpty) {
          ref
              .read(acceptedMastersProvider.notifier)
              .fetchMembers(isRefresh: true, context: context);
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
    final state = ref.watch(acceptedMastersProvider);
    final notifier = ref.read(acceptedMastersProvider.notifier);
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
                      onRefresh: () => notifier.fetchMembers(
                        refreshController: _refreshController,
                        isRefresh: true,
                        context: context,
                      ),
                      onLoading: () => notifier.fetchMembers(
                        refreshController: _refreshController,
                        context: context,
                      ),
                      child: state.users.isEmpty
                          ? const NoItem(title: TrKeys.noAcceptedMasters)
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.users.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => UserItem(
                                user: state.users[index],
                                onTap: () {
                                  widget.onChange.call(state.users[index]);
                                  Navigator.pop(context);
                                },
                                isSelected:
                                    widget.user?.id == state.users[index].id,
                              ),
                            ),
                    ),
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
