import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'order_map.dart';

class OrderAddressModal extends StatelessWidget {
  final MyAddress? address;
  final UserData? user;

  const OrderAddressModal({super.key, required this.address, this.user});

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalDrag(),
            Text(AppHelpers.getTranslation(TrKeys.deliveryAddress)),
            16.verticalSpace,
            OrderMap(
              markers: {
                Marker(
                  markerId: const MarkerId('user'),
                  position: AppHelpers.getOrderLocation(address?.location),
                  // icon: await AppHelpers.getUserImg(user)
                ),
              },
              latLng: AppHelpers.getOrderLocation(address?.location),
            ),
            8.verticalSpace,
            Text(
              address?.location?.address ?? '',
              style: Style.interNormal(size: 14),
            ),
            16.verticalSpace,
            Row(
              children: [
                _addressInfo(
                  title: TrKeys.homeNumber,
                  value: address?.streetHouseNumber,
                ),
                _addressInfo(title: TrKeys.zipCode, value: address?.zipcode),
                _addressInfo(title: TrKeys.phoneNumber, value: address?.phone)
              ],
            ),
            16.verticalSpace,
            address?.additionalDetails != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppHelpers.getTranslation(TrKeys.details),
                        style: Style.interNormal(size: 12),
                      ),
                      ReadMoreText(
                        address?.additionalDetails ?? " ",
                        trimMode: TrimMode.Line,
                        trimLines: 3,
                        trimCollapsedText:
                            AppHelpers.getTranslation(TrKeys.showMore),
                        trimExpandedText:
                            " ${AppHelpers.getTranslation(TrKeys.showLess)}",
                        lessStyle: Style.interRegular(
                            size: 14, textDecoration: TextDecoration.underline),
                        moreStyle: Style.interRegular(
                            size: 14, textDecoration: TextDecoration.underline),
                        style: Style.interNormal(
                          size: 14,
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            36.verticalSpace,
          ],
        ),
      ),
    );
  }

  _addressInfo({required String title, required String? value}) {
    return value != null
        ? Expanded(
            child: Padding(
              padding: REdgeInsets.only(right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppHelpers.getTranslation(title),
                    style: Style.interNormal(size: 12),
                  ),
                  Text(
                    value,
                    style: Style.interSemi(size: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
