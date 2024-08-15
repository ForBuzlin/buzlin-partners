import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'splash_state.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  final SettingsFacade _settingsRepository;
  final UsersFacade _userRepository;

  SplashNotifier(this._settingsRepository, this._userRepository)
      : super(const SplashState());

  Future<void> fetchCurrencies() async {
    final response = await _settingsRepository.getCurrencies();
    response.when(
      success: (data) {
        int defaultCurrencyIndex = 0;
        final List<CurrencyData> currencies = data.data ?? [];
        for (int i = 0; i < currencies.length; i++) {
          if (currencies[i].isDefault ?? false) {
            defaultCurrencyIndex = i;
            break;
          }
        }
        LocalStorage.setSelectedCurrency(currencies[defaultCurrencyIndex]);
      },
      failure: (failure, status) {
        debugPrint('==> error with fetching currencies $failure');
      },
    );
  }

  Future<void> fetchProfileDetails(ValueChanged<UserData?>? onSuccess,
      VoidCallback goLogin) async {
    final response = await _userRepository.getProfileDetails();
    response.when(
      success: (data) {
        LocalStorage.setUser(data.data);
        onSuccess?.call(data.data);
      },
      failure: (failure, status) {
        if (status == 401) {
          goLogin();
        }
        debugPrint('==> error with fetching profile $failure');
      },
    );
  }

  Future<void> getActiveLanguages(BuildContext context, {
    VoidCallback? goMain,
    VoidCallback? goLogin,
  }) async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      if (LocalStorage
          .getToken()
          .isEmpty) {
        goLogin?.call();
      } else {
        goMain?.call();
      }
    }
  }

  Future<void> checkProfile({
    VoidCallback? noConnection,
    VoidCallback? goMain,
    VoidCallback? goLogin,
    VoidCallback? goBecome,
  }) async {
    if (await AppConnectivity.connectivity()) {
      if (LocalStorage
          .getToken()
          .isNotEmpty) {
        fetchProfileDetails((user) {
          switch (user?.role) {
            case TrKeys.seller:
            case TrKeys.master:
              goMain?.call();
              break;

            default:
              goBecome?.call();
          }
        }, () => goLogin?.call());
      } else {
        goLogin?.call();
      }
      fetchCurrencies();
    } else {
      noConnection?.call();
    }
  }
}
