import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';

import 'profile_state.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  final SettingsFacade _settingsRepository;
  final UsersFacade _userRepository;
  final ShopsFacade _shopsRepository;

  ProfileNotifier(
      this._settingsRepository, this._userRepository, this._shopsRepository)
      : super(const ProfileState());
  int page = 1;

  resetShopData() {
    state = state.copyWith(
        bgImage: "", logoImage: "", addressModel: null, isSaveLoading: false);
  }

  setBgImage(String bgImage) {
    state = state.copyWith(bgImage: bgImage);
  }

  setLogoImage(String logoImage) {
    state = state.copyWith(logoImage: logoImage);
  }

  setAddress(dynamic data) {
    state = state.copyWith(addressModel: data);
  }

  Future<void> fetchUser(BuildContext context,
      {RefreshController? refreshController,
      ValueChanged<UserData?>? onSuccess}) async {
    if (LocalStorage.getToken().isNotEmpty) {
      final connected = await AppConnectivity.connectivity();
      if (connected) {
        if (refreshController == null) {
          state = state.copyWith(isLoading: true);
        }
        final response = await _userRepository.getProfileDetails();
        response.when(
          success: (data) async {
            LocalStorage.setUser(data.data);
            onSuccess?.call(data.data);
            if (refreshController == null) {
              state = state.copyWith(isLoading: false, userData: data.data);
            } else {
              state = state.copyWith(userData: data.data);
            }
            refreshController?.refreshCompleted();
          },
          failure: (failure, status) {
            if (refreshController == null) {
              state = state.copyWith(isLoading: false);
            }
            if (status == 401) {
              context.router.popUntilRoot();
              context.replaceRoute(const AuthRoute());
            }
            AppHelpers.errorSnackBar(context, text: failure);
          },
        );
      } else {
        if (context.mounted) {
          AppHelpers.showNoConnectionSnackBar(context);
        }
      }
    }
  }

  changeIndex(int index) {
    state = state.copyWith(typeIndex: index);
  }

  void setCategoryId(int value) {
    state = state.copyWith(categoryId: value);
  }

  Future<void> createShop({
    required BuildContext context,
    required String tax,
    required String deliveryTo,
    required String deliveryFrom,
    required String deliveryTimeType,
    required String phone,
    required String name,
    required String desc,
    required String deliveryType,
    required AddressData address,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSaveLoading: true);
      String? logoImage;
      String? backgroundImage;
      if (state.logoImage.isNotEmpty) {
        final logoResponse = await _settingsRepository.uploadImage(
          state.logoImage,
          UploadType.shopsLogo,
        );
        logoResponse.when(
          success: (data) {
            logoImage = data.imageData?.title;
          },
          failure: (failure, s) {
            debugPrint('===> upload logo image failure: $failure');
            AppHelpers.errorSnackBar(context, text: failure);
          },
        );
      }
      if (state.bgImage.isNotEmpty) {
        final backgroundResponse = await _settingsRepository.uploadImage(
          state.bgImage,
          UploadType.shopsBack,
        );
        backgroundResponse.when(
          success: (data) {
            backgroundImage = data.imageData?.title;
          },
          failure: (failure, s) {
            debugPrint('===> upload background image failure: $failure');
            AppHelpers.errorSnackBar(context, text: failure);
          },
        );
      }
      final response = await _shopsRepository.createShop(
        logoImage: logoImage,
        backgroundImage: backgroundImage,
        tax: double.tryParse(tax) ?? 0,
        deliveryTo: double.tryParse(deliveryTo) ?? 0,
        deliveryFrom: double.tryParse(deliveryFrom) ?? 0,
        phone: phone,
        deliveryTimeType: deliveryTimeType,
        name: name,
        description: desc,
        address: address,
        deliveryType: deliveryType,
      );
      response.when(
        success: (data) {
          state = state.copyWith(isSaveLoading: false);
          fetchUser(context, refreshController: RefreshController());
          Navigator.pop(context);
        },
        failure: (failure, s) {
          state = state.copyWith(isSaveLoading: false);
          AppHelpers.errorSnackBar(context, text: failure);
          debugPrint('==> create shop failure: $failure');
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.errorSnackBar(
          context,
          text: AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> deleteAccount(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _userRepository.deleteAccount();
      response.when(
        success: (data) async {
          LocalStorage.logout();
          context.router.popUntilRoot();
          context.replaceRoute(const AuthRoute());
          state = const ProfileState();
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

  Future<void> logOut(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      LocalStorage.logout();
      final response = await _userRepository.logOut();
      response.when(
        success: (data) async {
          state = const ProfileState();
        }
        ,
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}
