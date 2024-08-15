import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/application/chat/chat_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'widget/chat_item.dart';

@RoutePage()
class ChatListPage extends ConsumerStatefulWidget {
  const ChatListPage({super.key});

  @override
  ConsumerState<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends ConsumerState<ChatListPage> {
  late RefreshController refreshController;

  @override
  void initState() {
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(chatProvider.notifier)
          .getChatList(context: context, isRefresh: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider);
    final notifier = ref.read(chatProvider.notifier);
    return Scaffold(
      body: Column(
        children: [
          CommonAppBar(
            child: Row(
              children: [
                const PopButton(),
                8.horizontalSpace,
                Text(
                  AppHelpers.getTranslation(TrKeys.chats),
                  style: Style.interNormal(size: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: state.isLoading
                ? const Loading()
                : SmartRefresher(
                    enablePullUp: true,
                    enablePullDown: true,
                    controller: refreshController,
                    onRefresh: () {
                      notifier.getChatList(
                        context: context,
                        controller: refreshController,
                        isRefresh: true,
                      );
                    },
                    onLoading: () {
                      notifier.getChatList(
                        context: context,
                        controller: refreshController,
                      );
                    },
                    child: state.chatList.isNotEmpty
                        ? ListView.builder(
                            padding: REdgeInsets.all(16),
                            shrinkWrap: true,
                            itemCount: state.chatList.length,
                            itemBuilder: (context, index) {
                              return ButtonEffectAnimation(
                                onTap: () {
                                  context.pushRoute(ChatRoute(
                                    chat: state.chatList[index],
                                  ));
                                },
                                child: ChatItem(
                                  chat: state.chatList[index],
                                ),
                              );
                            })
                        : _empty(context),
                  ),
          )
        ],
      ),
    );
  }

  Widget _empty(BuildContext context) {
    return Column(
      children: [
        32.verticalSpace,
        Lottie.asset("assets/lottie/notification_empty.json",
            width: MediaQuery.sizeOf(context).width / 1.5),
        32.verticalSpace,
        Text(
          AppHelpers.getTranslation(TrKeys.yourChatListIsEmpty),
          style: Style.interNormal(size: 18),
        )
      ],
    );
  }
}
