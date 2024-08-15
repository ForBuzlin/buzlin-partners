import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'gift_card_state.dart';
import 'gift_card_notifier.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

final giftCardProvider =
    StateNotifierProvider<GiftCardNotifier, GiftCardState>(
  (ref) => GiftCardNotifier(giftCardRepository),
);
