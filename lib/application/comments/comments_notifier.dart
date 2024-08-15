import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/domain/interface/comments_facade.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'comments_state.dart';

class CommentsNotifier extends StateNotifier<CommentsState> {
  final CommentsFacade _commentsRepository;
  int _page = 0;
  int _shopPage = 0;

  CommentsNotifier(this._commentsRepository) : super(const CommentsState());

  void setActiveIndex(int index) {
    if (state.activeIndex == index) {
      return;
    }
    state = state.copyWith(activeIndex: index);
  }

  fetchProductComments({
    BuildContext? context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(productComments: [], isLoading: true);
    }
    final res = await _commentsRepository.getProductComments(
      page: ++_page,
    );
    res.when(success: (data) {
      List<CommentsData> list = List.from(state.productComments);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, productComments: list);
      if (isRefresh ?? false) {
        controller?.refreshCompleted();
        return;
      } else if (data.data?.isEmpty ?? true) {
        controller?.loadNoData();
        return;
      }
      controller?.loadComplete();
      return;
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      debugPrint(" ==> fetch product comments fail: $failure");
      if (context != null) {
        AppHelpers.errorSnackBar(context, text: failure);
      }
    });
  }

  fetchShopComments({
    BuildContext? context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _shopPage = 0;
      state = state.copyWith(shopComments: [], isLoading: true);
    }
    final res = await _commentsRepository.getShopComments(
      page: ++_shopPage,
    );
    res.when(success: (data) {
      List<ShopCommentsData> list = List.from(state.shopComments);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, shopComments: list);
      if (isRefresh ?? false) {
        controller?.refreshCompleted();
        return;
      } else if (data.data?.isEmpty ?? true) {
        controller?.loadNoData();
        return;
      }
      controller?.loadComplete();
      return;
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      debugPrint(" ==> fetch shop comments fail: $failure");
      if (context != null) {
        AppHelpers.errorSnackBar(context, text: failure);
      }
    });
  }
}
