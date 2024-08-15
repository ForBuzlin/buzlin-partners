import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class UnderlinedTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final Widget? suffixIcon;
  final bool? obscure;
  final int? maxLines;
  final int? minLines;
  final TextEditingController? textController;
  final ValueChanged<String>? onChanged;
  final TextInputType? inputType;
  final String? initialText;
  final String? descriptionText;
  final bool readOnly;
  final bool isError;
  final bool isSuccess;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  const UnderlinedTextField({
    super.key,
    this.label,
    this.suffixIcon,
    this.obscure,
    this.onChanged,
    this.textController,
    this.inputType,
    this.initialText,
    this.descriptionText,
    this.readOnly = false,
    this.isError = false,
    this.isSuccess = false,
    this.textCapitalization,
    this.textInputAction,
    this.hint,
    this.onTap,
    this.validator,
    this.maxLines,
    this.inputFormatters,
    this.minLines,
    this.focusNode,
  }) ;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autocorrect: true,
          maxLines: maxLines ?? 1,
          focusNode: focusNode,
          minLines: minLines,
          onTap: onTap,
          onChanged: onChanged,
          obscureText: !(obscure ?? true),
          obscuringCharacter: '*',
          controller: textController,
          style: Style.interNormal(
            size: 15,
            color: isDarkMode ? Style.white : Style.black,
          ),
          inputFormatters: inputFormatters,
          cursorWidth: 1,
          cursorColor: isDarkMode ? Style.white : Style.black,
          keyboardType: inputType,
          initialValue: initialText,
          readOnly: readOnly,
          textCapitalization:
              textCapitalization ?? TextCapitalization.sentences,
          textInputAction: textInputAction,
          validator: validator,
          decoration: InputDecoration(
            suffixIconConstraints: BoxConstraints(
              maxHeight: suffixIcon != null ? 30.r : 30.r,
              maxWidth: suffixIcon != null ? 30.r : 30.r,
            ),
            suffixIcon: suffixIcon,
            hintText: hint,
            hintStyle: Style.interNormal(
              size: 12,
              color: isDarkMode ? Style.white : Style.textColor,
            ),
            labelText: label,
            labelStyle: Style.interNormal(
              size: 14,
              color: Style.black.withOpacity(0.7),
            ),
            contentPadding: REdgeInsets.symmetric(horizontal: 0, vertical: 8),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Style.shimmerBase),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Style.red),
            ),
            border: const UnderlineInputBorder(),
            focusedErrorBorder: const UnderlineInputBorder(),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Style.shimmerBase),
            ),
            focusedBorder: const UnderlineInputBorder(),
          ),
        ),
        if (descriptionText != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              4.verticalSpace,
              Text(
                descriptionText!,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.3,
                  fontSize: 12,
                  color: isError
                      ? Style.red
                      : isSuccess
                          ? Style.textColor
                          : Style.black,
                ),
              ),
            ],
          )
      ],
    );
  }
}
