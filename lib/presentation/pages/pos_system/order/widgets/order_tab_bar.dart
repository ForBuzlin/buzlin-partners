import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class OrderTabBar extends StatelessWidget {
  final TabController? tabController;
  final ValueChanged<int>? onTap;

  const OrderTabBar({super.key, required this.tabController, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Style.white),
      child: TabBar(
          padding: REdgeInsets.symmetric(horizontal: 12),
          labelPadding: REdgeInsets.symmetric(horizontal: 4),
          controller: tabController,
          indicatorColor: Style.primary,
          labelColor: Style.black,
          unselectedLabelColor: Style.textColor,
          unselectedLabelStyle: Style.interRegular(size: 15),
          labelStyle: Style.interNormal(size: 15),
          onTap: onTap,
          tabs: [
            Tab(
              child: Text(
                AppHelpers.getTranslation(TrKeys.pickup),
                maxLines: 1,
              ),
            ),
            Tab(
              child: Text(
                AppHelpers.getTranslation(TrKeys.delivery),
                maxLines: 1,
              ),
            ),
          ]),
    );
  }
}
