import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/pages/profile/comments/widgets/shop_comments_item.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'widgets/product_comments_list.dart';

@RoutePage()
class CommentsPage extends ConsumerStatefulWidget {
  const CommentsPage({super.key});

  @override
  ConsumerState<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends ConsumerState<CommentsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late RefreshController commentsController;
  late RefreshController productCommentsController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(commentsProvider.notifier)
        ..fetchShopComments(isRefresh: true)
        ..fetchProductComments(isRefresh: true);
    });
    commentsController = RefreshController();
    productCommentsController = RefreshController();
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
        appBar: AppBar(
          foregroundColor: Style.black,
          backgroundColor: Style.white,
          elevation: 0.5,
          centerTitle: false,
          leading: const PopButton(),
          title: Text(AppHelpers.getTranslation(TrKeys.comments)),
          bottom: TabBar(
            splashBorderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
            padding: REdgeInsets.symmetric(horizontal: 12),
            controller: _tabController,
            indicatorPadding: REdgeInsets.symmetric(horizontal: 12),
            indicatorColor: Style.primary,
            labelColor: Style.primary,
            unselectedLabelColor: Style.textColor,
            unselectedLabelStyle: Style.interRegular(size: 15),
            labelStyle: Style.interSemi(size: 15),
            tabs: [
              Tab(
                  child: AutoSizeText(
                AppHelpers.getTranslation(TrKeys.shopComments),
                maxLines: 1,
              )),
              Tab(
                  child: AutoSizeText(
                      AppHelpers.getTranslation(TrKeys.productComments),
                      maxLines: 1)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final commentsState = ref.watch(commentsProvider);
                return commentsState.isLoading
                    ? const LoadingList(
                        verticalPadding: 16,
                        itemBorderRadius: 12,
                        horizontalPadding: 12,
                        itemPadding: 10,
                        itemHeight: 100,
                      )
                    : SmartRefresher(
                        controller: commentsController,
                        enablePullDown: true,
                        enablePullUp: true,
                        onRefresh: () {
                          ref.read(commentsProvider.notifier).fetchShopComments(
                                context: context,
                                controller: commentsController,
                                isRefresh: true,
                              );
                        },
                        onLoading: () {
                          ref.read(commentsProvider.notifier).fetchShopComments(
                                context: context,
                                controller: commentsController,
                              );
                        },
                        child: commentsState.shopComments.isEmpty
                            ? const NoItem(title: TrKeys.noComments)
                            : AnimationLimiter(
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: REdgeInsets.only(
                                      top: 16,
                                      bottom: 32,
                                      left: 12,
                                      right: 12,
                                    ),
                                    shrinkWrap: true,
                                    itemCount:
                                        commentsState.shopComments.length,
                                    itemBuilder: (context, index) {
                                      return AnimationConfiguration
                                          .staggeredList(
                                        position: index,
                                        duration:
                                            AppConstants.animationDuration,
                                        child: ScaleAnimation(
                                          scale: 0.5,
                                          child: FadeInAnimation(
                                            child: ShopCommentsItem(
                                              shopCommentsData: commentsState
                                                  .shopComments[index],
                                              spacing: 10,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                      );
              },
            ),
            ProductCommentsList(commentsController: productCommentsController),
          ],
        ),
      ),
    );
  }
}
