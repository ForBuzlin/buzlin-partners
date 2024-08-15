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
import 'widgets/stories_item.dart';

@RoutePage()
class StoriesPage extends ConsumerStatefulWidget {
  const StoriesPage({super.key}) ;

  @override
  ConsumerState<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends ConsumerState<StoriesPage> {
  late RefreshController controller;

  @override
  void initState() {
    controller = RefreshController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(storiesProvider.notifier)
          .fetchStories(context: context, isRefresh: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(storiesProvider);
    final notifier = ref.read(storiesProvider.notifier);
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
                      AppHelpers.getTranslation(TrKeys.stories),
                      style: Style.interNormal(size: 16),
                    ),
                    const Spacer(),
                    SecondButton(
                      title: TrKeys.add,
                      onTap: () {
                        controller.resetNoData();
                        context.pushRoute(const CreateStoriesRoute());
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
                      controller: controller,
                      enablePullDown: true,
                      enablePullUp: true,
                      onRefresh: () => notifier.fetchStories(
                          controller: controller, isRefresh: true),
                      onLoading: () =>
                          notifier.fetchStories(controller: controller),
                      child: state.stories.isEmpty
                          ? const NoItem(title: TrKeys.noStories)
                          : AnimationLimiter(
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: REdgeInsets.only(
                                    top: 16, bottom: 56.r, left: 12, right: 12),
                                shrinkWrap: true,
                                itemCount: state.stories.length,
                                itemBuilder: (context, index) =>
                                    AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: AppConstants.animationDuration,
                                  child: ScaleAnimation(
                                    scale: 0.5,
                                    child: FadeInAnimation(
                                      child: StoriesItem(
                                        stories: state.stories[index],
                                        spacing: 10,
                                        onEdit: () {
                                          controller.resetNoData();
                                          ref
                                              .read(
                                                  editStoriesProvider.notifier)
                                              .setStoryDetails(
                                                  state.stories[index]);
                                          context.pushRoute(
                                              EditStoriesRoute(onSave: () {}));
                                        },
                                        onDelete: () {
                                          AppHelpers.showCustomModalBottomSheet(
                                              context: context,
                                              modal: DeleteModal(onDelete: () {
                                                notifier.deleteStories(
                                                    context: context,
                                                    id: state
                                                        .stories[index].id);
                                              }));
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
