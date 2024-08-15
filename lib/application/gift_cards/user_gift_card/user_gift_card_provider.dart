import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_gift_card_state.dart';
import 'user_gift_card_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final userGiftCardProvider =
    StateNotifierProvider<UserGiftCardNotifier, UserGiftCardState>(
  (ref) => UserGiftCardNotifier(giftCardRepository),
);
