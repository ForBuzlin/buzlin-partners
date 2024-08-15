import 'package:venderuzmart/application/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class PosFilterModal extends StatelessWidget {
  const PosFilterModal({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: BlurWrap(
        radius: BorderRadius.only(
          topRight: Radius.circular(24.r),
          topLeft: Radius.circular(24.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Style.bg,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24.r),
              topLeft: Radius.circular(24.r),
            ),
          ),
          child: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(filterProvider);
              final notifier = ref.read(filterProvider.notifier);
              final productsNotifier = ref.read(orderProductsProvider.notifier);
              return Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.paddingOf(context).bottom + 8.r,
                        left: 16.r,
                        right: 16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ModalDrag(),
                        TitleScreen(
                          onTap: () {
                            notifier.clearFilter();
                            notifier.fetchExtras(
                                context: context, isPrice: true);
                          },
                        ),
                        24.verticalSpace,
                        if (state.filter?.brands?.isNotEmpty ?? false)
                          Padding(
                            padding: EdgeInsets.only(top: 8.r),
                            child: BrandScreen(
                              list: state.brands ?? [],
                              brandes: state.filter?.brands ?? [],
                              onChange: (int value) {
                                notifier
                                  ..setBrands(value)
                                  ..fetchExtras(
                                      context: context, isPrice: true);
                              },
                            ),
                          ),
                        if (state.filter?.categories?.isNotEmpty ?? false)
                          Padding(
                            padding: EdgeInsets.only(top: 8.r),
                            child: CategoryFilter(
                              categories: state.filter?.categories ?? [],
                              list: state.categories ?? [],
                              onChange: (int value) {
                                notifier
                                  ..setCategory(value)
                                  ..fetchExtras(
                                      context: context, isPrice: true);
                              },
                            ),
                          ),
                        8.verticalSpace,
                        ExtrasScreen(
                          group: state.filter?.group ?? [],
                          listExtras: state.extras ?? [],
                          onChange: (int value) {
                            notifier
                              ..setExtras(value)
                              ..fetchExtras(context: context, isPrice: true);
                          },
                        ),
                        if (state.filterPrices?.max !=
                                state.filterPrices?.min &&
                            state.rangeValues != null)
                          RangePrice(
                            onChange: (RangeValues value) {
                              notifier.setRangePrice(value);
                              final delayed = Delayed(milliseconds: 700);

                              delayed.run(() {
                                notifier.fetchExtras(
                                  context: context,
                                  isPrice: false,
                                );
                              });
                            },
                            filterPrices: state.filterPrices,
                            rangeValues: state.rangeValues,
                            prices: state.prices,
                          ),
                        24.verticalSpace,
                        CustomButton(
                            title:
                                "${AppHelpers.getTranslation(TrKeys.view)} ${state.filter?.count ?? 0} ${AppHelpers.getTranslation(TrKeys.products)}",
                            background: Style.primary,
                            textColor: Style.white,
                            onPressed: () {
                              final bagIndex =
                                  ref.watch(orderCartProvider).selectedBagIndex;
                              productsNotifier.fetchProducts(
                                isRefresh: true,
                                brandIds: state.brands,
                                categoryIds: state.categories,
                                extrasId: state.extras,
                                priceFrom: state.filterPrices?.min,
                                priceTo: state.filterPrices?.max,
                                cartStocks: LocalStorage.getBags()[bagIndex]
                                        .bagProducts ??
                                    [],
                                // isMostSaleProduct: state.type == "most_sold",
                                // isNewProduct: state.type == "news_letter",
                              );
                              Navigator.pop(context);
                            }),
                      ],
                    ),
                  ),
                  if (state.isLoading) const CustomLoading(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}
