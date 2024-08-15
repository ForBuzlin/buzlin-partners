import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/domain/interface/chat_facade.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'chat_state.dart';

class ChatNotifier extends StateNotifier<MainState> {
  ChatNotifier(this._chatRepo, this._galleryRepo) : super(const MainState());
  final ChatFacade _chatRepo;
  final SettingsFacade _galleryRepo;

  String? lastDocId;

  checkChatId({required BuildContext context, required int sellerId}) async {
    state = state.copyWith(isMessageLoading: true);
    final res = await _chatRepo.getChat(sellerId: sellerId);
    res.when(success: (l) {
      state = state.copyWith(
        chatModel: l,
        isMessageLoading: false,
      );
    }, failure: (fail, s) {
      state = state.copyWith(isMessageLoading: false);
    });
  }

  sendImage(
      {required BuildContext context,
      required String file,
      required String? chatId}) async {
    state = state.copyWith(isButtonLoading: true);
    final res = await _galleryRepo.uploadImage(file, UploadType.chats);
    res.when(success: (image) {
      _chatRepo.sendMessage(
          chatDocId: chatId ?? state.chatModel?.docId ?? "",
          message: MessageModel(
              message: image.imageData?.title,
              senderId: LocalStorage.getUser()?.id ?? 0,
              type: "image",
              doc: ""));
      state = state.copyWith(isButtonLoading: false);
    }, failure: (failure, s) {
      state = state.copyWith(isButtonLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  sendMessage(
      {required BuildContext context,
      required String message,
      required String? chatId}) {
    _chatRepo.sendMessage(
      chatDocId: chatId ?? state.chatModel?.docId ?? "",
      message: MessageModel(
          message: message, senderId: LocalStorage.getUser()?.id ?? 0, doc: ""),
    );
    List<ChatModel> list = List.from(state.chatList);
    int index = list.indexWhere((element) => element.docId == chatId);
    ChatModel chat = list[index];
    list.removeAt(index);
    list.insert(0, chat);
    state = state.copyWith(chatList: list);
  }

  editMessage(
      {required BuildContext context,
      required String message,
      required String messageId,
      required String? chatId}) {
    _chatRepo.editMessage(
      chatDocId: chatId ?? state.chatModel?.docId ?? "",
      message: message,
      docId: messageId,
    );
  }

  getChatList({
    required BuildContext context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      lastDocId = null;
      state = state.copyWith(chatList: [], isLoading: true);
    }
    final res = await _chatRepo.getChatList(
      lastDocId: lastDocId,
    );
    res.when(success: (data) {
      if (data.isEmpty) {
        controller?.loadNoData();
        state = state.copyWith(isLoading: false);
        return;
      }
      lastDocId = data.last.docId;
      List<ChatModel> list = List.from(state.chatList);
      list.addAll(data);
      state = state.copyWith(isLoading: false, chatList: list);
      if (isRefresh ?? false) {
        controller?.refreshCompleted();
        return;
      }
      controller?.loadComplete();
      return;
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  replyMessage(
      {required BuildContext context,
      required String message,
      required String messageId,
      required String? chatId}) {
    _chatRepo.replyMessage(
      chatDocId: chatId ?? state.chatModel?.docId ?? "",
      message: MessageModel(
          message: message,
          senderId: LocalStorage.getUser()?.id ?? 0,
          doc: "",
          replyDocId: messageId),
    );
  }

  deleteMessage(
      {required BuildContext context,
      required String messageId,
      required String? chatId}) {
    _chatRepo.deleteMessage(
        chatDocId: chatId ?? state.chatModel?.docId ?? "", docId: messageId);
  }

  createAndSendMessage(
      {required BuildContext context,
      required String message,
      required int userId,
      required Function onSuccess}) async {
    final res = await _chatRepo.createChat(id: userId);
    res.when(success: (l) async {
      state = state.copyWith(chatModel: l);
      onSuccess();
    }, failure: (fail, s) {
      AppHelpers.errorSnackBar(context, text: fail);
    });
  }
}
