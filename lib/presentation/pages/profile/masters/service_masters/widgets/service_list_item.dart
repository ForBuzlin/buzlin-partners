import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class ServiceListItem extends StatelessWidget {
  final ServiceData service;
  final VoidCallback onTap;
  final int spacing;
  final bool isSelected;

  const ServiceListItem({
    super.key,
    required this.service,
    required this.onTap,
    this.spacing = 4,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Style.primary.withOpacity(0.4) : Style.white,
          borderRadius:  BorderRadius.circular(AppConstants.radius/1.4),
        ),
        margin: EdgeInsets.only(bottom: spacing.r),
        child: Row(
          children: [
            if(isSelected)
            Container(
              width: 4.r,
              height: 36.r,
              margin: REdgeInsets.only(right: 4,left: 1),
              decoration: BoxDecoration(
                  color: Style.primary,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  )),
            ),
            CommonImage(
              width: 40,
              height: 40,
              url: (service.galleries?.isNotEmpty ?? false)
                  ? service.galleries?.first.path
                  : null,
              errorRadius: 0,
              fit: BoxFit.cover,
            ),
            8.horizontalSpace,
            Text(
              AppHelpers.getTranslation(service.translation?.title ?? ''),
              style: Style.interNormal(
                size: 14,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
