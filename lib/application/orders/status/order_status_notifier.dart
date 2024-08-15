import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

import 'order_status_state.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';

class OrderStatusNotifier extends StateNotifier<OrderStatusState> {
  final OrdersFacade _ordersRepository;

  OrderStatusNotifier(this._ordersRepository)
      : super(OrderStatusState(textEditingController: TextEditingController()));
  Map<String, dynamic> _title = {};

  setOrder(OrderData? order) {
    _title = {};
    state.textEditingController?.clear();
    int index =
        order?.notes?.indexWhere((element) => element.status == order.status) ??
            -1;
    List<Notes> notes = [];
    if (order?.notes?.isNotEmpty ?? false) {
      if ((order?.notes?.length ?? -1) > index) {
        notes = order?.notes?[index].notes ?? [];
      }
    }

    state = state.copyWith(
      order: order,
      notes: notes,
      locale: LocalStorage.getLanguage()?.locale ?? 'en',
      editIndex: null,
    );
  }

  Future<void> updateStatusNotes(
    BuildContext context, {
    required OrderStatus status,
    VoidCallback? success,
  }) async {
    if (state.editIndex != -1 &&
        state.editIndex != null &&
        (state.textEditingController?.text.isNotEmpty ?? false)) {
      setNote();
    } else if (state.textEditingController?.text.isNotEmpty ?? false) {
      _title[state.locale] = state.textEditingController?.text ?? '';
    }
    if (state.editIndex == null && _title.isEmpty) return;
    state = state.copyWith(isUpdating: true);
    List<Notes> notes = List.from(state.notes);
    if (!_title.containsValue('') && _title.isNotEmpty) {
      notes.add(Notes(title: _title));
    }
    final response = await _ordersRepository.updateStatusNote(
      status: status,
      orderId: state.order?.id,
      notes: notes,
    );
    response.when(
      success: (data) {
        _title = {};
        state.textEditingController?.clear();
        state = state.copyWith(isUpdating: false);
        success?.call();
      },
      failure: (failure, status) {
        debugPrint('===> update order status fail $failure');
        state = state.copyWith(isUpdating: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  setLanguage({required LanguageData language, required int index}) {
    if (state.locale == language.locale) return;
    if (state.editIndex == null || state.editIndex == -1) {
      if (state.textEditingController?.text.isNotEmpty ?? false) {
        _title[state.locale] = state.textEditingController?.text ?? '';
      }
    }
    state.textEditingController?.text = _title[language.locale] ?? '';
    state = state.copyWith(
      locale: language.locale ?? 'en',
      editIndex: state.editIndex == null ? null : -1,
    );
  }

  editNote(int index) {
    state.textEditingController?.text =
        state.notes[index].title?[state.locale] ?? '';
    state = state.copyWith(editIndex: index);
  }

  closeEdit() {
    state.textEditingController?.clear();
    state = state.copyWith(editIndex: -1);
  }

  setNote() {
    if (state.editIndex == null) return;
    if (state.editIndex == -1) return;
    List<Notes> notes = List.from(state.notes);
    notes[state.editIndex!].title?[state.locale] =
        state.textEditingController?.text;
    state.textEditingController?.clear();
    state = state.copyWith(notes: notes, editIndex: -1);
  }
}
