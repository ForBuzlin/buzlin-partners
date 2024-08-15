import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/data/gift_card_data.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import '../../domain/interface/gift_card_facade.dart';
import 'gift_card_state.dart';

class GiftCardNotifier extends StateNotifier<GiftCardState> {
  final GiftCardFacade _giftCardRepository;

  int _page = 0;

  GiftCardNotifier(this._giftCardRepository)
      : super(const GiftCardState());

  fetchGiftCards({
    BuildContext? context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(list: [], isLoading: true);
    }
    final res = await _giftCardRepository.getGiftCarts(
      page: ++_page,
    );
    res.when(success: (data) {
      List<GiftCardData> list = List.from(state.list);
      list.addAll(data.data);
      state = state.copyWith(isLoading: false, list: list);
      if (isRefresh ?? false) {
        controller?.refreshCompleted();
        return;
      } else if (data.data.isEmpty) {
        controller?.loadNoData();
        return;
      }
      controller?.loadComplete();
      return;
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      debugPrint(" ==> fetch ads fail: $failure");
      if (context != null) {
        AppHelpers.errorSnackBar(context, text: failure);
      }
    });
  }

  Future<void> deleteGiftCard(BuildContext context, int? id) async {
    state = state.copyWith(isLoading: true);
    final response = await _giftCardRepository.deleteGiftCard(id);
    response.when(
      success: (success) {
        List<GiftCardData> list = List.from(state.list);
        list.removeWhere((element) => element.id == id);
        state = state.copyWith(list: list);
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(
          context,
          text: failure,
        );
      },
    );
    state = state.copyWith(isLoading: false);
  }
}
