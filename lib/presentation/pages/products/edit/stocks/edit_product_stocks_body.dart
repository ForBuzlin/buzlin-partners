import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'edit_group_extras_modal.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EditProductStocksBody extends ConsumerStatefulWidget {
  final VoidCallback onNext;

  const EditProductStocksBody({super.key, required this.onNext});

  @override
  ConsumerState<EditProductStocksBody> createState() =>
      _EditFoodStocksBodyState();
}

class _EditFoodStocksBodyState extends ConsumerState<EditProductStocksBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(editFoodStocksProvider.notifier).setInitialStocks(
          product: ref.read(editFoodDetailsProvider).product,
          groups: ref.read(productExtrasProvider).groups),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(editFoodStocksProvider);
          final notifier = ref.read(editFoodStocksProvider.notifier);
          final productNotifier = ref.read(productsProvider.notifier);
          final detailState = ref.watch(editFoodDetailsProvider);
          final product = ref.read(editFoodDetailsProvider).product;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              if (!detailState.digital)
                SizedBox(
                  height: 60.r,
                  child: state.isFetchingGroups
                      ? const Loading()
                      : ListView.builder(
                          itemCount: state.groups.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: REdgeInsets.symmetric(horizontal: 16),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ExtrasItem(
                              extras: state.groups[index],
                              onTap: () {
                                notifier.toggleCheckedGroup(index);
                                AppHelpers.showCustomModalBottomSheet(
                                  paddingTop:
                                      MediaQuery.paddingOf(context).top + 150,
                                  context: context,
                                  radius: 12,
                                  modal:
                                      EditGroupExtrasModal(groupIndex: index),
                                );
                              },
                            );
                          },
                        ),
                ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (detailState.digital) const HorizontalFilePicker(),
                        ListView.builder(
                          itemCount: state.stocks.length,
                          shrinkWrap: true,
                          padding: REdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return EditableFoodStockItem(
                              key: UniqueKey(),
                              isDeletable: index != 0,
                              stock: state.stocks[index],
                              onDeleteStock: () => notifier.deleteStock(index),
                              onPriceChange: (value) =>
                                  notifier.setPrice(value: value, index: index),
                              onQuantityChange: (value) => notifier.setQuantity(
                                  value: value, index: index),
                              onSkuChange: (value) =>
                                  notifier.setSku(value: value, index: index),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  title: AppHelpers.getTranslation(
                    product?.digital ?? false ? TrKeys.save : TrKeys.next,
                  ),
                  isLoading: state.isSaving,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      if (product?.digital ?? false) {
                        if (ref.read(convertProvider).file == null &&
                            product?.digitalFile == null) {
                          AppHelpers.errorSnackBar(context,
                              text: TrKeys.pleaseUpload);
                          return;
                        } else {
                          ref
                              .read(convertProvider.notifier)
                              .uploadFile(context, productId: product?.id);
                        }
                      }
                      notifier.updateStocks(
                        context,
                        uuid: product?.uuid,
                        updated: (newProduct) {
                          ref
                              .read(editFoodDetailsProvider.notifier)
                              .setStocks(newProduct?.stocks);
                          productNotifier.updateSingleProduct(newProduct);
                          AppHelpers.successSnackBar(
                            context,
                            text: AppHelpers.getTranslation(
                                TrKeys.successfullyUpdated),
                          );
                          if (product?.digital ?? false) {
                            Navigator.pop(context);
                          } else {
                            widget.onNext.call();
                          }
                        },
                      );
                    }
                  },
                ),
              ),
              24.verticalSpace,
            ],
          );
        },
      ),
    );
  }
}
