import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/gift_card_facade.dart';
import 'package:venderuzmart/infrastructure/models/data/gift_card_data.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'add_gift_card_state.dart';

class AddGiftCardNotifier extends StateNotifier<AddGiftCardState> {
  final GiftCardFacade _giftCardRepository;

  AddGiftCardNotifier(
    this._giftCardRepository,
  ) : super(const AddGiftCardState());

  Future<void> createGiftCard(
    BuildContext context, {
    required String title,
    required String description,
    required String price,
    VoidCallback? created,
    VoidCallback? onError,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _giftCardRepository.addGiftCards(
      title: title,
      description: description,
      time: state.giftCardData?.time,
      price: num.tryParse(price) ?? 0,
      active: state.active,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
          created?.call();
      },
      failure: (failure, status) {
        debugPrint('===> create gift cards failure: $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
        onError?.call();
      },
    );
  }
  void clear() {
    state = state.copyWith( giftCardData: GiftCardData());
  }
  void setTime(String time) {
    state = state.copyWith(giftCardData: state.giftCardData?.copyWith(time: time));
  }
  void setActive(bool? value) {
    state = state.copyWith(active: !state.active);
  }
}
