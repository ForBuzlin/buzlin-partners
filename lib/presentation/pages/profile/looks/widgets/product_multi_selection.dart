import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class MultiSelectionWidget extends ConsumerStatefulWidget {
  final bool isEdit;

  const MultiSelectionWidget({super.key, this.isEdit = false}) ;

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
      (_) {
        if (ref.watch(orderProductsProvider).products.isEmpty) {
          ref
              .read(orderProductsProvider.notifier)
              .fetchProducts(cartStocks: [], isRefresh: true);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderProductsProvider);
    final notifier = ref.read(orderProductsProvider.notifier);
    final addLookNotifier = ref.read(addLooksProvider.notifier);
    final editLookNotifier = ref.read(editLooksProvider.notifier);
    final addLookState = ref.watch(addLooksProvider);
    final editLookState = ref.watch(editLooksProvider);
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const ModalDrag(),
            Expanded(
              child: state.isLoading
                  ? const Loading()
                  : SmartRefresher(
                      controller: _refreshController,
                      enablePullUp: true,
                      onRefresh: () => notifier.fetchProducts(
                          refreshController: _refreshController,
                          cartStocks: [],
                          isRefresh: true),
                      onLoading: () => notifier.fetchProducts(
                        refreshController: _refreshController,
                        cartStocks: [],
                      ),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.products.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ProductListItem(
                            product: state.products[index],
                            isSelected: widget.isEdit
                                ? editLookState.products.any((element) =>
                                    element.id == state.products[index].id)
                                : addLookState.products.any((element) =>
                                    element.id == state.products[index].id),
                            onTap: () {
                              widget.isEdit
                                  ? editLookNotifier
                                      .setLookProducts(state.products[index])
                                  : addLookNotifier
                                      .setLookProducts(state.products[index]);
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
                    onPressed:() => Navigator.pop(context),
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
