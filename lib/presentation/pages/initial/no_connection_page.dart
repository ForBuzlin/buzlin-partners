import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';

@RoutePage()
class NoConnectionPage extends ConsumerWidget {
  const NoConnectionPage({super.key}) ;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Style.white,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            24.verticalSpace,
            const Icon(
              Remix.wifi_off_fill,
              size: 120,
              color: Style.black,
            ),
            Text(
              AppHelpers.getTranslation(TrKeys.noInternetConnection),
              style: Style.interNormal(size: 16),
              textAlign: TextAlign.center,
            ),
            CustomButton(
                icon: Icon(
                  Remix.restart_fill,
                  color: Style.white,
                  size: 32.r,
                ),
                title: TrKeys.restart,
                onPressed: () {
                  context.replaceRoute(const SplashRoute());
                }),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }
}
