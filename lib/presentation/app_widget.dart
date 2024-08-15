import 'package:venderuzmart/infrastructure/repository/repositories.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_isolate/flutter_isolate.dart';

// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import 'styles/theme/light_theme.dart';
import 'styles/theme/theme/theme.dart';
import 'styles/style.dart';

@pragma('vm:entry-point')
Future<int> getOtherTranslation(int arg) async {
  final settingsRepository = SettingsRepository();
  final res = await settingsRepository.getLanguages();
  res.when(
      success: (l) async {
        for (int i = 0; i < (l.data?.length ?? 0); i++) {
          await settingsRepository.getTranslations(
              lang: l.data?[i].locale, id: l.data?[i].id);
        }
      },
      failure: (f, s) => null);
  return 0;
}

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  Future isolate() async {
    return await FlutterIsolate.spawn(getOtherTranslation, 0);
  }

  @override
  void initState() {
    if (LocalStorage.getTranslations().isNotEmpty) {
      fetchSettingNoAwait();
    }
    isolate();
    super.initState();
  }

  Future fetchSetting() async {
    final connect = await Connectivity().checkConnectivity();
    if (connect == ConnectivityResult.wifi ||
        connect == ConnectivityResult.mobile) {
      settingsRepository.getGlobalSettings();
      await settingsRepository.getLanguages();
      await settingsRepository.getTranslations();
      if (LocalStorage.getSelectedCurrency() == null) {
        settingsRepository.getCurrencies();
      }
    }
  }

  Future fetchSettingNoAwait() async {
    settingsRepository.getGlobalSettings();
    settingsRepository.getLanguages();
    settingsRepository.getTranslations();
    if (LocalStorage.getSelectedCurrency() == null) {
      settingsRepository.getCurrencies();
    }
  }

  final _rootRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait({
          AppTheme.create,
          if (LocalStorage.getTranslations().isEmpty) fetchSetting(),
        }),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            final AppTheme theme = snapshot.data?[0];
            return ScreenUtilInit(
              useInheritedMediaQuery: true,
              designSize: const Size(375, 812),
              builder: (context, child) => RefreshConfiguration(
                footerBuilder: () => const ClassicFooter(
                  idleIcon: SizedBox.shrink(),
                  idleText: '',
                  noDataText: '',
                  noMoreIcon: null,
                  loadingText: '',
                  loadingIcon: Loading(size: 26),
                  loadStyle: LoadStyle.ShowWhenLoading,
                ),
                headerBuilder: () => const WaterDropMaterialHeader(
                  backgroundColor: Style.white,
                  distance: 30,
                  color: Style.black,
                ),
                child: ChangeNotifierProvider(
                  create: (BuildContext context) => theme,
                  child: MaterialApp.router(
                    title: AppHelpers.getAppName(),
                    debugShowCheckedModeBanner: false,
                    routerConfig: _rootRouter.config(),
                    locale: Locale(LocalStorage.getLanguage()?.locale ?? 'en'),
                    themeMode: ThemeMode.light,
                    theme: lightTheme(),
                    builder: (context, child) => ScrollConfiguration(
                        behavior: CustomBehavior(), child: child!),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
