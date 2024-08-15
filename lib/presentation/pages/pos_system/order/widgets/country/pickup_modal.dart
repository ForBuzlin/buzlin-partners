import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class PickupModal extends StatefulWidget {
  final DeliveryPointsData deliveryPoint;
  final ValueChanged<DeliveryPointsData> onTap;

  const PickupModal(
      {super.key, required this.deliveryPoint, required this.onTap});

  @override
  State<PickupModal> createState() => _CityModalState();
}

class _CityModalState extends State<PickupModal> {
  final RefreshController controller = RefreshController();
  final Delayed delayed = Delayed(milliseconds: 700);

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const ModalDrag(),
              18.horizontalSpace,
              Row(
                children: [
                  CommonImage(
                    height: 36,
                    width: 36,
                    radius: 18,
                    url: widget.deliveryPoint.img,
                    fit: BoxFit.cover,
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          widget.deliveryPoint.translation?.title ?? "",
                          style: Style.interSemi(size: 16, letterSpacing: -0.3),
                        ),
                        Text(
                          widget.deliveryPoint.address?.address ?? "",
                          style: Style.interSemi(size: 16, letterSpacing: -0.3),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.checkroom, size: 21.r),
                  Text(
                    "${widget.deliveryPoint.fittingRooms ?? ""}",
                    style: Style.interSemi(size: 16, letterSpacing: -0.3),
                  ),
                  12.horizontalSpace,
                  Icon(Icons.local_shipping, size: 21.r),
                  4.horizontalSpace,
                  Text(
                    AppHelpers.numberFormat(number: widget.deliveryPoint.price),
                    style: Style.interSemi(size: 16, letterSpacing: -0.3),
                  ),
                ],
              ),
              if (widget.deliveryPoint.translation?.description != null)
                Text(
                  widget.deliveryPoint.translation?.description ?? "",
                  style: Style.interSemi(size: 18, color: Style.black),
                ),
              if (widget.deliveryPoint.address?.address != null)
                Text(
                  widget.deliveryPoint.address?.address ?? "",
                  style: Style.interSemi(size: 18, color: Style.black),
                ),
              16.verticalSpace,
              for (WorkingDay e in widget.deliveryPoint.workingDays ?? [])
                Padding(
                  padding: REdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          AppHelpers.getTranslation(e.day ?? ''),
                          style:
                              Style.interNormal(size: 16, color: Style.black),
                        ),
                      ),
                      Text(
                        "${e.from} - ${e.to}",
                        style: Style.interNormal(size: 16, color: Style.black),
                      ),
                    ],
                  ),
                ),
              16.verticalSpace,
              CustomButton(
                title: AppHelpers.getTranslation(TrKeys.apply),
                onPressed: () {
                  widget.onTap(widget.deliveryPoint);
                  Navigator.pop(context);
                },
              ),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
