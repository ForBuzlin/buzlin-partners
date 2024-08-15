import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/infrastructure/services/services.dart';
import 'create_new_group_item_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class CreateNewGroupItemNotifier
    extends StateNotifier<CreateNewGroupItemState> {
  final ExtrasFacade _extrasRepository;
  String _title = '';

  CreateNewGroupItemNotifier(this._extrasRepository)
      : super(const CreateNewGroupItemState());

  Future<void> createExtrasItem(
    BuildContext context, {
    VoidCallback? success,
    int? groupId,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _extrasRepository.createExtrasItem(
      title: _title,
      groupId: groupId ?? 0,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      failure: (failure, status) {
        debugPrint('===> create extras item fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  void setTitle(String value) {
    _title = value.trim();
  }
}
