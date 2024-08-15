import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';


InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  focusColor: Style.primary,
  errorStyle: Style.interRegular(color: Style.red, size: 12),
  contentPadding: REdgeInsets.symmetric(vertical: 20, horizontal: 12),
  hintStyle: Style.interRegular(color: Style.textColor, size: 14),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(color: Style.transparent),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(color: Style.transparent),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(color: Style.transparent),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.r)),
    borderSide: const BorderSide(color: Style.red),
  ),
);

OutlineInputBorder secondaryOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.r)),
    borderSide: BorderSide(
      color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.15),
    ),
  );
}
