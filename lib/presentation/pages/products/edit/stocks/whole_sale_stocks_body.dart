import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EditWholeSaleStocksBody extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const EditWholeSaleStocksBody({super.key, required this.onNext});

  @override
  ConsumerState<EditWholeSaleStocksBody> createState() =>
      _EditWholeSaleStocksBodyState();
}

class _EditWholeSaleStocksBodyState
    extends ConsumerState<EditWholeSaleStocksBody> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(wholeSaleProvider.notifier).setInitialStocks(
            product: ref.read(editFoodDetailsProvider).product,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(wholeSaleProvider);
    final notifier = ref.read(wholeSaleProvider.notifier);
    final productNotifier = ref.read(productsProvider.notifier);
    final next = ref.watch(editFoodStocksProvider).groups.any((element) =>
        element.type == TrKeys.color ? element.isChecked ?? false : false);
    return (state.product?.digital ?? false)
        ? const SizedBox.shrink()
        : KeyboardDisable(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: state.stocks.length,
                          shrinkWrap: true,
                          padding: REdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Form(
                              key: state.formKeys[index],
                              child: EditableWholeSaleItem(
                                key: UniqueKey(),
                                stock: state.stocks[index],
                                onDeleteStock: (i) => notifier.deleteStock(
                                    index: i, stockIndex: index),
                                onPriceChange: (value, i) =>
                                    notifier.setPrice(
                                        value: value,
                                        index: i,
                                        stockIndex: index),
                                onMinQuantityChange: (value, i) =>
                                    notifier.setMinQuantity(
                                        value: value,
                                        index: i,
                                        stockIndex: index),
                                onMaxQuantityChange: (value, i) =>
                                    notifier.setMaxQuantity(
                                  value: value,
                                  index: i,
                                  stockIndex: index,
                                ),
                                onMinQuantityCheck: (value, i) =>
                                    notifier.minQtyCheck(
                                  value: value,
                                  index: i,
                                  stockIndex: index,
                                ),
                                onMaxQuantityCheck: (value, i) =>
                                    notifier.maxQtyCheck(
                                  value: value,
                                  index: i,
                                  stockIndex: index,
                                ),
                                onAdd: () {
                                  if (state.formKeys[index].currentState
                                          ?.validate() ??
                                      false) {
                                    notifier.addEmptyStock(index);
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(
                    title: AppHelpers.getTranslation(
                        next ? TrKeys.next : TrKeys.save),
                    isLoading: state.isSaving,
                    onPressed: () {
                      if (state.formKeys.every((element) =>
                          element.currentState?.validate() ?? false)) {
                        final product =
                            ref.read(editFoodDetailsProvider).product;
                        notifier.updateStocks(
                          context,
                          uuid: product?.uuid,
                          updated: (newProduct) {
                            productNotifier.updateSingleProduct(newProduct);
                            AppHelpers.successSnackBar(
                              context,
                              text: AppHelpers.getTranslation(
                                  TrKeys.successfullyUpdated),
                            );
                            if (next) {
                              widget.onNext.call();
                            } else {
                              Navigator.pop(context);
                            }
                          },
                        );
                      }
                    },
                  ),
                ),
                24.verticalSpace,
              ],
            ),
          );
  }
}
