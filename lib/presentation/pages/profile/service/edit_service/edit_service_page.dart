import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/pages/profile/service/edit_service/edit_service_body.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import '../../../../component/components.dart';
import 'edit_service_faqs.dart';

@RoutePage()
class EditServicePage extends ConsumerStatefulWidget {
  final int? id;

  const EditServicePage(this.id, {super.key});

  @override
  ConsumerState<EditServicePage> createState() => _EditLooksPageState();
}

class _EditLooksPageState extends ConsumerState<EditServicePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              bottomPadding: 0,
              height: 146,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const PopButton(),
                      Text(
                        AppHelpers.getTranslation(TrKeys.editService),
                        style: Style.interNormal(size: 16),
                      ),
                      const Spacer(),
                      Center(child: Consumer(builder: (context, ref, child) {
                        final status =
                            ref.read(editServiceProvider).serviceData?.status;
                        if (status == null) {
                          return const SizedBox.shrink();
                        } else {
                          return StatusButton(status: status);
                        }
                      })),
                      16.horizontalSpace,
                    ],
                  ),
                  Divider(height: 8.r),
                  Consumer(builder: (context, ref, child) {
                    final state = ref.watch(editServiceProvider);
                    return TabBar(
                      onTap: (index) {
                        if (state.isLoading) {
                          if (_tabController.indexIsChanging) {
                            _tabController.index = _tabController.previousIndex;
                          } else {
                            return;
                          }
                        }
                      },
                      splashBorderRadius:
                          BorderRadius.circular((AppConstants.radius / 1.4).r),
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      controller: _tabController,
                      indicatorPadding: REdgeInsets.symmetric(horizontal: 8),
                      indicatorColor: Style.primary,
                      labelColor: Style.primary,
                      unselectedLabelColor: Style.textColor,
                      unselectedLabelStyle: Style.interRegular(size: 14),
                      labelStyle: Style.interSemi(size: 15),
                      tabs: [
                        Tab(
                            child: Text(
                                AppHelpers.getTranslation(TrKeys.service))),
                        Tab(
                            child:
                                Text(AppHelpers.getTranslation(TrKeys.faqs))),
                      ],
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  EditServiceBody(
                    id: widget.id,
                    onNext: () => _tabController.animateTo(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    ),
                  ),
                  const EditServiceFaqs(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
