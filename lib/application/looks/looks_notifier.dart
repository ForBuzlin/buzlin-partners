import 'dart:async';
import 'looks_state.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class LooksNotifier extends StateNotifier<LooksState> {
  final LooksFacade _looksRepository;
  int _page = 0;

  LooksNotifier(this._looksRepository) : super(const LooksState());

  Future<void> fetchLooks({
    required BuildContext context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(looks: [], isLoading: true);
    }
    final res = await _looksRepository.getLooks(page: ++_page);
    res.when(success: (data) {
      List<LooksData> list = List.from(state.looks);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, looks: list);
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
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> deleteDiscount(BuildContext context, int? id) async {
    state = state.copyWith(isLoading: true);
    final response = await _looksRepository.deleteLooks(id);
    response.when(
      success: (success) {
        List<LooksData> list = List.from(state.looks);
        list.removeWhere((element) => element.id == id);
        state = state.copyWith(looks: list);
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
    state = state.copyWith(isLoading: false);
  }

  Future<void> addLooks(
    LooksData? looksData,
  ) async {
    if (looksData == null) return;
    List<LooksData> list = List.from(state.looks);
    int? index;
    for (int i = 0; i < list.length; i++) {
      if (looksData.id == list[i].id) {
        index = i;
      }
    }
    if (index != null) {
      list[index] = looksData.copyWith(translation: list[index].translation);
    } else {
      list.add(looksData);
    }
    state = state.copyWith(looks: list);
  }
}
