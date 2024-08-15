import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';

import 'reset_password_state.dart';

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  final AuthFacade _authRepository;

  ResetPasswordNotifier(this._authRepository)
      : super(const ResetPasswordState());

  void setVerifyId(String? value) {
    state = state.copyWith(verifyId: value?.trim() ?? '');
  }

  void setPhone(String? value) {
    state = state.copyWith(phone: value?.trim() ?? '');
  }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void toggleShowConfirmPassword() {
    state = state.copyWith(showConfirmPassword: !state.showConfirmPassword);
  }

  Future<void> sendCodeToNumber(BuildContext context,
      {required String phone}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false);
      final res = await _authRepository.checkPhone(phone: phone);
      res.when(success: (success) async {
        if (success) {
          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: phone,
            verificationCompleted: (PhoneAuthCredential credential) {},
            verificationFailed: (FirebaseAuthException e) {
              AppHelpers.errorSnackBar(
                context,
                text: AppHelpers.getTranslation(e.message ?? ""),
              );
              state = state.copyWith(isLoading: false, isSuccess: false);
            },
            codeSent: (String verificationId, int? resendToken) {
              state = state.copyWith(
                verificationId: verificationId,
                phone: phone,
                isLoading: false,
                isSuccess: true,
              );
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
          );
        } else {
          state = state.copyWith(isLoading: false, isSuccess: false);

          AppHelpers.errorSnackBar(
            context,
            text: AppHelpers.getTranslation(TrKeys.userNotLogin),
          );
        }
      }, failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
      });
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> sendCode(BuildContext context, {required String email}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false);
      final response =
          await _authRepository.forgotPassword(email: email.trim());
      response.when(
        success: (data) async {
          state = state.copyWith(
              email: email,
              verifyId: data.data?.verifyId ?? '',
              isLoading: false,
              isSuccess: true);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false, isSuccess: false);
      AppHelpers.errorSnackBar(context, text: failure);
          debugPrint('==> send otp failure: $failure');
        },
      );
    } else {
      if (context.mounted) {
     AppHelpers.errorSnackBar(context, text: AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),);
      }
    }
  }

  Future<void> setResetPassword(
    BuildContext context, {
    required String password,
    required VoidCallback onSuccess,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false);
      final response = await _authRepository.forgotPasswordConfirmWithPhone(
        password: password,
        phone: state.phone,
        id: state.verifyId,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false, isSuccess: true);
          LocalStorage.setToken(data.token);
          if (data.user?.role == TrKeys.seller) {
            context.replaceRoute(const MainRoute());
          } else {
            context.replaceRoute(const CreateShopRoute());
          }
          onSuccess.call();
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false, isSuccess: false);
          if (status == 400) {
            AppHelpers.errorSnackBar(
              context,
              text: AppHelpers.getTranslation(TrKeys.emailAlreadyExists),
            );
          } else {
           AppHelpers.errorSnackBar(context, text: failure);
          }
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}
