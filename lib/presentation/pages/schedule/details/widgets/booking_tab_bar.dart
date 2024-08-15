import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class BookingTabBar extends ConsumerWidget {
  final TabController? tabController;
  final String status;

  const BookingTabBar({
    super.key,
    required this.tabController,
    required this.status,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      height: 48,
      padding: REdgeInsets.symmetric(vertical: 6),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppHelpers.getStatusColor(status),
        ),
        splashBorderRadius: BorderRadius.circular(10.r),
        labelColor: Style.white,
        unselectedLabelColor: Style.black,
        unselectedLabelStyle: Style.interRegular(size: 14),
        labelStyle: Style.interSemi(size: 14),
        indicatorPadding: REdgeInsets.symmetric(horizontal: 2),
        tabs: [
          Tab(child: Text(AppHelpers.getTranslation(TrKeys.info))),
          Tab(child: Text(AppHelpers.getTranslation(TrKeys.notes))),
          Tab(child: Text(AppHelpers.getTranslation(TrKeys.forms))),
          Tab(child: Text(AppHelpers.getTranslation(TrKeys.activity))),
        ],
      ),
    );
  }
}
