import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class CustomChip extends StatelessWidget {
  final String? label;
  final VoidCallback? onDeleted;

  const CustomChip({super.key, required this.label, this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(right: 8),
      child: Chip(
        backgroundColor: Style.primary,
        deleteIcon: Icon(
          Remix.close_circle_fill,
          size: 20.r,
          color: Style.white,
        ),
        onDeleted: onDeleted,
        label: Text(
          label ?? "",
          style: Style.interNormal(
            color: Style.white,
            size: 14,
          ),
        ),
      ),
    );
  }
}
