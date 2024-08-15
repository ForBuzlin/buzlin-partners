import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:remixicon/remixicon.dart';
import 'package:auto_route/auto_route.dart';
import 'widgets/product_details_modal.dart';
import 'widgets/replace_product_body.dart';
import 'package:flutter/material.dart';
import 'widgets/note_dialog.dart';

@RoutePage()
class ReplaceProductPage extends ConsumerStatefulWidget {
  const ReplaceProductPage({super.key});

  @override
  ConsumerState<ReplaceProductPage> createState() => _ReplaceProductPageState();
}

class _ReplaceProductPageState extends ConsumerState<ReplaceProductPage> {
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
  Widget build(BuildContext context) {
    final productsState = ref.watch(orderProductsProvider);
    final replaceState = ref.watch(orderDetailsProvider);
    final notifier = ref.read(orderProductsProvider.notifier);
    final replaceNotifier = ref.read(orderDetailsProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          CustomAppBar(
            height: replaceState.stocks == null ? 192 : 304,
            bottomPadding: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const PopButton(),
                    Text(AppHelpers.getTranslation(TrKeys.replaceProduct))
                  ],
                ),
                _stockItem(replaceState.oldStocks),
                _stockItem(replaceState.stocks, isReplace: true),
              ],
            ),
          ),
          Expanded(
              child: ReplaceProductsBody(
            isLoading: productsState.isLoading,
            products: productsState.products,
            refreshController: refreshController,
            onRefreshing: () {
              notifier.fetchProducts(
                refreshController: refreshController,
                isRefresh: true,
                cartStocks: [],
              );
            },
            onLoading: () {
              notifier.fetchProducts(
                refreshController: refreshController,
                cartStocks: [],
              );
            },
            onProductTap: (product) {
              final stock = product.stocks ?? [Stocks()];
              AppHelpers.showCustomModalBottomDragSheet(
                paddingTop: 60,
                context: context,
                maxChildSize: 0.8,
                initSize: (stock.first.extras?.length ?? 0) > 2
                    ? 0.8
                    : (stock.first.extras?.length ?? 0) > 1
                        ? 0.7
                        : (stock.first.extras?.length ?? 0) == 1
                            ? 0.56
                            : 0.46,
                modal: (c) => ReplaceProductDetailsModal(
                  controller: c,
                  product: product,
                ),
              );
            },
          )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: replaceState.stocks != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                isLoading: replaceState.isUpdating,
                title: TrKeys.replaceProduct,
                onPressed: () {
                  AppHelpers.showAlertDialog(
                      context: context,
                      child: NoteDialog(
                        onSuccess: (value) {
                          replaceNotifier.replaceStock(context, note: value,
                              success: () {
                            replaceNotifier.fetchOrderDetails(
                                order: replaceState.order);
                            Navigator.pop(context);
                          });
                        },
                      ));
                },
              ),
            )
          : null,
    );
  }

  _stockItem(Stocks? stock, {bool isReplace = false}) {
    if (!isReplace) {
      stock = stock?.copyWith(
        product: stock.stock?.product,
        extras: stock.stock?.extras,
        totalPrice: stock.stock?.totalPrice,
      );
    }
    return stock == null
        ? const SizedBox.shrink()
        : Column(
            children: [
              if (!isReplace) 10.verticalSpace,
              if (isReplace)
                Padding(
                  padding: REdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      const Expanded(child: Divider(color: Style.black)),
                      8.horizontalSpace,
                      Icon(Remix.swap_line, size: 24.r),
                      8.horizontalSpace,
                      const Expanded(child: Divider(color: Style.black)),
                    ],
                  ),
                ),
              Row(
                children: [
                  CommonImage(
                    url: (stock.galleries?.isNotEmpty ?? false)
                        ? stock.galleries?.first.path
                        : stock.product?.img,
                    height: 80,
                    width: 60,
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stock.product?.translation?.title ??
                              AppHelpers.getTranslation(TrKeys.unKnow),
                          style: Style.interNormal(size: 15),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        4.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${AppHelpers.getTranslation(TrKeys.amount)} — ${stock.quantity} x ${AppHelpers.numberFormat(number: stock.totalPrice)}',
                                style: Style.interRegular(size: 14),
                              ),
                            ),
                            Text(
                              ' ${AppHelpers.numberFormat(number: ((stock.totalPrice ?? 0) * (stock.quantity ?? 0)))}',
                              style: Style.interRegular(size: 14),
                            ),
                          ],
                        ),
                        2.verticalSpace,
                        Wrap(
                          children: [
                            for (var e in stock.extras ?? [])
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${e.group?.translation?.title}:",
                                    style: Style.interRegular(size: 12),
                                  ),
                                  2.horizontalSpace,
                                  Text(
                                    "${AppHelpers.getNameColor(e.answers)},",
                                    style: Style.interRegular(size: 12),
                                  ),
                                  6.horizontalSpace,
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
