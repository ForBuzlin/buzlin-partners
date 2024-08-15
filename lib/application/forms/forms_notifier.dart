import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'forms_state.dart';

class FormNotifier extends StateNotifier<FormOptionState> {
  final FormOptionFacade _formRepository;

  int _page = 0;

  int _parentPage = 0;

  FormNotifier(this._formRepository) : super(const FormOptionState());

  fetchForms({
    BuildContext? context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(list: [], isLoading: true, parentForms: []);
    }
    final res = await _formRepository.getFormOptions(
      page: ++_page,
    );
    res.when(success: (data) {
      List<FormOptionsData> list = List.from(state.list);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, list: list);
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
      debugPrint(" ==> fetch forms fail: $failure");
      if (context != null) {
        AppHelpers.errorSnackBar(context, text: failure);
      }
    });
  }

  fetchParentForms({
    BuildContext? context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (state.parentForms.isNotEmpty) return;
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _parentPage = 0;
      state = state.copyWith(parentForms: [], isParentLoading: true);
    }
    final res = await _formRepository.getFormParents(
      page: ++_parentPage,
    );
    res.when(success: (data) {
      List<FormOptionsData> list = List.from(state.parentForms);
      list.addAll(data.data ?? []);
      state = state.copyWith(isParentLoading: false, parentForms: list);
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
      state = state.copyWith(isParentLoading: false);
      debugPrint(" ==> fetch parent forms fail: $failure");
      if (context != null) {
        AppHelpers.errorSnackBar(context, text: failure);
      }
    });
  }

  Future<void> deleteForm(BuildContext context, int? id) async {
    state = state.copyWith(isLoading: true);
    final response = await _formRepository.deleteFormOption(id);
    response.when(
      success: (success) {
        List<FormOptionsData> list = List.from(state.list);
        list.removeWhere((element) => element.id == id);
        state = state.copyWith(list: list);
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(
          context,
          text: failure,
        );
      },
    );
    state = state.copyWith(isLoading: false);
  }
}
