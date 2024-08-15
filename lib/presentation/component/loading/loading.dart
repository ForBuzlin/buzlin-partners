import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/styles/style.dart';

class Loading extends StatelessWidget {
  final int size;
  final Color? color;

  const Loading({
   super.key,
    this.size = 32,
    this.color,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? SizedBox(
              height: size.r,
              width: size.r,
              child: CircularProgressIndicator(
                color: color ?? Style.primary,
                strokeWidth: size > 30 ? 4.r : 3.r,
              ),
            )
          : CupertinoActivityIndicator(
              radius: size > 24 ? 12 : 10,
              color: color,
            ),
    );
  }
}
