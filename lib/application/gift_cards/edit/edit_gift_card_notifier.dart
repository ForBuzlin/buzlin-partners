import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/gift_card_facade.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import '../../../infrastructure/models/data/gift_card_data.dart';
import 'edit_gift_card_state.dart';

class EditGiftCardNotifier extends StateNotifier<EditGiftCardState> {
  final GiftCardFacade _giftCardRepository;

  EditGiftCardNotifier(this._giftCardRepository)
      : super(const EditGiftCardState());

  void clear() {
    state = state.copyWith();
  }

  // Future<void> fetchGiftCardDetails(
  //     {required BuildContext context,
  //     required GiftCardData? giftCardData}) async {
  //   state = state.copyWith(isLoading: true, giftCardData: giftCardData);
  //   final res =
  //       await _giftCardRepository.getGiftCardDetails(giftCardData?.id);
  //   res.when(success: (data) {
  //     state = state.copyWith(
  //         isLoading: false, giftCardData: data.data);
  //   }, failure: (failure, status) {
  //     state = state.copyWith(isLoading: false);
  //     AppHelpers.errorSnackBar(context, text: failure);
  //   });
  // }

  Future<void> updateGiftCard(
    BuildContext context, {
    required String title,
    required String description,
    required String price,
    ValueChanged? updated,
    VoidCallback? failed,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _giftCardRepository.updateGiftCard(
      title: title,
      description: description,
      id: state.giftCardData?.id ?? 0,
      time: state.giftCardData?.time,
      price: num.tryParse(price) ?? 0,
      active: state.active,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, giftCardData: null);
        updated?.call(data.data);
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
        state = state.copyWith(isLoading: false);
        debugPrint('===> update membership failure: $failure');
        failed?.call();
      },
    );
  }

  Future<void> fetchGiftCardDetails(
      {required BuildContext context,
        required GiftCardData? giftCard,
        ValueChanged<String?>? onSuccess}) async {
    state = state.copyWith(isLoading: true);
    final res =
    await _giftCardRepository.getGiftCardDetails(giftCard?.id);
    res.when(success: (data) {
      state = state.copyWith(
          isLoading: false, giftCardData: data.data);
      onSuccess?.call(data.data.translations?.first.description);
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  setGiftCard(GiftCardData? giftCardData) {
    state = state.copyWith(giftCardData: giftCardData);
  }

  void setTime(String time) {
    state = state.copyWith(giftCardData: state.giftCardData?.copyWith(time: time));
  }
  void setActive(bool? value) {
    state = state.copyWith(active: !state.active);
  }

}
