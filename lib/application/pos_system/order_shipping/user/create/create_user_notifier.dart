import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderuzmart/infrastructure/services/services.dart';
import 'create_user_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class CreateUserNotifier extends StateNotifier<CreateUserState> {
  final UsersFacade _usersRepository;
  final SettingsFacade _settingsRepository;
  String _email = '';
  String _phone = '';
  String _firstname = '';
  String _password = '';
  String _title = '';
  String? _lastname;
  String? _description;

  CreateUserNotifier(this._usersRepository, this._settingsRepository)
      : super(const CreateUserState());

  void setTitle(String value) {
    _title = value.trim();
  }
 void setDescription(String value) {
    _description = value.trim();
  }

  void setEmail(String value) {
    _email = value.trim();
  }

  void setPhone(String value) {
    _phone = value.trim();
  }

  void setLastname(String value) {
    _lastname = value.trim();
  }

  void setFirstname(String value) {
    _firstname = value.trim();
  }

  void setPassword(String value) {
    _password = value.trim();
  }

  void setImageFile(String? file) {
    state = state.copyWith(imageFile: file);
  }

  Future<void> createUser(
    BuildContext context, {
    String? role,
    Function(UserData?)? created,
    VoidCallback? success,
  }) async {
    String? imageUrl;
    state = state.copyWith(isLoading: true);
    if (state.imageFile?.isNotEmpty ?? false) {
      final res = await _settingsRepository.uploadImage(
          state.imageFile!, UploadType.users);
      res.when(success: (success) {
        imageUrl = success.imageData?.path;
      }, failure: (failure, success) {
        debugPrint('==> upload service image fail: $failure');
        AppHelpers.errorSnackBar(context, text: failure);
      });
    }
    final response = await _usersRepository.createUser(
        firstname: _firstname,
        lastname: _lastname,
        phone: _phone,
        email: _email,
        title: _title,
        desc: _description,
        role: role,
        image: imageUrl,
        password: _password);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
        created?.call(data.data);
      },
      failure: (error, status) {
        debugPrint('====> create user fail $error');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: error);
      },
    );
  }
}
