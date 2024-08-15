import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/component/product_items/product_items.dart';

class VerticalListBody extends StatelessWidget {
  final List<ProductData> list;
  final RefreshController refreshController;
  final VoidCallback onLoading;
  final VoidCallback onRefresh;
  final ValueChanged<int> onDelete;
  final Function(RefreshController, ProductData) onEdit;

  const VerticalListBody(
      {super.key,
      required this.list,
      required this.refreshController,
      required this.onLoading,
      required this.onRefresh,
      required this.onDelete,
      required this.onEdit})
      ;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      onLoading: onLoading,
      onRefresh: onRefresh,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(16.r),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return VerticalProductItem(
              product: list[index],
              onTap: () => onEdit(refreshController, list[index]),
              onDelete: () => onDelete(list[index].id ?? 0),
            );
          }),
    );
  }
}
