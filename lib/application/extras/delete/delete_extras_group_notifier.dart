import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/infrastructure/services/services.dart';
import 'delete_extras_group_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class DeleteExtrasGroupNotifier extends StateNotifier<DeleteExtrasGroupState> {
  final ExtrasFacade _extrasRepository;

  DeleteExtrasGroupNotifier(this._extrasRepository)
      : super(const DeleteExtrasGroupState());

  Future<void> deleteExtrasGroup(BuildContext context,
      {VoidCallback? success, int? groupId}) async {
    state = state.copyWith(isLoading: true);
    final response =
        await _extrasRepository.deleteExtrasGroup(groupId: groupId);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      failure: (failure, status) {
        debugPrint('===> delete extras group fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }
}
