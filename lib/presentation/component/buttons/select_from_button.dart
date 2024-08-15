import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import '../../styles/style.dart';
import '../loading/loading.dart';

class SelectFromButton extends StatelessWidget {
  final IconData? iconData;
  final String title;
  final bool isNonSelect;
  final bool? isLoading;

  const SelectFromButton({
   super.key,
    this.iconData,
    this.isNonSelect = false,
    required this.title,
    this.isLoading = false,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.r,
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
        border: Border.all(
          color: Style.unselect,
          width: 1.r,
        ),
      ),
      alignment: Alignment.center,
      padding: REdgeInsets.symmetric(horizontal: 12),
      child: isLoading ?? false
          ? const Center(child: Loading())
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      iconData != null
                          ? Icon(
                              iconData,
                              size: 20.r,
                              color: Style.black,
                            )
                          : const SizedBox.shrink(),
                      8.horizontalSpace,
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: Style.black,
                            letterSpacing: -14 * 0.02,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                !isNonSelect
                    ? Icon(
                        Remix.arrow_down_s_line,
                        size: 20.r,
                        color: Style.black,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
    );
  }
}
