import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

import 'package:venderuzmart/infrastructure/services/services.dart';
import 'update_extras_group_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class UpdateExtrasGroupNotifier extends StateNotifier<UpdateExtrasGroupState> {
  final ExtrasFacade _extrasRepository;
  String _title = '';

  UpdateExtrasGroupNotifier(this._extrasRepository)
      : super(const UpdateExtrasGroupState());

  Future<void> updateExtrasGroup(
    BuildContext context, {
    ValueChanged<Group?>? success,
    int? groupId,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _extrasRepository.updateExtrasGroup(
      title: _title,
      groupId: groupId,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call(data.data
            ?.copyWith(translation: Translation(title: _title, id: groupId)));
      },
      failure: (failure, status) {
        debugPrint('===> update extras group fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  void setTitle(String value) {
    _title = value.trim();
  }
}
