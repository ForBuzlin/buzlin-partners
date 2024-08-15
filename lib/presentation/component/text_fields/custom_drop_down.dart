import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class CustomDropDown extends StatelessWidget {
  final String? value;
  final String? hint;
  final String? label;
  final List<String> list;
  final ValueChanged<String> onChanged;
  final double radius;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;

  const CustomDropDown({
    super.key,
    this.value,
    required this.list,
    required this.onChanged,
    this.hint,
    this.label,
    this.radius = AppConstants.radius,
    this.contentPadding, this.validator,
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
              "${AppHelpers.getTranslation(label ?? '')}*",
              style: Style.interNormal(size: 14),
            ),
          ),
        DropdownButtonFormField(
          padding: EdgeInsets.zero,
          hint: Text(
            AppHelpers.getTranslation(hint ?? ''),
            style: Style.interNormal(size: 14, color: Style.textColor),
          ),
          value: value,
          validator: validator,
          items: list.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(AppHelpers.getTranslation(e)),
            );
          }).toList(),
          onChanged: (s) => onChanged.call(s.toString()),
          elevation: 0,
          dropdownColor: Style.white,
          iconEnabledColor: Style.black,
          borderRadius: BorderRadius.circular(14.r),
          style: Style.interNormal(size: 14),
          decoration: InputDecoration(
            contentPadding: contentPadding ??
                REdgeInsets.symmetric(vertical: 16, horizontal: 12),
            hintText: hint,
            hintStyle: Style.interNormal(
              size: 14,
              color: Style.textHint,
            ),
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
