import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:remixicon/remixicon.dart';
import 'package:auto_route/auto_route.dart';
import 'widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({super.key});

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  late RefreshController controller;

  @override
  void initState() {
    controller = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(notificationProvider.notifier)
        ..fetchNotifications(context: context, isRefresh: true)
        ..fetchCount(context);
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
    final state = ref.watch(notificationProvider);
    final notifier = ref.read(notificationProvider.notifier);
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        body: Column(
          children: [
            CommonAppBar(
                bottomPadding: 10,
                height: 68,
                child: Row(
                  children: [
                    const PopButton(),
                    Text(
                      AppHelpers.getTranslation(TrKeys.notification),
                      style: Style.interSemi(size: 18),
                    )
                  ],
                )),
            Builder(
              builder: (context) {
                return state.isAllNotificationsLoading
                    ? const Expanded(
                        child: LoadingList(
                          verticalPadding: 16,
                          itemBorderRadius: 12,
                          horizontalPadding: 12,
                          itemPadding: 10,
                          itemHeight: 100,
                        ),
                      )
                    : state.notifications.isNotEmpty
                        ? Expanded(
                            child: SmartRefresher(
                              controller: controller,
                              enablePullUp: true,
                              enablePullDown: true,
                              onLoading: () {
                                notifier.fetchNotifications(
                                  context: context,
                                  controller: controller,
                                );
                              },
                              onRefresh: () {
                                notifier.fetchNotifications(
                                  isRefresh: true,
                                  context: context,
                                  controller: controller,
                                );
                              },
                              child: ListView.builder(
                                padding: REdgeInsets.only(bottom: 100, top: 16),
                                shrinkWrap: true,
                                itemCount: state.notifications.length,
                                itemBuilder: (context, index) {
                                  return NotificationItem(
                                    notification: state.notifications[index],
                                  );
                                },
                              ),
                            ),
                          )
                        : _empty(context);
              },
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _buildButton(),
      ),
    );
  }

  Widget _empty(BuildContext context) {
    return Column(
      children: [
        32.verticalSpace,
        Lottie.asset(Assets.lottieNotificationEmpty,
            width: MediaQuery.sizeOf(context).width / 1.5),
        32.verticalSpace,
        Text(
          AppHelpers.getTranslation(TrKeys.yourNotificationListIsEmpty),
          style: Style.interSemi(size: 18),
        )
      ],
    );
  }

  Widget _buildButton() {
    return Builder(
      builder: (context) {
        final state = ref.watch(notificationProvider);
        final notifier = ref.read(notificationProvider.notifier);
        return state.notifications.isNotEmpty
            ? ButtonEffectAnimation(
                onTap: () {
                  notifier.readAll(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: Style.black,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.r, vertical: 20.r),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Remix.check_double_line,
                        color: Style.white,
                      ),
                      8.horizontalSpace,
                      Text(
                        AppHelpers.getTranslation(TrKeys.markAsRead),
                        style: Style.interNormal(color: Style.white, size: 16),
                      )
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
