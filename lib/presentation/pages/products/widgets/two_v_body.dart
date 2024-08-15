import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/product_items/products_item.dart';

class TwoVBody extends StatelessWidget {
  final List<ProductData> list;
  final RefreshController refreshController;
  final VoidCallback onLoading;
  final VoidCallback onRefresh;
  final ValueChanged<int> onDelete;
  final Function(RefreshController, ProductData) onEdit;

  const TwoVBody({
   super.key,
    required this.list,
    required this.refreshController,
    required this.onLoading,
    required this.onRefresh,
    required this.onDelete,
    required this.onEdit,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: onRefresh,
          onLoading: onLoading,
          child: AnimationLimiter(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: REdgeInsets.only(
                top: 16,
                bottom: 72.r,
                left: 12,
                right: 12,
              ),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) =>
                  AnimationConfiguration.staggeredList(
                position: index,
                duration: AppConstants.animationDuration,
                child: ScaleAnimation(
                  scale: 0.5,
                  child: FadeInAnimation(
                    child: ProductsItem(
                      product: list[index],
                      spacing: 10,
                      onTap: () => onEdit(refreshController, list[index]),
                      onDelete: () => onDelete(list[index].id ?? 0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
