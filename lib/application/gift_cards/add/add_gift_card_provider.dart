import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';

import 'add_gift_card_notifier.dart';
import 'add_gift_card_state.dart';

final addGiftCardProvider =
    StateNotifierProvider<AddGiftCardNotifier, AddGiftCardState>(
  (ref) => AddGiftCardNotifier(giftCardRepository),
);
