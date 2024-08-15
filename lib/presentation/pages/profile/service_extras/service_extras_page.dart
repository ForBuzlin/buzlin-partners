import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/application/service_extras/service_extras_notifier.dart';
import 'package:venderuzmart/application/service_extras/service_extras_state.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'widgets/service_extras_item.dart';

@RoutePage()
class ServiceExtrasPage extends ConsumerStatefulWidget {
  const ServiceExtrasPage({super.key});

  @override
  ConsumerState<ServiceExtrasPage> createState() => _ServiceExtrasPageState();
}

class _ServiceExtrasPageState extends ConsumerState<ServiceExtrasPage> {
  late RefreshController categoryController;

  @override
  void initState() {
    categoryController = RefreshController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .read(serviceExtrasProvider.notifier)
            .fetchServices(context: context, isRefresh: true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(serviceExtrasProvider);
    final notifier = ref.read(serviceExtrasProvider.notifier);
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
                      AppHelpers.getTranslation(TrKeys.serviceExtras),
                      style: Style.interNormal(size: 16),
                    ),
                    const Spacer(),
                    SecondButton(
                      title: TrKeys.add,
                      onTap: () {
                        categoryController.resetNoData();
                        context.pushRoute(const AddExtrasRoute());
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
                      itemHeight: 80,
                    )
                  : SmartRefresher(
                      controller: categoryController,
                      enablePullDown: true,
                      enablePullUp: true,
                      onRefresh: () {
                        notifier.fetchServices(
                          context: context,
                          controller: categoryController,
                          isRefresh: true,
                        );
                      },
                      onLoading: () {
                        notifier.fetchServices(
                          context: context,
                          controller: categoryController,
                        );
                      },
                      child: state.extras.isEmpty
                          ? const NoItem(title: TrKeys.noCategories)
                          : _list(state, ref, notifier),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _list(
      ServiceExtrasState state, WidgetRef ref, ServiceExtrasNotifier notifier) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: REdgeInsets.only(
          top: 16,
          bottom: 32,
          left: 12,
          right: 12,
        ),
        shrinkWrap: true,
        itemCount: state.extras.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: AppConstants.animationDuration,
            child: ScaleAnimation(
              scale: 0.5,
              child: FadeInAnimation(
                child: ServiceExtrasItem(
                  extras: state.extras[index],
                  spacing: 10,
                  onTap: () {
                    ref
                        .read(editServiceExtrasProvider.notifier)
                        .setDetails(state.extras[index]);
                    context.pushRoute(const EditExtrasRoute());
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
