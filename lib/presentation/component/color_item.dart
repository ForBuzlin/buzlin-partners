import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class ColorItem extends StatelessWidget {
  final double size;
  final Extras extras;

  const ColorItem({super.key, required this.extras, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return AppHelpers.checkIfHex(extras.value)
        ? Container(
            width: size.r,
            height: size.r,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(int.parse('0xFF${extras.value?.substring(1, 7)}')),
                border: Border.all(
                  color: extras.value?.substring(1, 7) == "ffffff"
                      ? Style.black
                      : Style.white,
                )),
          )
        : Material(
            shape: const CircleBorder(),
            color: Style.white,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Style.black.withOpacity(0.1), width: 1.5.r),
              ),
              padding: REdgeInsets.all(12),
              child: Text(
                extras.value ?? '',
                style: Style.interNormal(
                  size: 14,
                  color: Style.black,
                  letterSpacing: -14 * 0.01,
                ),
              ),
            ),
          );
  }
}
