import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'register_state.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  final AuthFacade _authRepository;
  final UsersFacade _userRepositoryFacade;

  RegisterNotifier(
    this._authRepository,
    this._userRepositoryFacade,
  ) : super(const RegisterState());

  void setPassword(String password) {
    state = state.copyWith(password: password.trim(), isPasswordInvalid: false);
  }

  void setId(String value) {
    state = state.copyWith(verificationId: value.trim());
  }

  void setConfirmPassword(String password) {
    state = state.copyWith(
      confirmPassword: password.trim(),
      isConfirmPasswordInvalid: false,
    );
  }

  void setFirstName(String name) {
    state = state.copyWith(firstName: name.trim());
  }

  void setEmail(String value) {
    state = state.copyWith(email: value.trim(), isEmailInvalid: false);
  }

  void setPhone(String value) {
    state = state.copyWith(
      phone: value.trim(),
    );
  }

  void setLatName(String name) {
    state = state.copyWith(lastName: name.trim());
  }

  // void setReferral(String name) {
  //   state = state.copyWith(referral: name.trim());
  // }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void toggleShowConfirmPassword() {
    state = state.copyWith(showConfirmPassword: !state.showConfirmPassword);
  }

  checkEmail() {
    return AppValidators.isValidEmail(state.email);
  }

  Future<void> sendCode(BuildContext context, VoidCallback onSuccess) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (!AppValidators.isValidEmail(state.email)) {
        state = state.copyWith(isEmailInvalid: true);
        return;
      }
      state = state.copyWith(isLoading: true, isSuccess: false);
      final response = await _authRepository.sigUp(
        email: state.email,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false, isSuccess: true);
          onSuccess();
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

  Future<void> sendCodeToNumber(
      BuildContext context, ValueChanged<String> onSuccess) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false);
      final res = await _authRepository.checkPhone(phone: state.email);
      res.when(success: (success) async {
        if (success == false) {
          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: state.email,
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
                phone: state.email,
                isLoading: false,
                isSuccess: true,
              );
              onSuccess(verificationId);
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
          );
        } else {
          state = state.copyWith(isLoading: false, isSuccess: false);

          AppHelpers.errorSnackBar(
            context,
            text: AppHelpers.getTranslation(TrKeys.userAlready),
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

  Future<void> register(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (!AppValidators.isValidPassword(state.password)) {
        state = state.copyWith(isPasswordInvalid: true);
        return;
      }
      if (AppValidators.isValidConfirmPassword(
              state.password, state.confirmPassword) !=
          null) {
        state = state.copyWith(isConfirmPasswordInvalid: true);
        return;
      }
      state = state.copyWith(isLoading: true);
      final response = await _authRepository.sigUpWithData(
          user: UserData(
              email: state.email,
              firstname: state.firstName,
              lastname: state.lastName,
              phone: state.phone,
              password: state.password,
              confirmPassword: state.confirmPassword,
              referral: state.referral));

      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false);
          LocalStorage.setToken(data.token).whenComplete(() async {
            context.replaceRoute(const CreateShopRoute());
            String? fcmToken = await FirebaseMessaging.instance.getToken();
            _userRepositoryFacade.updateFirebaseToken(fcmToken);
          });
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          AppHelpers.errorSnackBar(context, text: failure);
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> registerWithPhone(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _authRepository.sigUpWithPhone(
          user: UserData(
              email: state.email,
              firstname: state.firstName,
              lastname: state.lastName,
              phone: state.phone,
              password: state.password,
              confirmPassword: state.confirmPassword,
              refreshToken: state.verificationId));

      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false);
          LocalStorage.setToken(data.token).whenComplete(() async {
            context.replaceRoute(const CreateShopRoute());
            String? fcmToken = await FirebaseMessaging.instance.getToken();
            _userRepositoryFacade.updateFirebaseToken(fcmToken);
          });
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          if (status == 400) {
            AppHelpers.errorSnackBar(
              context,
              text: AppHelpers.getTranslation(TrKeys.referralIncorrect),
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
