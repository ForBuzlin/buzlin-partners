import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/component/components.dart';

import 'product_selection_item.dart';

class MultiSelectionWidget extends ConsumerStatefulWidget {
  final bool isEdit;

  const MultiSelectionWidget({super.key, this.isEdit = false});

  @override
  ConsumerState<MultiSelectionWidget> createState() =>
      _MultiSelectionWidgetState();
}

class _MultiSelectionWidgetState extends ConsumerState<MultiSelectionWidget> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(stockProvider.notifier).initialFetchStocks(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final stockState = ref.watch(stockProvider);
    final stockEvent = ref.read(stockProvider.notifier);
    final addDiscountEvent = ref.read(addDiscountProvider.notifier);
    final editDiscountEvent = ref.read(editDiscountProvider.notifier);
    final addDiscountState = ref.watch(addDiscountProvider);
    final editDiscountState = ref.watch(editDiscountProvider);
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const ModalDrag(),
            Expanded(
              child: stockState.isLoading
                  ? const Loading()
                  : SmartRefresher(
                      controller: _refreshController,
                      enablePullUp: true,
                      onRefresh: () => stockEvent.refreshStocks(
                        refreshController: _refreshController,
                      ),
                      onLoading: () => stockEvent.fetchMoreStocks(
                        refreshController: _refreshController,
                      ),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: stockState.stocks.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return FoodProductItem(
                            stockData: stockState.stocks[index],
                            isSelected: widget.isEdit
                                ? editDiscountState.stocks.any((element) =>
                                    element.id == stockState.stocks[index].id)
                                : addDiscountState.stocks.any((element) =>
                                    element.id == stockState.stocks[index].id),
                            onTap: () {
                              widget.isEdit
                                  ? editDiscountEvent.setDiscountProducts(
                                      stockState.stocks[index])
                                  : addDiscountEvent.setDiscountProducts(
                                      stockState.stocks[index]);
                            },
                          );
                        },
                      ),
                    ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    height: 54,
                    title: AppHelpers.getTranslation(TrKeys.save),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
