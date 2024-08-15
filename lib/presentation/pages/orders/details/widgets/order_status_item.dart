import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class OrderStatusItem extends StatelessWidget {
  final String title;
  final String? status;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  const OrderStatusItem({
    super.key,
    required this.title,
    required this.status,
    this.onTap, this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: REdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Style.white,
           borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
        ),
        padding: padding ?? REdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                AppHelpers.getTranslation(title),
                style: Style.interNormal(size: 14),
              ),
            ),
            StatusButton(status: status ?? ""),
          ],
        ),
      ),
    );
  }
}
