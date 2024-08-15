import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/infrastructure/services/services.dart';
import 'users_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class UsersNotifier extends StateNotifier<UsersState> {
  final UsersFacade _usersRepository;
  final SettingsFacade _settingsRepository;
  String _query = '';
  bool _hasMore = true;
  int _page = 0;
  Timer? _timer;
  String _firstName = '';
  String _lastName = '';
  String _phone = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  UsersNotifier(this._usersRepository, this._settingsRepository)
      : super(UsersState(birthday: TextEditingController()));

  Future<void> _search({RefreshController? refreshController}) async {
    refreshController?.resetNoData();
    _page = 0;
    _hasMore = true;
    state = state.copyWith(isLoading: true);
    final response = await _usersRepository.searchUsers(
      query: _query.isEmpty ? null : _query.trim(),
      page: ++_page,
    );
    response.when(
      success: (data) {
        final List<UserData> users = data.data ?? [];
        state = state.copyWith(users: users, isLoading: false);
        _hasMore = users.length >= 14;
      },
      failure: (failure, status) {
        debugPrint('===> search user fail $failure');
        state = state.copyWith(isLoading: false);
      },
    );
  }

  void setQuery({
    RefreshController? refreshController,
    required String text,
  }) {
    if (text.trim() == _query) {
      return;
    }
    _query = text.trim();
    _timer?.cancel();
    _timer = Timer(
      const Duration(milliseconds: 300),
      () {
        _search(refreshController: refreshController);
      },
    );
  }

  Future<void> fetchMoreUsers({RefreshController? refreshController}) async {
    if (!_hasMore) {
      refreshController?.loadNoData();
      return;
    }
    final response = await _usersRepository.searchUsers(
      query: _query.isEmpty ? null : _query.trim(),
      page: ++_page,
    );
    response.when(
      success: (data) {
        final List<UserData> newUsers = data.data ?? [];
        List<UserData> users = List.from(state.users);
        users.addAll(newUsers);
        _hasMore = newUsers.length >= 14;
        state = state.copyWith(users: users);
        refreshController?.loadComplete();
      },
      failure: (failure, status) {
        refreshController?.loadFailed();
        debugPrint('===> fetch more users fail $failure');
      },
    );
  }

  Future<void> refreshUsers({RefreshController? refreshController}) async {
    debugPrint('===> refresh users function called');
    _page = 0;
    final response = await _usersRepository.searchUsers(
      query: _query.isEmpty ? null : _query.trim(),
      page: ++_page,
    );
    response.when(
      success: (data) {
        final List<UserData> users = data.data ?? [];
        state = state.copyWith(users: users);
        _hasMore = users.length >= 14;
        refreshController?.refreshCompleted();
        refreshController?.resetNoData();
      },
      failure: (failure, status) {
        debugPrint('===> refresh users fail $failure');
        refreshController?.refreshFailed();
      },
    );
  }

  Future<void> initialFetchUsers({RefreshController? refreshController}) async {
    _query = '';

    _hasMore = true;
    _page = 0;
    state = state.copyWith(isLoading: true);
    final response = await _usersRepository.searchUsers(
      query: _query.isEmpty ? null : _query.trim(),
      page: ++_page,
    );
    response.when(
      success: (data) {
        final List<UserData> users = data.data ?? [];
        state = state.copyWith(
          users: users,
          isLoading: false,
        );
        _hasMore = users.length >= 14;
      },
      failure: (error, status) {
        debugPrint('====> fetch users fail $error');
        state = state.copyWith(isLoading: false);
      },
    );
  }

  setProfileDetails() {
    state = state.copyWith(gender: LocalStorage.getUser()?.gender ?? "male");
    state.birthday?.text =  DateService.dateFormatDay(LocalStorage.getUser()?.birthday ?? DateTime.now());
    _email = LocalStorage.getUser()?.email ?? '';
    _phone = LocalStorage.getUser()?.phone ?? '';
    _firstName = LocalStorage.getUser()?.firstname ?? '';
    _lastName = LocalStorage.getUser()?.lastname ?? '';
  }

  Future<void> updateProfile(
    BuildContext context, {
    VoidCallback? updated,
    VoidCallback? failed,
  }) async {
    state = state.copyWith(isLoading: true);
    String? imageUrl;
    if (state.imageFile != null) {
      final imageResponse = await _settingsRepository.uploadImage(
        state.imageFile!,
        UploadType.users,
      );
      imageResponse.when(
        success: (data) {
          imageUrl = data.imageData?.title;
        },
        failure: (failure, status) {
          debugPrint('==> upload discount image fail: $failure');
          AppHelpers.errorSnackBar(context, text: failure);
        },
      );
    }

    final response = _password.isNotEmpty && _password == _confirmPassword
        ? await _settingsRepository.updateProfile(
            firstName: _firstName,
            lastName: _lastName,
            email: _email,
            phone: _phone,
            birthday: state.birthday?.text ?? "",
            gender: state.gender ?? "male",
            password: _password,
            confirmPassword: _password,
            image: imageUrl,
          )
        : await _settingsRepository.updateProfile(
            firstName: _firstName,
            lastName: _lastName,
            email: _email,
            phone: _phone,
            birthday: state.birthday?.text ?? "",
            gender: state.gender ?? "male",
            image: imageUrl,
          );
    response.when(
      success: (data) {
        LocalStorage.setUser(data.data);
        state = state.copyWith(imageFile: null);
        state = state.copyWith(isLoading: false);
        updated?.call();
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
        state = state.copyWith(isLoading: false);
        debugPrint('===> discount update fail $failure');
        failed?.call();
      },
    );
  }

  void setActiveIndex(String? value) {
    if (state.gender == value || value == null) {
      return;
    }
    state = state.copyWith(gender: value);
  }

  setSelectUser(UserData user) {
    state = state.copyWith(selectedUser: user);
  }

  void setDate(List<DateTime?> list) {
    if (list.isNotEmpty) {
      state.birthday?.text = DateService.dateFormatDay(list.first);
    }
  }

  void setPhone(String value) {
    _phone = value.trim();
  }

  void setFirstName(String value) {
    _firstName = value.trim();
  }

  void setLastName(String value) {
    _lastName = value.trim();
  }

  void setPassword(String value) {
    _password = value.trim();
  }

  void setEmail(String value) {
    _email = value.trim();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value.trim();
  }

  void setImageFile(String? file) {
    state = state.copyWith(imageFile: file);
  }
// Future<void> setProfileDetails(
//     DiscountData? discount, ValueChanged<DiscountData?> onSuccess) async {
//   state.birthday?.text =  DateService.dateFormatDay(discount?.start ?? DateTime.now());
//
//   state = state.copyWith(
//     discount: discount,
//     type: discount?.type ?? 'fix',
//     active: discount?.active ?? true,
//   );
// }
}
