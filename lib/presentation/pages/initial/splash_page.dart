import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        FlutterNativeSplash.remove();
        ref.read(splashProvider.notifier).checkProfile(
              noConnection: () =>
                  context.replaceRoute(const NoConnectionRoute()),
              goMain: () {
                ref.read(notificationProvider.notifier).fetchCount(context);
                (AppHelpers.getUserRole != TrKeys.master)
                    ? ref.read(shopProvider.notifier).fetchMyShop(
                        afterFetched: () {
                        context.replaceRoute(const MainRoute());
                      })
                    : context.replaceRoute(const MainRoute());
              },
              goLogin: () => context.replaceRoute(const AuthRoute()),
              goBecome: () => context.replaceRoute(const CreateShopRoute()),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.imageSplash, fit: BoxFit.cover);
  }
}
