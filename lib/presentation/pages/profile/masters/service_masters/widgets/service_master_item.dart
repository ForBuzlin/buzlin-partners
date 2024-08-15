import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class ServiceMasterItem extends StatelessWidget {
  final ServiceData service;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final int spacing;

  const ServiceMasterItem({
    super.key,
    required this.service,
    required this.onTap,
    this.spacing = 1,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      margin: EdgeInsets.only(bottom: spacing.r),
      padding: REdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 4.r,
            height: 56.r,
            padding: REdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: AppHelpers.getServiceStatusColor(service.status),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                )),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppHelpers.getTranslation(
                      service.service?.translation?.title ?? ''),
                  style: Style.interNormal(
                    size: 14,
                    letterSpacing: -0.3,
                  ),
                ),
                6.verticalSpace,
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    _serviceInfo(
                      "${AppHelpers.getTranslation(TrKeys.from)} ${AppHelpers.numberFormat(number: service.service?.minPrice)}",
                    ),
                    if (service.service?.interval != null)
                      _serviceInfo(
                        "${service.service?.interval ?? 0} ${AppHelpers.getTranslation(TrKeys.minute)}",
                      ),
                    if (service.type != null)
                      _serviceInfo(
                        AppHelpers.getTranslation(service.type ?? ""),
                      ),
                    if (service.gender != null && service.gender != TrKeys.all)
                      _serviceInfo(
                        AppHelpers.getTranslation(service.gender ?? ""),
                      ),
                  ],
                ),
              ],
            ),
          ),
          8.horizontalSpace,
          Row(
            children: [
              CircleButton(
                onTap: onTap,
                icon: Remix.pencil_line,
              ),
              8.horizontalSpace,
              CircleButton(
                onTap: onDelete,
                icon: Remix.delete_bin_line,
              ),
            ],
          ),
          12.horizontalSpace,
        ],
      ),
    );
  }

  _serviceInfo(String title) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(color: Style.textHint)),
      padding: EdgeInsets.symmetric(horizontal: 14.r, vertical: 6.r),
      child: Text(
        title,
        style: Style.interNormal(color: Style.textHint, size: 12),
      ),
    );
  }
}
