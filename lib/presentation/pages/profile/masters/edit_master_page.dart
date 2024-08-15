import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'service_masters/service_master.dart';
import 'widgets/edit_master_info.dart';
import 'widgets/working_time.dart';

@RoutePage()
class EditMasterPage extends StatefulWidget {
  final UserData? master;

  const EditMasterPage({super.key, required this.master});

  @override
  State<EditMasterPage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditMasterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Style.black,
          backgroundColor: Style.white,
          elevation: 0.5,
          centerTitle: false,
          leading: const PopButton(),
          title: Text(
            AppHelpers.getTranslation(TrKeys.editMaster),
            style: Style.interNormal(),
          ),
          bottom: TabBar(
            isScrollable: true,
            splashBorderRadius:
                BorderRadius.circular((AppConstants.radius / 1.4).r),
            padding: REdgeInsets.symmetric(horizontal: 8),
            controller: _tabController,
            indicatorPadding: REdgeInsets.symmetric(horizontal: 12),
            indicatorColor: Style.primary,
            labelColor: Style.primary,
            unselectedLabelColor: Style.textColor,
            unselectedLabelStyle: Style.interRegular(size: 15),
            labelStyle: Style.interSemi(size: 15),
            tabs: [
              Tab(child: Text(AppHelpers.getTranslation(TrKeys.info))),
              Tab(child: Text(AppHelpers.getTranslation(TrKeys.workingHours))),
              Tab(child: Text(AppHelpers.getTranslation(TrKeys.serviceMasters))),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            EditMasterInfo(master: widget.master),
            const WorkingTimePage(),
            const ServiceMasterPage(),
          ],
        ),
      ),
    );
  }
}
