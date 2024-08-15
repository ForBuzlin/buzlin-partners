import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/component/product_items/product_items.dart';

class ThreeHBody extends StatelessWidget {
  final List<ProductData> list;
  final RefreshController refreshController;
  final VoidCallback onLoading;
  final VoidCallback onRefresh;
  final Function(RefreshController, ProductData) onEdit;

  const ThreeHBody(
      {super.key,
      required this.list,
      required this.refreshController,
      required this.onLoading,
      required this.onRefresh,
      required this.onEdit})
      ;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      onLoading: onLoading,
      onRefresh: onRefresh,
      child: GridView.builder(
        padding: EdgeInsets.all(16.r),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.8.r,
          crossAxisCount: 3,
          mainAxisExtent: 200.r,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.r),
            child: GridProductItem(
              product: list[index],
              onTap: () => onEdit(refreshController, list[index]),
            ),
          );
        },
      ),
    );
  }
}
