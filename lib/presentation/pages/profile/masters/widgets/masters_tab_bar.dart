import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MastersTabBar extends StatelessWidget {
  final TabController? tabController;

  const MastersTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        labelPadding: REdgeInsets.symmetric(horizontal: 4),
        controller: tabController,
        indicatorColor: Style.primary,
        labelColor: Style.black,
        unselectedLabelColor: Style.textColor,
        unselectedLabelStyle: Style.interRegular(size: 13),
        labelStyle: Style.interNormal(size: 13),
        tabs: [
          Tab(
            child: AutoSizeText(
              AppHelpers.getTranslation(TrKeys.newKey),
              maxLines: 1,
              minFontSize: 8,
            ),
          ),
          Tab(
            child: AutoSizeText(
              AppHelpers.getTranslation(TrKeys.accepted),
              maxLines: 1,
              minFontSize: 8,
            ),
          ),
          Tab(
            child: AutoSizeText(
              AppHelpers.getTranslation(TrKeys.canceled),
              maxLines: 1,
              minFontSize: 8,
            ),
          ),
          Tab(
            child: AutoSizeText(
              AppHelpers.getTranslation(TrKeys.rejected),
              maxLines: 1,
              minFontSize: 8,
            ),
          ),
        ]);
  }
}
