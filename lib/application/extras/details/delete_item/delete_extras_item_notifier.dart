import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/infrastructure/services/services.dart';
import 'delete_extras_item_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class DeleteExtrasItemNotifier extends StateNotifier<DeleteExtrasItemState> {
  final ExtrasFacade _productsRepository;

  DeleteExtrasItemNotifier(this._productsRepository)
      : super(const DeleteExtrasItemState());

  Future<void> deleteExtrasItem(BuildContext context,
      {VoidCallback? success, int? extrasId}) async {
    state = state.copyWith(isLoading: true);
    final response =
        await _productsRepository.deleteExtrasItem(extrasId: extrasId ?? 0);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      failure: (failure, status) {
        debugPrint('===> delete extras item fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }
}
