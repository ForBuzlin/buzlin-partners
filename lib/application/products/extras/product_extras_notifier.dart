import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product_extras_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class ProductExtrasNotifier extends StateNotifier<ProductExtrasState> {
  final ExtrasFacade _productsRepository;

  ProductExtrasNotifier(this._productsRepository)
      : super(const ProductExtrasState());

  Future<void> fetchGroups({RefreshController? refreshController}) async {
    state = state.copyWith(isLoading: true);
    final response =
        await _productsRepository.getExtrasGroups(needOnlyValid: false);
    response.when(
      success: (data) {
        state = state.copyWith(groups: data.data ?? [], isLoading: false);
        refreshController?.refreshCompleted();
      },
      failure: (failure, status) {
        debugPrint('===> fetch groups fail $failure');
        state = state.copyWith(isLoading: false);
        refreshController?.refreshFailed();
      },
    );
  }
}
