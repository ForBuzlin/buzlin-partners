import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class ServiceItem extends StatelessWidget {
  final ServiceData service;
  final VoidCallback? onTap;
  final bool booked;

  const ServiceItem({
    super.key,
    required this.service,
    this.onTap,
    this.booked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          16.verticalSpace,
          Text(
            service.translation?.title ?? "",
            style: Style.interNormal(size: 18),
          ),
          8.verticalSpace,
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: Style.textHint)),
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                child: Text(
                  "${AppHelpers.getTranslation(TrKeys.from)} ${AppHelpers.numberFormat(number: service.price)}",
                  style: Style.interNormal(color: Style.textHint, size: 12),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  border: Border.all(color: Style.textHint),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                child: Text(
                  "${service.interval ?? 0} ${AppHelpers.getTranslation(TrKeys.minute)}",
                  style: Style.interNormal(color: Style.textHint, size: 12),
                ),
              ),
              if (service.type != null)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: Style.textHint)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                  child: Text(
                    AppHelpers.getTranslation(service.type ?? ""),
                    style: Style.interNormal(color: Style.textHint, size: 12),
                  ),
                ),
              if (service.gender != null && service.gender != TrKeys.all)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: Style.textHint)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
                  child: Text(
                    AppHelpers.getTranslation(service.gender ?? ""),
                    style: Style.interNormal(color: Style.textHint, size: 12),
                  ),
                )
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppHelpers.getTranslation(TrKeys.price),
                    style: Style.interNormal(color: Style.textHint, size: 14),
                  ),
                  Text(
                    AppHelpers.numberFormat(number: service.price),
                    style: Style.interNormal(size: 22),
                  )
                ],
              ),
              const Spacer(),
              ButtonEffectAnimation(
                onTap: () => onTap?.call(),
                child: onTap != null
                    ? Container(
                        width: 36.r,
                        height: 36.r,
                        decoration: BoxDecoration(
                          color: booked ? Style.primary : Style.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: booked ? Style.primary : Style.black,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            booked
                                ? Remix.check_fill
                                : Remix.add_fill,
                            color: booked ? Style.white : Style.black,
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.r, horizontal: 16.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Style.black)),
                        child: Text(
                          AppHelpers.getTranslation(TrKeys.book),
                          style: Style.interNormal(size: 16),
                        ),
                      ),
              ),
            ],
          ),
          8.verticalSpace,
        ],
      ),
    );
  }
}
