import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class SearchTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final Color bgColor;
  final bool isBorder;
  final bool isRead;
  final bool isSearchIcon;
  final bool autofocus;

  const SearchTextField({
   super.key,
    this.hintText,
    this.suffixIcon,
    this.textEditingController,
    this.onChanged,
    this.onTap,
    this.bgColor = Style.transparent,
    this.isBorder = false,
    this.autofocus = false,
    this.isRead = false,
    this.isSearchIcon = true,
  }) ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isRead,
      autocorrect: true,
      autofocus: autofocus,
      style: Style.interRegular(
        size: 14,
        color: Style.black,
      ),
      onTap: onTap,
      onChanged: onChanged,
      controller: textEditingController,
      cursorColor: Style.black,
      cursorWidth: 1,
      decoration: InputDecoration(
        hintStyle: Style.interRegular(
          size: 14,
          color: Style.textColor,
        ),
        hintText: hintText ?? AppHelpers.getTranslation(TrKeys.search),
        contentPadding: REdgeInsets.symmetric(horizontal: 16, vertical: 8.h),
        prefixIcon: isSearchIcon
            ? Icon(
                Remix.search_2_line,
                size: 20.r,
                color: Style.colorGrey,
              )
            : null,
        suffixIcon: suffixIcon,
        fillColor: bgColor,
        filled: true,
        focusedBorder: isBorder
            ? OutlineInputBorder(
                 borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
                borderSide: const BorderSide(color: Style.borderColor))
            : InputBorder.none,
        border: isBorder
            ? OutlineInputBorder(
                 borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
                borderSide: const BorderSide(color: Style.borderColor))
            : InputBorder.none,
        enabledBorder: isBorder
            ? OutlineInputBorder(
                 borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
                borderSide: const BorderSide(color: Style.borderColor))
            : InputBorder.none,
      ),
    );
  }
}
