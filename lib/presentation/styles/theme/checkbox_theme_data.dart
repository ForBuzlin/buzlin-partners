import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

CheckboxThemeData checkboxThemeData = CheckboxThemeData(
  fillColor: MaterialStateProperty.all(Style.primary),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
  side: const BorderSide(color: Style.primary),
);
