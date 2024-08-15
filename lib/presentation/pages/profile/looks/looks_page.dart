import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/application/providers.dart';
import 'widgets/looks_item.dart';

@RoutePage()
class LooksPage extends ConsumerStatefulWidget {
  const LooksPage({super.key}) ;

  @override
  ConsumerState<LooksPage> createState() => _LooksPageState();
}

class _LooksPageState extends ConsumerState<LooksPage> {
  late RefreshController refreshController;

  @override
  void initState() {
    refreshController = RefreshController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(looksProvider.notifier)
          .fetchLooks(context: context, isRefresh: true),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      AppHelpers.getTranslation(TrKeys.looks),
                      style: Style.interNormal(size: 16),
                    ),
                    const Spacer(),
                    SecondButton(
                      title: TrKeys.add,
                      onTap: () {
                        refreshController.resetNoData();
                        context.pushRoute(const AddLooksRoute());
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
              child: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(looksProvider);
                  final notifier = ref.read(looksProvider.notifier);
                  return state.isLoading
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
                          onRefresh: () => notifier.fetchLooks(
                            context: context,
                            isRefresh: true,
                            controller: refreshController,
                          ),
                          onLoading: () => notifier.fetchLooks(
                            context: context,
                            controller: refreshController,
                          ),
                          child: state.looks.isEmpty
                              ? const NoItem(title: TrKeys.noLooks)
                              : AnimationLimiter(
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: REdgeInsets.only(
                                        top: 16,
                                        bottom: 56.r,
                                        left: 12,
                                        right: 12),
                                    shrinkWrap: true,
                                    itemCount: state.looks.length,
                                    itemBuilder: (context, index) =>
                                        AnimationConfiguration.staggeredList(
                                      position: index,
                                      duration: AppConstants.animationDuration,
                                      child: ScaleAnimation(
                                        scale: 0.5,
                                        child: FadeInAnimation(
                                          child: LooksItem(
                                            look: state.looks[index],
                                            spacing: 10,
                                            onTap: () {
                                              refreshController.resetNoData();
                                              ref
                                                  .read(editLooksProvider
                                                      .notifier)
                                                  .setDetails(
                                                    state.looks[index],
                                                  );
                                              context.pushRoute(EditLooksRoute(
                                                  id: state.looks[index].id ??
                                                      0));
                                            },
                                            onDelete: () {
                                              ref
                                                  .read(looksProvider.notifier)
                                                  .deleteDiscount(
                                                    context,
                                                    state.looks[index].id,
                                                  );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
