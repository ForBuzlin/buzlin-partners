import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class ProductsModal extends ConsumerStatefulWidget {
  const ProductsModal({super.key}) ;

  @override
  ConsumerState<ProductsModal> createState() => _ProductsModalState();
}

class _ProductsModalState extends ConsumerState<ProductsModal> {
  late RefreshController refreshController;

  @override
  void initState() {
    refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.watch(orderProductsProvider).products.isEmpty) {
        ref
            .read(orderProductsProvider.notifier)
            .fetchProducts(cartStocks: [], isRefresh: true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderProductsProvider);
    final notifier = ref.read(orderProductsProvider.notifier);
    return ModalWrap(
      body: Column(
        children: [
          const ModalDrag(),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: TitleAndIcon(
              title: AppHelpers.getTranslation(TrKeys.products),
              titleSize: 16,
            ),
          ),
          8.verticalSpace,
          Expanded(
            child: state.isLoading
                ? const Loading()
                : SmartRefresher(
                    enablePullDown: false,
                    enablePullUp: true,
                    controller: refreshController,
                    onLoading: () {
                      notifier.fetchProducts(
                          refreshController: refreshController, cartStocks: []);
                    },
                    child: SingleChildScrollView(
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: state.products.length,
                            itemBuilder: (context, index) => ProductListItem(
                              product: state.products[index],
                              onTap: () {
                                ref
                                    .read(editStoriesProvider.notifier)
                                    .setProduct(state.products[index]);
                                Navigator.pop(context);
                              },
                              isSelected: ref
                                      .watch(editStoriesProvider)
                                      .selectProduct
                                      ?.id ==
                                  state.products[index].id,
                            ),
                          ),
                          20.verticalSpace,
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
