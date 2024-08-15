import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class PaymentItem extends StatelessWidget {
  final PaymentData payment;
  final bool isSelected;
  final bool isLast;
  final Function() onTap;

  const PaymentItem({
   super.key,
    required this.payment,
    required this.isSelected,
    required this.onTap,
    this.isLast = false,
  }) ;

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                isSelected
                    ? Remix.checkbox_circle_fill
                    : Remix.checkbox_circle_line,
                size: 24.r,
                color: isSelected ? Style.primary : Style.black,
              ),
              14.horizontalSpace,
              Text(
                '${toBeginningOfSentenceCase(payment.tag)}',
                style: Style.interSemi(size: 14, letterSpacing: -0.3),
              ),
            ],
          ),
          if (!isLast)
            Column(
              children: [
                14.verticalSpace,
                Divider(
                  thickness: 1.r,
                  height: 1.r,
                  color: Style.greyColor,
                ),
                14.verticalSpace,
              ],
            ),
        ],
      ),
    );
  }
}
