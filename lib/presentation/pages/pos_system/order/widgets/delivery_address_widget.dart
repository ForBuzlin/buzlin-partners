import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/pages/pos_system/order/widgets/address/select_address_modal.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/application/providers.dart';
import 'country/country_modal.dart';

class DeliveryAddressWidget extends StatelessWidget {
  final PickupAddress? pickupAddress;
  final int selectedBagIndex;

  const DeliveryAddressWidget(
      {super.key, this.pickupAddress, required this.selectedBagIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return ButtonEffectAnimation(
              onTap: () {
                AppHelpers.showCustomModalBottomDragSheet(
                  context: context,
                  paddingTop: 80,
                  initSize: 0.9,
                  modal: (s) => CountryModal(
                    bagIndex: selectedBagIndex,
                    isDelivery: true,
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: REdgeInsets.symmetric(vertical: 8, horizontal: 24),
                decoration: BoxDecoration(
                  color: Style.greyColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Remix.navigation_fill,
                      size: 18.r,
                    ),
                    8.horizontalSpace,
                    (" ${pickupAddress?.country?.translation?.title ?? ""} , ${pickupAddress?.city?.translation?.title ?? ""}"
                                .length) >
                            28
                        ? Expanded(
                            child: AutoSizeText(
                            " ${pickupAddress?.country?.translation?.title ?? ""} , ${pickupAddress?.city?.translation?.title ?? ""}",
                            maxLines: 1,
                            minFontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ))
                        : pickupAddress?.country != null
                            ? Text(
                                " ${pickupAddress?.country?.translation?.title ?? ""} , ${pickupAddress?.city?.translation?.title ?? ""}")
                            : Text(
                                AppHelpers.getTranslation(TrKeys.selectPlace))
                  ],
                ),
              ),
            );
          },
        ),
        8.verticalSpace,
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final orderCartState = ref.watch(orderCartProvider);
            final user = ref.watch(orderUserProvider).selectedUser;
            return ButtonEffectAnimation(
              disabled: orderCartState.deliveryPrice != null  && user != null,
              onTap: () {
                if(user== null){
                  AppHelpers.errorSnackBar(context,text: TrKeys.pleaseSelectAUser);
                  return;
                }
                if (orderCartState.deliveryPrice != null) {
                  AppHelpers.showCustomModalBottomDragSheet(
                    context: context,
                    modal:(c)=> SelectAddressModal(address: pickupAddress),
                    radius: 18,
                    isDrag: false,
                    paddingTop: 60,
                    initSize: 0.7
                  );
                }
              },
              child: Container(
                width: double.infinity,
                padding: REdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Style.greyColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Remix.map_pin_range_line,
                        size: 18.r,
                      ),
                      8.horizontalSpace,
                      Text(
                        orderCartState.deliveryAddress?.location != null
                            ? '${orderCartState.deliveryAddress?.zipcode ?? ''}, ${orderCartState.deliveryAddress?.additionalDetails ?? ""}, ${orderCartState.deliveryAddress?.streetHouseNumber ?? ""}'
                            : AppHelpers.getTranslation(TrKeys.selectedAddress),
                        style: Style.interNormal(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
