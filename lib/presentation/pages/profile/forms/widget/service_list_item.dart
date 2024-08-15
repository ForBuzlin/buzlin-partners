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

  const ServiceListItem({
    super.key,
    required this.service,
    required this.onTap,
    this.spacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.symmetric(vertical: 6,horizontal: 12),
        decoration: BoxDecoration(
          color:  Style.white,
          borderRadius:  BorderRadius.circular(AppConstants.radius/1.4),
        ),
        margin: EdgeInsets.only(bottom: spacing.r),
        child: Row(
          children: [
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
              AppHelpers.getTranslation(service.service?.translation?.title ?? ''),
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
