import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remixicon/remixicon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class CartList extends ConsumerWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final cartState = ref.watch(orderCartProvider);
    final notifier = ref.read(orderCartProvider.notifier);
    final productsState = ref.watch(orderProductsProvider);
    final productsNotifier = ref.read(orderProductsProvider.notifier);
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 48.r,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cartState.bags.length,
              itemBuilder: (context, index) {
                final bool isSelected = cartState.selectedBagIndex == index;
                return Padding(
                  padding: REdgeInsets.only(bottom: 8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24.r),
                    onLongPress: () {
                      if (index != 0) {
                        notifier.removeBag(index);
                      }
                    },
                    onDoubleTap: () {
                      if (cartState.bags[index].bagProducts?.isEmpty ?? true) {
                        AppHelpers.errorSnackBar(context,
                            text: AppHelpers.getTranslation(TrKeys.cartEmpty));
                        return;
                      }
                      if (!productsState.isLoading &&
                          cartState.selectedBagIndex != index) {
                        notifier.setSelectedBagIndex(index);
                        final stocks =
                            LocalStorage.getBags()[index].bagProducts ?? [];
                        productsNotifier.updateProducts(cartStocks: stocks);
                      }
                      ref
                          .read(orderUserProvider.notifier)
                          .clearSelectedUserInfo();
                      context.pushRoute(const OrderRoute());
                    },
                    onTap: () {
                      if (!productsState.isLoading &&
                          cartState.selectedBagIndex != index) {
                        notifier.setSelectedBagIndex(index);
                        final stocks =
                            LocalStorage.getBags()[index].bagProducts ?? [];
                        productsNotifier.updateProducts(cartStocks: stocks);
                      }
                    },
                    child: Container(
                      height: 48.r,
                      width: 48.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: isSelected ? Style.primary : Style.white,
                        boxShadow:
                            isSelected ? Style.primaryShadow : Style.greyShadow,
                      ),
                      alignment: Alignment.center,
                      child: productsState.isLoading &&
                              cartState.selectedBagIndex == index
                          ? const Loading(color: Style.white, size: 21)
                          : Icon(
                              Remix.shopping_bag_3_fill,
                              size: 20.r,
                              color: isSelected ? Style.white : Style.colorGrey,
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
          4.verticalSpace,
          InkWell(
            borderRadius: BorderRadius.circular(24.r),
            onTap: () => notifier.addANewBag(context),
            child: ButtonEffectAnimation(
              child: Container(
                height: 48.r,
                width: 48.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: Style.primary,
                  boxShadow: Style.primaryShadow,
                ),
                child: Center(
                    child: Icon(
                  Remix.add_line,
                  color: Style.white,
                  size: 24.r,
                )),
              ),
            ),
          ),
          if (Platform.isIOS) 32.verticalSpace,
        ],
      ),
    );
  }
}
