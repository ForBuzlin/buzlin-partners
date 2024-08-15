import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final AuthFacade _authRepository;
  final UsersFacade _userRepository;

  LoginNotifier(this._authRepository, this._userRepository)
      : super(const LoginState());

  Future<void> loginWithGoogle({
    VoidCallback? checkYourNetwork,
    Function(String)? errorOccurred,
    VoidCallback? loginSuccess,
    VoidCallback? seller,
    VoidCallback? admin,
    VoidCallback? accessDenied,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isGoogleLoading: true);
      GoogleSignInAccount? googleUser;
      try {
        googleUser = await GoogleSignIn().signIn();
      } catch (e) {
        state = state.copyWith(isGoogleLoading: false);
        debugPrint('===> login with google exception: $e');
        if (errorOccurred != null) {
          errorOccurred(e.toString());
        }
        final GoogleSignIn signIn = GoogleSignIn();
        signIn.disconnect();
        signIn.signOut();
      }
      if (googleUser == null) {
        state = state.copyWith(isGoogleLoading: false);
        final GoogleSignIn signIn = GoogleSignIn();
        signIn.disconnect();
        signIn.signOut();
        return;
      }
      final response = await _authRepository.loginWithSocial(
        email: googleUser.email,
        displayName: googleUser.displayName,
        id: googleUser.id,
      );
      response.when(
        success: (data) async {
          if (data.data?.user?.role == 'seller') {
            state = state.copyWith(isGoogleLoading: false);
            seller?.call();
            String? fcmToken = await FirebaseMessaging.instance.getToken();
            _userRepository.updateFirebaseToken(fcmToken);
          } else {
            state = state.copyWith(isGoogleLoading: false);
            accessDenied?.call();
            final GoogleSignIn signIn = GoogleSignIn();
            signIn.disconnect();
            signIn.signOut();
            return;
          }
          await LocalStorage.setToken(data.data?.accessToken ?? '');
          getProfileDetails(() {
            loginSuccess?.call();
          });
          String? fcmToken;
          try {
            fcmToken = await FirebaseMessaging.instance.getToken();
          } catch (e) {
            debugPrint('===> error with getting firebase token $e');
          }
          _userRepository.updateFirebaseToken(fcmToken);
        },
        failure: (failure, status) {
          debugPrint('===> login error google $failure');
          state = state.copyWith(isGoogleLoading: false);
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> getProfileDetails(VoidCallback onSuccess) async {
    final response = await _userRepository.getProfileDetails();
    response.when(
      success: (data) {
        LocalStorage.setUser(data.data);
        onSuccess.call();
      },
      failure: (failure, status) {
        debugPrint('==> get profile details failure: $failure');
      },
    );
  }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void toggleKeepLogin() {
    state = state.copyWith(isKeepLogin: !state.isKeepLogin);
  }

  Future<void> login(
    BuildContext context, {
    required String email,
    required String password,
    VoidCallback? checkYourNetwork,
    VoidCallback? loginSuccess,
    VoidCallback? master,
    VoidCallback? accessDenied,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response =
          await _authRepository.login(email: email, password: password);
      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false);
          switch (data.data?.user?.role) {
            case "seller":
              loginSuccess?.call();
              AppHelpers.successSnackBar(
                context,
                text: AppHelpers.getTranslation(TrKeys.youAreASeller),
              );
              break;
            case "master":
              master?.call();
              AppHelpers.successSnackBar(
                context,
                text: AppHelpers.getTranslation(TrKeys.youAreAMaster),
              );
              break;
            case "admin":
              if (data.data?.user?.shop != null) {
                loginSuccess?.call();
                AppHelpers.successSnackBar(
                  context,
                  text: AppHelpers.getTranslation(TrKeys.youAreAnAdmin),
                );
              } else {
                accessDenied?.call();
                await LocalStorage.setToken(data.data?.accessToken ?? '');
                return;
              }
              break;
            default:
              accessDenied?.call();
              await LocalStorage.setToken(data.data?.accessToken ?? '');
              return;
          }
          await LocalStorage.setToken(data.data?.accessToken ?? '');
          getProfileDetails(() {
            loginSuccess?.call();
          });
          String? fcmToken;
          try {
            fcmToken = await FirebaseMessaging.instance.getToken();
          } catch (e) {
            debugPrint('===> error with getting firebase token $e');
          }
          _userRepository.updateFirebaseToken(fcmToken);
          state = state.copyWith(isLoading: false);
        },
        failure: (failure, status) {
          AppHelpers.errorSnackBar(context, text: failure);
          debugPrint('===> login request failure $failure');
          state = state.copyWith(isLoading: false, isLoginError: true);
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
