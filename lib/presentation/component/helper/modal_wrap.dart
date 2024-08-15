import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/helper/keyboard_disable.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'blur_wrap.dart';

class ModalWrap extends StatelessWidget {
  final Widget body;
  final Color? color;

  const ModalWrap({super.key, required this.body, this.color});

  @override
  Widget build(BuildContext context) {
    return BlurWrap(
      radius: BorderRadius.only(
        topLeft: Radius.circular(AppConstants.radius.r),
        topRight: Radius.circular(AppConstants.radius.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppConstants.radius.r),
            topRight: Radius.circular(AppConstants.radius.r),
          ),
          color: color ?? Style.white,
          boxShadow: [
            BoxShadow(
              color: Style.black.withOpacity(0.25),
              offset: const Offset(0, -2),
              blurRadius: 40,
              spreadRadius: 0,
            ),
          ],
        ),
        child: KeyboardDisable(child: body),
      ),
    );
  }
}
