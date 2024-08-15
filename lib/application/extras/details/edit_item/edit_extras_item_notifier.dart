import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/infrastructure/services/services.dart';
import 'edit_extras_item_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class EditExtrasItemNotifier extends StateNotifier<EditExtrasItemState> {
  final ExtrasFacade _extrasRepository;
  String _title = '';

  EditExtrasItemNotifier(this._extrasRepository)
      : super(const EditExtrasItemState());

  Future<void> updateExtrasItem(
    BuildContext context, {
    VoidCallback? success,
    int? groupId,
    int? extrasId,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _extrasRepository.updateExtrasItem(
      extrasId: extrasId ?? 0,
      title: _title,
      groupId: groupId ?? 0,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      failure: (failure, status) {
        debugPrint('===> update extras item fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  void setTitle(String value) {
    _title = value.trim();
  }
}
