// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:venderuzmart/application/chat/chat_notifier.dart';
import 'package:venderuzmart/application/chat/chat_provider.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'widget/message_item.dart';
import 'widget/send_button.dart';

@RoutePage()
class ChatPage extends ConsumerStatefulWidget {
  final ChatModel? chat;

  const ChatPage({super.key, required this.chat});

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  late TextEditingController messageController;
  final focusNode = FocusNode();
  final GlobalKey sendButtonKey = GlobalKey();
  String? editMessageId;
  MessageModel? replyMessage;
  late ChatNotifier notifier;

  @override
  void initState() {
    messageController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier = ref.read(chatProvider.notifier);
      notifier.checkChatId(
          context: context, sellerId: widget.chat?.senderId ?? 0);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  readMessage(List<MessageModel> message, String chatId) {
    message.forEach((element) async {
      if (element.senderId != LocalStorage.getUser()?.id && !element.read) {
        chatRepository.readMessage(chatDocId: chatId, docId: element.doc ?? "");
      }
    });
  }

  editMessage() {
    notifier.editMessage(
        context: context,
        message: messageController.text,
        chatId: widget.chat?.docId,
        messageId: editMessageId ?? "");

    messageController.clear();
    editMessageId = null;
    return;
  }

  deleteMessage(String deleteMessageId) {
    notifier.deleteMessage(
      context: context,
      messageId: deleteMessageId,
      chatId: widget.chat?.docId,
    );
  }

  reply() {
    notifier.replyMessage(
      context: context,
      messageId: replyMessage?.doc ?? "",
      chatId: widget.chat?.docId,
      message: messageController.text,
    );
    replyMessage = null;
    messageController.clear();
    sendButtonKey.currentState?.setState(() {});
  }

  sendMessage({String? chatId}) {
    if (messageController.text.trim().isNotEmpty) {
      if (widget.chat?.docId == null && chatId == null) {
        notifier.createAndSendMessage(
            context: context,
            message: messageController.text,
            userId: widget.chat?.senderId ?? 0,
            onSuccess: () {
              notifier.sendMessage(
                context: context,
                message: messageController.text,
                chatId: widget.chat?.docId,
              );
              messageController.clear();
            });

        return;
      }
      notifier.sendMessage(
        context: context,
        message: messageController.text,
        chatId: widget.chat?.docId,
      );

      messageController.clear();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider);
    return Scaffold(
      key: sendButtonKey,
      appBar: _appBar(),
      body: (widget.chat?.docId == null && state.chatModel?.docId == null)
          ? Center(
              child: Text(
              TrKeys.noMessagesHereYet,
              style: Style.interNormal(size: 16),
            ))
          : state.isMessageLoading
              ? const Loading()
              : StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("chat")
                      .doc(widget.chat?.docId ?? state.chatModel?.docId ?? "")
                      .collection("message")
                      .orderBy("time", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    List<MessageModel> messages = [];
                    for (var element in snapshot.data?.docs ?? []) {
                      messages.add(
                          MessageModel.fromJson(element.data(), element.id));
                    }
                    readMessage(messages,
                        widget.chat?.docId ?? state.chatModel?.docId ?? "");
                    return GroupedListView<MessageModel, DateTime>(
                      elements: messages,
                      reverse: true,
                      order: GroupedListOrder.DESC,
                      groupBy: (element) => DateService.dateFormatYMD(
                          element.time ?? DateTime.now()),
                      groupSeparatorBuilder: (DateTime groupByValue) => Center(
                          child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.r),
                        child: Text(
                          DateService.dateFormatDM(groupByValue),
                          style: Style.interNormal(),
                        ),
                      )),
                      itemBuilder: (context, dynamic element) {
                        return MessageItem(
                          message: element,
                          replyMessage: messages.firstWhere(
                              (e) => e.doc == element.replyDocId,
                              orElse: () => MessageModel(
                                  message: "", senderId: 0, doc: "")),
                          edit: (id) {
                            editMessageId = id;
                            messageController.text = element.message ?? "";
                            focusNode.requestFocus();
                          },
                          reply: (message) {
                            replyMessage = message;
                            focusNode.requestFocus();
                            sendButtonKey.currentState?.setState(() {});
                          },
                          delete: deleteMessage,
                        );
                      },
                      itemComparator: (message, newMessage) =>
                          message.time
                              ?.compareTo(newMessage.time ?? DateTime.now()) ??
                          0,
                    );
                  }),
      bottomNavigationBar: SendButton(
        focusNode: focusNode,
        replyMessage: replyMessage,
        sendMessage: () {
          editMessageId != null
              ? editMessage()
              : replyMessage?.doc != null
                  ? reply()
                  : sendMessage(chatId: state.chatModel?.docId);
        },
        controller: messageController,
        removeReplyMessage: () {
          replyMessage = null;
          focusNode.unfocus();
          sendButtonKey.currentState?.setState(() {});
        },
        sendImage: () {
          AppHelpers.openDialogImagePicker(
            context: context,
            openCamera: () async {
              String? titleImg = await ImgService.getCamera();
              if (context.mounted && (titleImg != null)) {
                notifier.sendImage(
                    context: context,
                    file: titleImg,
                    chatId: widget.chat?.docId);
                Navigator.pop(context);
              }
            },
            openGallery: () async {
              String? titleImg = await ImgService.getGallery();
              if (context.mounted && (titleImg != null)) {
                notifier.sendImage(
                    context: context,
                    file: titleImg,
                    chatId: widget.chat?.docId);
                Navigator.pop(context);
              }
            },
          );
        },
        isLoading: state.isButtonLoading,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 46.r,
      backgroundColor: Style.backgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0.2,
      leading: const PopButton(),
      title: Row(
        children: [
          CommonImage(
            url: widget.chat?.user?.img,
            height: 40,
            width: 40,
            radius: 20,
            name: widget.chat?.user?.firstname ?? widget.chat?.user?.lastname,
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.chat?.user?.firstname ?? ""} ${widget.chat?.user?.lastname ?? ""}",
                  style: Style.interNormal(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                6.verticalSpace,
              ],
            ),
          ),
          16.horizontalSpace,
        ],
      ),
    );
  }
}
