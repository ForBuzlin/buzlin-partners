import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/infrastructure/services/services.dart';
import 'create_extras_group_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class CreateExtrasGroupNotifier extends StateNotifier<CreateExtrasGroupState> {
  final ExtrasFacade _productsRepository;

  CreateExtrasGroupNotifier(this._productsRepository)
      : super(const CreateExtrasGroupState());

  Future<void> createExtrasGroup(
    BuildContext context, {
    String? title,
    VoidCallback? success,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.createExtrasGroup(
      title: title ?? '',
      type: state.type,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      failure: (failure, status) {
        debugPrint('===> create extras group fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  void setType(String? value) {
    state = state.copyWith(type: value ?? TrKeys.text);
  }
}
