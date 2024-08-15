import 'package:venderuzmart/domain/handlers/api_result.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

abstract class ChatFacade {
  Future<ApiResult<List<ChatModel>>> getChatList({String? lastDocId});

  Future<ApiResult<MessageModel>> sendMessage(
      {required MessageModel message, required String chatDocId});

  Future<ApiResult<ChatModel>> createChat({required int id});

  Future<ApiResult<ChatModel>> getChat({required int sellerId});

  Future<ApiResult<UserData>> showChatUser({required int sellerId});

  void deleteMessage({required String chatDocId, required String docId});

  void readMessage({required String chatDocId, required String docId});

  void replyMessage({required String chatDocId, required MessageModel message});

  void editMessage({
    required String message,
    required String chatDocId,
    required String docId,
  });
}
