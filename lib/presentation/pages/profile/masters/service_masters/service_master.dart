import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/pages/profile/edit_shop/widgets/location_button.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'widgets/service_master_item.dart';

@RoutePage()
class ServiceMasterPage extends ConsumerStatefulWidget {
  const ServiceMasterPage({super.key});

  @override
  ConsumerState<ServiceMasterPage> createState() => _ServiceMasterState();
}

class _ServiceMasterState extends ConsumerState<ServiceMasterPage> {
  late RefreshController refreshController;

  @override
  void initState() {
    refreshController = RefreshController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final master = ref.read(editMastersProvider).master;
        ref.read(serviceMasterProvider.notifier).fetchServices(
            context: context, isRefresh: true, masterId: master?.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(serviceMasterProvider);
    final notifier = ref.read(serviceMasterProvider.notifier);
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            AppHelpers.getUserRole == TrKeys.master
                ? CommonAppBar(
                    height: 72,
                    bottomPadding: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const PopButton(),
                        Text(
                          AppHelpers.getTranslation(TrKeys.serviceMasters),
                          style: Style.interNormal(size: 16),
                        ),
                        const Spacer(),
                        SecondButton(
                          title: TrKeys.add,
                          onTap: () {
                            refreshController.resetNoData();
                            context.pushRoute(const AddServiceMasterRoute());
                          },
                          prefix: Icon(
                            Remix.add_line,
                            size: 20.r,
                            color: Style.white,
                          ),
                        ),
                      ],
                    ))
                : Padding(
                    padding: REdgeInsets.only(left: 16, right: 16, top: 12),
                    child: LocationButton(
                        icon: Icons.add,
                        title: TrKeys.add,
                        onTap: () {
                          context.pushRoute(const AddServiceMasterRoute());
                        }),
                  ),
            Expanded(
              child: state.isLoading
                  ? const LoadingList(
                      verticalPadding: 16,
                      itemBorderRadius: 12,
                      horizontalPadding: 12,
                      itemPadding: 10,
                      itemHeight: 100,
                    )
                  : SmartRefresher(
                      controller: refreshController,
                      enablePullDown: true,
                      enablePullUp: true,
                      onRefresh: () => notifier.fetchServices(
                        context: context,
                        isRefresh: true,
                        controller: refreshController,
                      ),
                      onLoading: () => notifier.fetchServices(
                        context: context,
                        controller: refreshController,
                      ),
                      child: state.services.isEmpty
                          ? const NoItem(title: TrKeys.noService)
                          : AnimationLimiter(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: REdgeInsets.only(
                                    top: 16, bottom: 56.r, left: 12, right: 12),
                                shrinkWrap: true,
                                itemCount: state.services.length,
                                itemBuilder: (context, index) =>
                                    AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: AppConstants.animationDuration,
                                  child: ScaleAnimation(
                                    scale: 0.5,
                                    child: FadeInAnimation(
                                      child: ServiceMasterItem(
                                        service: state.services[index],
                                        spacing: 10,
                                        onTap: () {
                                          refreshController.resetNoData();
                                          ref
                                              .read(editServiceMasterProvider
                                                  .notifier)
                                              .setDetails(
                                                state.services[index],
                                              );
                                          context.pushRoute(
                                              EditServiceMasterRoute(
                                                  id: state
                                                          .services[index].id ??
                                                      0));
                                        },
                                        onDelete: () {
                                          notifier.deleteService(
                                            context,
                                            state.services[index].id,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
