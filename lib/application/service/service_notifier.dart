import 'dart:async';
import 'service_state.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class ServiceNotifier extends StateNotifier<ServiceState> {
  final ServiceFacade _serviceRepository;
  int _page = 0;

  ServiceNotifier(this._serviceRepository) : super(const ServiceState());

  Future<void> fetchServices({
    required BuildContext context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(services: [], isLoading: true);
    }
    final res = await _serviceRepository.getServices(page: ++_page,status: TrKeys.accepted);
    res.when(success: (data) {
      List<ServiceData> list = List.from(state.services);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, services: list);
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
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> fetchAllServices({
    required BuildContext context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(allServices: [], isLoading: true);
    }
    final res = await _serviceRepository.getServices(page: ++_page);
    res.when(success: (data) {
      List<ServiceData> list = List.from(state.allServices);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, allServices: list);
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
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  Future<void> deleteService(BuildContext context, int? id) async {
    state = state.copyWith(isLoading: true);
    final response = await _serviceRepository.deleteService(id);
    response.when(
      success: (success) {
        List<ServiceData> allList = List.from(state.allServices);
        List<ServiceData> list = List.from(state.services);
        allList.removeWhere((element) => element.id == id);
        list.removeWhere((element) => element.id == id);
        state = state.copyWith(services: list, allServices: allList);
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

  Future<void> addService(
    ServiceData? service,
  ) async {
    if (service == null) return;
    List<ServiceData> list = List.from(state.services);
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
    state = state.copyWith(services: list);
  }
}
