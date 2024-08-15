import 'dart:async';

import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';

import 'deliverymen_state.dart';

class DeliverymenNotifier extends StateNotifier<DeliverymenState> {
  final UsersFacade _usersRepository;

  DeliverymenNotifier(this._usersRepository) : super(const DeliverymenState());
  int _page = 0;
  Timer? _timer;
  String _query = '';

  Future<void> fetchDeliverymen({
    RefreshController? refreshController,
    bool isRefresh = false,
  }) async {
    if (isRefresh) {
      _page = 0;
      refreshController?.resetNoData();
      state = state.copyWith(users: [], isLoading: true);
    }
    final response = await _usersRepository.searchUsers(
      page: ++_page,
      role: TrKeys.deliveryman,
      query: _query
    );
    response.when(
      success: (data) {
        List<UserData> list = List.from(state.users);
        list.addAll(data.data ?? []);
        state = state.copyWith(
          isLoading: false,
          users: list,
        );
        if (isRefresh) {
          refreshController?.refreshCompleted();
          return;
        } else if (data.data?.isEmpty ?? true) {
          refreshController?.loadNoData();
          return;
        }
        refreshController?.loadComplete();
        return;
      },
      failure: (failure, status) {
        debugPrint('====> fetch deliverymen fail $failure');
      },
    );
  }

  void setQuery({
    required String query,
  }) {
    if (_query == query) {
      return;
    }
    _query = query.trim();
    if (_query.isNotEmpty) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          fetchDeliverymen(isRefresh: true);
        },
      );
    } else {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          fetchDeliverymen(isRefresh: true);
        },
      );
    }
  }

  addCreatedUser(UserData? user) {
    if (user == null) return;
    List<UserData> users = List.from(state.users);
    users.add(user);
    state = state.copyWith(users: users);
  }

  void setStatusIndex(int? index) {
    state = state.copyWith(statusIndex: index ?? 0);
  }
  Future<void> updateStatus({
    required int? id,
    required String status,
    ValueChanged<int>? onSuccess,
  }) async {
    state=state.copyWith(isUpdate:true);
    final response = await _usersRepository.updateStatus(
      id: id,
      status: status,
    );
    response.when(
      success: (data) {
        state = state.copyWith(statusIndex: -1,isUpdate:false);
        final List statuses = [
          TrKeys.newKey,
          TrKeys.accepted,
          TrKeys.canceled,
          TrKeys.rejected
        ];
        onSuccess?.call(statuses.indexOf(status));
      },
      failure: (failure, status) {
        state=state.copyWith(isUpdate:false);
        debugPrint('===> update master status fail $failure');
      },
    );
  }
}
