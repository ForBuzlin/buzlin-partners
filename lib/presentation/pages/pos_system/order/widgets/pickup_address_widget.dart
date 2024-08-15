import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'country/country_modal.dart';

class PickupAddressWidget extends StatelessWidget {
  final PickupAddress? pickupAddress;
  final bool pointLoading;
  final int selectedBagIndex;

  const PickupAddressWidget(
      {super.key,
      required this.pickupAddress,
      required this.pointLoading,
      required this.selectedBagIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonEffectAnimation(
          onTap: () {
            AppHelpers.showCustomModalBottomDragSheet(
              context: context,
              paddingTop: 80,
              initSize: 0.9,
              modal: (s) => CountryModal(
                bagIndex: selectedBagIndex,
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
                        : Text(AppHelpers.getTranslation(TrKeys.selectAddress))
              ],
            ),
          ),
        ),
        8.verticalSpace,
        ButtonEffectAnimation(
          disabled: pickupAddress?.country != null,
          onTap: () {
              context.pushRoute(PickupMapRoute(
                countryId: pickupAddress?.country?.id ?? 0,
                regionId: pickupAddress?.city?.id ?? 0,
              ));
          },
          child: Container(
            width: double.infinity,
            padding: REdgeInsets.symmetric(vertical: 8, horizontal: 24),
            decoration: BoxDecoration(
              color: Style.greyColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: pointLoading
                  ? const Loading(size: 24)
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Remix.map_pin_range_line,
                          size: 18.r,
                        ),
                        8.horizontalSpace,
                        (pickupAddress?.deliveryPoint?.translation?.title
                                        ?.length ??
                                    0) >
                                28
                            ? Expanded(
                                child: AutoSizeText(
                                pickupAddress
                                        ?.deliveryPoint?.translation?.title ??
                                    "",
                                maxLines: 1,
                                minFontSize: 14,
                                overflow: TextOverflow.ellipsis,
                              ))
                            : pickupAddress?.deliveryPoint != null
                                ? Text(pickupAddress
                                        ?.deliveryPoint?.translation?.title ??
                                    '')
                                : Text(AppHelpers.getTranslation(TrKeys.pickup))
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
