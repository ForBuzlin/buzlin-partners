import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:remixicon/remixicon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'widgets/service_item.dart';

@RoutePage()
class ServicePage extends ConsumerStatefulWidget {
  const ServicePage({super.key});

  @override
  ConsumerState<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends ConsumerState<ServicePage> {
  late RefreshController refreshController;

  @override
  void initState() {
    refreshController = RefreshController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .read(serviceProvider.notifier)
            .fetchAllServices(context: context, isRefresh: true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(serviceProvider);
    final notifier = ref.read(serviceProvider.notifier);
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            CommonAppBar(
                height: 72,
                bottomPadding: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const PopButton(),
                    Text(
                      AppHelpers.getTranslation(TrKeys.service),
                      style: Style.interNormal(size: 16),
                    ),
                    const Spacer(),
                    SecondButton(
                      title: TrKeys.add,
                      onTap: () async {
                        refreshController.resetNoData();
                        await context.pushRoute(const AddServiceRoute());
                        if (context.mounted) {
                          ref.read(serviceProvider.notifier).fetchAllServices(
                              context: context, isRefresh: true);
                        }
                      },
                      prefix: Icon(
                        Remix.add_line,
                        size: 20.r,
                        color: Style.white,
                      ),
                    ),
                  ],
                )),
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
                      onRefresh: () => notifier.fetchAllServices(
                        context: context,
                        isRefresh: true,
                        controller: refreshController,
                      ),
                      onLoading: () => notifier.fetchAllServices(
                        context: context,
                        controller: refreshController,
                      ),
                      child: state.allServices.isEmpty
                          ? const NoItem(title: TrKeys.noService)
                          : AnimationLimiter(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: REdgeInsets.only(
                                    top: 16, bottom: 56.r, left: 12, right: 12),
                                shrinkWrap: true,
                                itemCount: state.allServices.length,
                                itemBuilder: (context, index) =>
                                    AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: AppConstants.animationDuration,
                                  child: ScaleAnimation(
                                    scale: 0.5,
                                    child: FadeInAnimation(
                                      child: ServiceItem(
                                        service: state.allServices[index],
                                        spacing: 10,
                                        onTap: () async {
                                          refreshController.resetNoData();
                                          ref
                                              .read(
                                                  editServiceProvider.notifier)
                                              .setDetails(
                                                state.allServices[index],
                                              );
                                          await context.pushRoute(
                                              EditServiceRoute(
                                                  id: state.allServices[index]
                                                          .id ??
                                                      0));
                                          if (context.mounted) {
                                            ref
                                                .read(serviceProvider.notifier)
                                                .fetchAllServices(
                                                    context: context,
                                                    isRefresh: true);
                                          }
                                        },
                                        onDelete: () {
                                          ref
                                              .read(serviceProvider.notifier)
                                              .deleteService(
                                                context,
                                                state.allServices[index].id,
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
