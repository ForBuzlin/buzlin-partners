import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class StatusButton extends StatelessWidget {
  final String status;
  final VoidCallback? onTap;
  final double verticalPadding;
  final double horizontalPadding;

  const StatusButton({
    super.key,
    required this.status,
    this.onTap,
    this.verticalPadding = 6,
    this.horizontalPadding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: horizontalPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.radius.r),
          color: AppHelpers.getStatusColor(status).withOpacity(0.2),
        ),
        child: Text(
          AppHelpers.getTranslation(status),
          style: Style.interRegular(
            size: 12,
            color: AppHelpers.getStatusColor(status),
            letterSpacing: -0.3,
          ),
        ),
      ),
    );
  }
}
