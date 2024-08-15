import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class NoItem extends StatelessWidget {
  final String? title;

  const NoItem({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Lottie.asset(Assets.lottieEmpty)),
          8.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 24),
            child: Text(
              AppHelpers.getTranslation(title ?? TrKeys.noData),
              style: Style.interNormal(size: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
