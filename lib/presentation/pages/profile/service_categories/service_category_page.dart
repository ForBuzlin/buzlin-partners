import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'widgets/category_item.dart';

@RoutePage()
class ServiceCategoryPage extends ConsumerStatefulWidget {
  const ServiceCategoryPage({super.key});

  @override
  ConsumerState<ServiceCategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends ConsumerState<ServiceCategoryPage> {
  late RefreshController categoryController;

  @override
  void initState() {
    categoryController = RefreshController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .read(serviceCategoriesProvider.notifier)
            .fetchAllCategories(context: context, isRefresh: true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryState = ref.watch(serviceCategoriesProvider);
    final notifier = ref.read(serviceCategoriesProvider.notifier);
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
                      AppHelpers.getTranslation(TrKeys.serviceCategories),
                      style: Style.interNormal(size: 16),
                    ),
                    const Spacer(),
                    SecondButton(
                      title: TrKeys.add,
                      onTap: () {
                        categoryController.resetNoData();
                        context.pushRoute(AddCategoryRoute(isService: true));
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
              child: categoryState.isLoading
                  ? const LoadingList(
                      verticalPadding: 16,
                      itemBorderRadius: 12,
                      horizontalPadding: 12,
                      itemPadding: 10,
                      itemHeight: 100,
                    )
                  : SmartRefresher(
                      controller: categoryController,
                      enablePullDown: true,
                      enablePullUp: true,
                      onRefresh: () {
                        notifier.fetchAllCategories(
                          context: context,
                          controller: categoryController,
                          isRefresh: true,
                        );
                      },
                      onLoading: () {
                        notifier.fetchAllCategories(
                          context: context,
                          controller: categoryController,
                        );
                      },
                      child: categoryState.allCategories.isEmpty
                          ? const NoItem(title: TrKeys.noCategories)
                          : _list(categoryState, ref, notifier),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _list(ServiceCategoriesState categoryState, WidgetRef ref,
      ServiceCategoriesNotifier notifier) {
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
        itemCount: categoryState.allCategories.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: AppConstants.animationDuration,
            child: ScaleAnimation(
              scale: 0.5,
              child: FadeInAnimation(
                child: CategoryItem(
                  categoryData: categoryState.allCategories[index],
                  spacing: 10,
                  onEdit: (category) {
                    ref
                        .read(editCategoryProvider.notifier)
                        .setCategoryDetails(category, (category) {
                      ref.read(editCategoryParentProvider.notifier).setInitial(
                          category: category,
                          categories: categoryState.allCategories);
                    });
                    context.pushRoute(EditCategoryRoute(isService: true));
                  },
                  onTap: notifier.onTapParent,
                  selectParents: categoryState.selectParents,
                  selectSubs: categoryState.selectSubs,
                  onTapSub: notifier.onTapSub,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
