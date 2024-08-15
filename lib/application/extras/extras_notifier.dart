import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

import 'extras_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class ExtrasNotifier extends StateNotifier<ExtrasState> {
  final ExtrasFacade _extrasRepository;

  ExtrasNotifier(this._extrasRepository) : super(const ExtrasState());

  Future<void> fetchGroups({RefreshController? refreshController}) async {
    state = state.copyWith(isLoading: true);
    final response =
        await _extrasRepository.getExtrasGroups(needOnlyValid: false);
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

  Future<void> updateGroups(Group? group) async {
    if (group == null) return;
    List<Group> list = List.from(state.groups);
    list.removeWhere((element) => element.id == group.id);
    list.add(group);
    state = state.copyWith(groups: list);
  }
}
