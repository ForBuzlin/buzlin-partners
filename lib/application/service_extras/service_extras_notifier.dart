import 'dart:async';

import 'service_extras_state.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class ServiceExtrasNotifier extends StateNotifier<ServiceExtrasState> {
  final ServiceExtrasFacade _serviceExtrasRepository;
  int _page = 0;
  int? _masterId;

  ServiceExtrasNotifier(this._serviceExtrasRepository)
      : super(const ServiceExtrasState());

  Future<void> fetchServices({
    required BuildContext context,
    bool? isRefresh,
    RefreshController? controller,
    int? masterId,
  }) async {
    _masterId = masterId ?? _masterId;
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(extras: [], isLoading: true);
    }
    final res = await _serviceExtrasRepository.getExtras(page: ++_page);
    res.when(success: (data) {
      List<ServiceExtrasData> list = List.from(state.extras);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, extras: list);
      if (isRefresh ?? false) {
        controller?.refreshCompleted();
      } else if (data.data?.isEmpty ?? true) {
        controller?.loadNoData();
        return;
      }
      controller?.loadComplete();
      return;
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> deleteService(BuildContext context, int? id) async {
    state = state.copyWith(isLoading: true);
    final response = await _serviceExtrasRepository.deleteExtras(id);
    response.when(
      success: (success) {
        List<ServiceExtrasData> list = List.from(state.extras);
        list.removeWhere((element) => element.id == id);
        state = state.copyWith(extras: list, isLoading: false);
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(
          context,
          text: failure,
        );
      },
    );
  }

  Future<void> addService(ServiceExtrasData? service) async {
    if (service == null) return;
    List<ServiceExtrasData> list = List.from(state.extras);
    int? index;
    for (int i = 0; i < list.length; i++) {
      if (service.id == list[i].id) {
        index = i;
      }
    }
    if (index != null) {
      list[index] = service.copyWith(translation: list[index].translation);
    } else {
      list.add(service);
    }
    state = state.copyWith(extras: list);
  }
}
