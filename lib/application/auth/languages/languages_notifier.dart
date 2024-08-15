import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'languages_state.dart';

class LanguagesNotifier extends StateNotifier<LanguagesState> {
  final SettingsFacade _settingsRepository;

  LanguagesNotifier(this._settingsRepository) : super(const LanguagesState());

  Future<void> checkLanguage(BuildContext context) async {
    final lang = LocalStorage.getLanguage();
    if (lang == null) {
      state = state.copyWith(isSelectLanguage: false);
    } else {
      final connect = await AppConnectivity.connectivity();
      if (connect) {
        final response = await _settingsRepository.getLanguages();
        response.when(
          success: (data) {
            state = state.copyWith(languages: data.data ?? []);
            final List<LanguageData> languages = data.data ?? [];
            for (int i = 0; i < languages.length; i++) {
              if (languages[i].id == lang.id) {
                state = state.copyWith(
                  isSelectLanguage: true,
                );
                break;
              }
            }
          },
          failure: (failure, status) {
            state = state.copyWith(isSelectLanguage: false);
            AppHelpers.errorSnackBar(
              context,
              text: AppHelpers.getTranslation(failure),
            );
          },
        );
      } else {
        if (context.mounted) {
          AppHelpers.showNoConnectionSnackBar(context);
        }
      }
    }
  }

  Future<void> getLanguages(BuildContext context) async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      state = state.copyWith(isLoading: true, isSelectLanguage: false);
      final response = await _settingsRepository.getLanguages();
      response.when(
        success: (data) {
          final List<LanguageData> languages = data.data ?? [];
          final lang = LocalStorage.getLanguage();
          int index = 0;
          for (int i = 0; i < languages.length; i++) {
            if (languages[i].id == lang?.id) {
              index = i;
              break;
            }
          }
          state = state.copyWith(
            isLoading: false,
            languages: data.data ?? [],
            index: index,
          );
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

  Future<void> change(int index, {VoidCallback? afterUpdate}) async {
    state = state.copyWith(index: index);
    await LocalStorage.setLanguageData(state.languages[index]);
    await LocalStorage.setLangLtr(state.languages[index].backward);
    final map = await LocalStorage.getOtherTranslations(
        key: state.languages[index].id.toString());
    await LocalStorage.setTranslations(map);
    afterUpdate?.call();
  }
}
