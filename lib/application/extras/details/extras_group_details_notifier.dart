import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'extras_group_details_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class ExtrasGroupDetailsNotifier
    extends StateNotifier<ExtrasGroupDetailsState> {
  final ExtrasFacade _extrasRepository;

  ExtrasGroupDetailsNotifier(this._extrasRepository)
      : super(const ExtrasGroupDetailsState());

  Future<void> fetchGroupExtras({int? groupId}) async {
    state = state.copyWith(isLoading: true);
    final response = await _extrasRepository.getExtras(groupId: groupId);
    response.when(
      success: (data) {
        state = state.copyWith(
          extras: data.data?.extraValues ?? [],
          isLoading: false,
        );
      },
      failure: (failure, status) {
        debugPrint('===> fetch extras fail $failure');
        state = state.copyWith(isLoading: false);
      },
    );
  }
}
