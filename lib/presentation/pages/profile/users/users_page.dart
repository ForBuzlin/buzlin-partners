import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:auto_route/auto_route.dart';
import 'widgets/client_info_modal.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UsersPage extends ConsumerStatefulWidget {
  const UsersPage({super.key});

  @override
  ConsumerState<UsersPage> createState() => _SelectUserPageState();
}

class _SelectUserPageState extends ConsumerState<UsersPage> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(usersProvider.notifier)
          .initialFetchUsers(refreshController: _refreshController),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(usersProvider);
    final notifier = ref.read(usersProvider.notifier);
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            height: 146,
            bottomPadding: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const PopButton(),
                    Text(
                      AppHelpers.getTranslation(TrKeys.users),
                      style: Style.interNormal(
                        size: 16,
                      ),
                    ),
                  ],
                ),
                Divider(height: 8.r),
                SearchTextField(
                  onChanged: (value) => notifier.setQuery(
                    refreshController: _refreshController,
                    text: value,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  12.verticalSpace,
                  Expanded(
                    child: state.isLoading
                        ? const Loading()
                        : SmartRefresher(
                            controller: _refreshController,
                            enablePullUp: true,
                            onRefresh: () => notifier.refreshUsers(
                              refreshController: _refreshController,
                            ),
                            onLoading: () => notifier.fetchMoreUsers(
                              refreshController: _refreshController,
                            ),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.users.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => ClientsItem(
                                user: state.users[index],
                                onTap: () {
                                  notifier.setSelectUser(state.users[index]);
                                  AppHelpers.showCustomModalBottomSheet(
                                      context: context,
                                      modal: const ClientInfoModal());
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
        ],
      ),
    );
  }
}
