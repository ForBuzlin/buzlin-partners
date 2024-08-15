import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'package:venderuzmart/application/providers.dart';
import '../../../../component/components.dart';
import 'comment_item.dart';

class ProductCommentsList extends StatelessWidget {
  const ProductCommentsList({
    super.key,
    required this.commentsController,
  });

  final RefreshController commentsController;

  @override
  Widget build(BuildContext context) {
    return Consumer(
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
                  ref.read(commentsProvider.notifier).fetchProductComments(
                        context: context,
                        controller: commentsController,
                        isRefresh: true,
                      );
                },
                onLoading: () {
                  ref.read(commentsProvider.notifier).fetchProductComments(
                        context: context,
                        controller: commentsController,
                      );
                },
                child: commentsState.productComments.isEmpty
                    ? const NoItem(title: TrKeys.noComments)
                    : AnimationLimiter(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: REdgeInsets.only(
                              top: 16,
                              bottom: 32,
                              left: 12,
                              right: 12,
                            ),
                            shrinkWrap: true,
                            itemCount: commentsState.productComments.length,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: AppConstants.animationDuration,
                                child: ScaleAnimation(
                                  scale: 0.5,
                                  child: FadeInAnimation(
                                    child: CommentItem(
                                      commentsData:
                                          commentsState.productComments[index],
                                      spacing: 10,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
              );
      },
    );
  }
}
