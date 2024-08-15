import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class CustomDetailItem extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback? onTap;

  const CustomDetailItem({super.key, required this.title, required this.value, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Expanded(
              child: Text(
                AppHelpers.getTranslation(title),
                style: Style.interRegular(
                  size: 14,
                  color: Style.black,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: Style.interNormal(
                  size: 14,
                  color: Style.black,
                  letterSpacing: -0.3,
                ),
                maxLines: 2,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
