import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscure;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final String? Function(String?)? validation;
  final TextInputType? inputType;
  final String? initialText;
  final String? label;
  final EdgeInsetsGeometry? contentPadding;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final bool isError;
  final bool autoFocus;
  final double radius;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;

  const CustomTextFormField({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.obscure,
    this.validation,
    this.onChanged,
    this.controller,
    this.inputType,
    this.initialText,
    this.readOnly = false,
    this.isError = false,
    this.hint = "",
    this.radius = AppConstants.radius,
    this.autoFocus = false,
    this.contentPadding,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.minLines,
    this.label,
    this.inputFormatters,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: REdgeInsets.only(right: 6, bottom: 2),
            child: Text(
              "${AppHelpers.getTranslation(label ?? '')} ${validation != null ? '*' : ''}",
              style: Style.interNormal(size: 14),
            ),
          ),
        TextFormField(
          autofocus: autoFocus,
          onTap: onTap,
          textInputAction: textInputAction,
          autocorrect: true,
          maxLines: maxLines,
          minLines: minLines,
          onChanged: onChanged,
          obscureText: !(obscure ?? true),
          obscuringCharacter: '*',
          controller: controller,
          validator: validation,
          style: Style.interNormal(size: 14, color: Style.black),
          cursorWidth: 1,
          cursorColor: Style.textColor,
          keyboardType: inputType,
          inputFormatters: inputFormatters,
          initialValue: initialText,
          textCapitalization: textCapitalization,
          readOnly: readOnly,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hint != null ? AppHelpers.getTranslation(hint!) : null,
            hintStyle: Style.interNormal(size: 14, color: Style.textHint),
            contentPadding: contentPadding ??
                REdgeInsets.symmetric(vertical: 16, horizontal: 12),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: Style.black,
            filled: false,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.merge(
                    const BorderSide(color: Style.icon),
                    const BorderSide(color: Style.icon)),
                borderRadius: BorderRadius.circular(radius.r)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide.merge(
                    const BorderSide(color: Style.icon),
                    const BorderSide(color: Style.icon)),
                borderRadius: BorderRadius.circular(radius.r)),
            border: OutlineInputBorder(
                borderSide: BorderSide.merge(
                    const BorderSide(color: Style.icon),
                    const BorderSide(color: Style.icon)),
                borderRadius: BorderRadius.circular(radius.r)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide.merge(
                    const BorderSide(color: Style.icon),
                    const BorderSide(color: Style.icon)),
                borderRadius: BorderRadius.circular(radius.r)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.merge(
                    const BorderSide(color: Style.icon),
                    const BorderSide(color: Style.icon)),
                borderRadius: BorderRadius.circular(radius.r)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.merge(
                    const BorderSide(color: Style.icon),
                    const BorderSide(color: Style.icon)),
                borderRadius: BorderRadius.circular(radius.r)),
          ),
        ),
      ],
    );
  }
}
