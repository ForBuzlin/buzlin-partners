import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class StatusIndicator extends StatelessWidget {
  final String? status;
  final double? height;
  final double? width;
  final double vertical;
  final int radius;

  const StatusIndicator({
    super.key,
    required this.status,
    this.height,
    this.width,
    this.vertical = 15,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.r ?? 4.r,
      height: height?.r ?? 48.r,
      padding: REdgeInsets.symmetric(vertical: vertical),
      decoration: BoxDecoration(
          color: AppHelpers.getStatusColor(status),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius.r),
            bottomRight: Radius.circular(radius.r),
          )),
    );
  }
}
