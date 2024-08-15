import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

@RoutePage()
class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.white,
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppHelpers.getTranslation(TrKeys.noInternetConnection),
              style: Style.interSemi(color: Style.black, size: 20),
            ),
            24.verticalSpace,
            CustomButton(
                title: AppHelpers.getTranslation(TrKeys.retry),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
