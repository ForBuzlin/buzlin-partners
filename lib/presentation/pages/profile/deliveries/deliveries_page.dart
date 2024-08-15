import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:remixicon/remixicon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'widgets/status_dialog.dart';

@RoutePage()
class DeliveriesPage extends ConsumerStatefulWidget {
  const DeliveriesPage({super.key});

  @override
  ConsumerState<DeliveriesPage> createState() => _DeliveriesPageState();
}

class _DeliveriesPageState extends ConsumerState<DeliveriesPage> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(deliverymenProvider.notifier).fetchDeliverymen(
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
    final state = ref.watch(deliverymenProvider);
    final notifier = ref.read(deliverymenProvider.notifier);
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
                    Expanded(
                      child: Text(
                        AppHelpers.getTranslation(TrKeys.deliveries),
                        style: Style.interNormal(
                          size: 16,
                        ),
                      ),
                    ),
                    SecondButton(
                      title: TrKeys.add,
                      onTap: () {
                        context.pushRoute(const AddDeliverymanRoute());
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
                SearchTextField(
                  onChanged: (value) => notifier.setQuery(query: value),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                    child: state.isLoading
                        ? const Loading()
                        : SmartRefresher(
                            controller: _refreshController,
                            enablePullUp: true,
                            onRefresh: () => notifier.fetchDeliverymen(
                                refreshController: _refreshController,
                                isRefresh: true),
                            onLoading: () => notifier.fetchDeliverymen(
                              refreshController: _refreshController,
                            ),
                            child: ListView.builder(
                              padding: REdgeInsets.symmetric(vertical: 12),
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.users.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => DeliverymanItem(
                                user: state.users[index],
                                onTap: (status) {
                                  AppHelpers.showAlertDialog(
                                    context: context,
                                    child:  StatusDialog(
                                      id:  state.users[index].invitations?.first.id,
                                      status: status,
                                    ),
                                  );
                                  // notifier.setSelectUser(state.users[index]);
                                  // AppHelpers.showCustomModalBottomSheet(
                                  //     context: context,
                                  //     modal: const ClientInfoModal());
                                },
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
