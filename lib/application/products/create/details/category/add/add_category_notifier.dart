import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/infrastructure/services/services.dart';
import 'add_category_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class AddCategoryNotifier extends StateNotifier<AddCategoryState> {
  final CatalogFacade _catalogRepository;
  String _title = '';

  AddCategoryNotifier(this._catalogRepository)
      : super(const AddCategoryState());

  Future<void> createCategory(BuildContext context,
      {VoidCallback? success}) async {
    state = state.copyWith(isLoading: true);
    final response = await _catalogRepository.createCategory(
        title: _title, active: state.active);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      failure: (failure, status) {
        debugPrint('===> create category fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  void setTitle(String value) {
    _title = value.trim();
  }
}
