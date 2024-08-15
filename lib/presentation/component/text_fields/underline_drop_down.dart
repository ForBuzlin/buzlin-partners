import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class UnderlineDropDown extends StatelessWidget {
  final String? value;
  final String? hint;
  final String? label;
  final List<String> list;
  final ValueChanged<String> onChanged;
  final double radius;
  final String? Function(String?)? validator;

  const UnderlineDropDown({
    super.key,
    this.value,
    required this.list,
    required this.onChanged,
    this.hint,
    this.label,
    this.radius = AppConstants.radius,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      padding: EdgeInsets.zero,
      hint: Text(
        AppHelpers.getTranslation(hint ?? ''),
        style: Style.interNormal(
          size: 14,
          color: Style.black.withOpacity(0.7),
        ),
      ),
      value: value,
      validator: validator,
      items: list.map((e) {
        return DropdownMenuItem(
            value: e, child: Text(AppHelpers.getTranslation(e)));
      }).toList(),
      onChanged: (s) => onChanged.call(s.toString()),
      elevation: 0,
      dropdownColor: Style.white,
      iconEnabledColor: Style.black,
      borderRadius: BorderRadius.circular(8.r),
      style: Style.interRegular(size: 15),
      decoration: InputDecoration(
        contentPadding: REdgeInsets.symmetric(horizontal: 2),
        labelText:
            label != null ? "${AppHelpers.getTranslation(label!)}*" : null,
        labelStyle: Style.interNormal(
          size: 14,
          color: Style.black.withOpacity(0.7),
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.merge(
                const BorderSide(color: Style.differBorderColor),
                const BorderSide(color: Style.differBorderColor))),
        errorBorder: InputBorder.none,
        border: const UnderlineInputBorder(),
        focusedErrorBorder: const UnderlineInputBorder(),
        disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.merge(
                const BorderSide(color: Style.differBorderColor),
                const BorderSide(color: Style.differBorderColor))),
        focusedBorder: const UnderlineInputBorder(),
      ),
    );
  }
}
