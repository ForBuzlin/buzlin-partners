import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class SelectUserModal extends ConsumerStatefulWidget {
  const SelectUserModal({super.key}) ;

  @override
  ConsumerState<SelectUserModal> createState() => _SelectUserPageState();
}

class _SelectUserPageState extends ConsumerState<SelectUserModal> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(orderUserProvider.notifier).initialFetchUsers(
          refreshController: _refreshController,
          onSuccess: (user) {
            ref.read(orderCartProvider.notifier).setSelectedUser(user);
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderUserProvider);
    final event = ref.read(orderUserProvider.notifier);
    return Container(
      margin: MediaQuery.viewInsetsOf(context),
      child: ModalWrap(
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const ModalDrag(),
              SearchTextField(
                isBorder: true,
                onChanged: (value) => event.setQuery(
                  refreshController: _refreshController,
                  text: value,
                ),
              ),
              6.verticalSpace,
              Expanded(
                child: state.isLoading
                    ? const Loading(size: 30)
                    : SmartRefresher(
                        controller: _refreshController,
                        enablePullUp: true,
                        onRefresh: () => event.refreshUsers(
                          refreshController: _refreshController,
                        ),
                        onLoading: () => event.fetchMoreUsers(
                          refreshController: _refreshController,
                        ),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.users.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => UserItem(
                            user: state.users[index],
                            isSelected: index == state.selectedIndex,
                            onTap: () {
                              ref
                                  .read(orderCartProvider.notifier)
                                  .setSelectedUser(state.users[index]);
                              event.setSelectedUser(index);
                              Navigator.pop(context);
                            },
                          ),
                        ),
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
