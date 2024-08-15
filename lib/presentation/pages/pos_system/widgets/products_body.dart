import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';

class ProductsBody extends StatelessWidget {
  final RefreshController refreshController;
  final int bottomPadding;
  final bool isLoading;
  final int itemSpacing;
  final List<ProductData> products;
  final ValueChanged<ProductData> onProductTap;
  final VoidCallback onLoading;
  final VoidCallback onRefreshing;
  final int loadingHeight;
  final ScrollPhysics scrollPhysics;

  const ProductsBody({
   super.key,
    required this.refreshController,
    required this.isLoading,
    required this.products,
    required this.onProductTap,
    required this.onLoading,
    required this.onRefreshing,
    this.itemSpacing = 1,
    this.bottomPadding = 100,
    this.loadingHeight = 188,
    this.scrollPhysics = const BouncingScrollPhysics(),
  }) ;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingGrid(
            verticalPadding: 16,
            itemBorderRadius: 12,
            itemHeight: 224,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            horizontalPadding: 12,
          )
        : AnimationLimiter(
            child: SmartRefresher(
              controller: refreshController,
              physics: scrollPhysics,
              enablePullDown: true,
              enablePullUp: true,
              onLoading: onLoading,
              onRefresh: onRefreshing,
              child: products.isEmpty
                  ? const NoItem(title: TrKeys.noProducts)
                  : GridView.builder(
                      padding: REdgeInsets.only(
                        top: 16,
                        bottom: bottomPadding.r,
                        left: 12,
                        right: 12,
                      ),
                      itemCount: products.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.r,
                        crossAxisSpacing: 8.r,
                        mainAxisExtent: 224.r,
                        childAspectRatio: 0.76,
                      ),
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredGrid(
                          columnCount: products.length,
                          position: index,
                          duration: AppConstants.animationDuration,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: OrderFoodItem(
                                product: products[index],
                                onTap: () => onProductTap(products[index]),
                                spacing: itemSpacing,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          );
  }
}
