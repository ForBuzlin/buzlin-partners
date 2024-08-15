import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_text_field/phone_text_field.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class PhoneField extends StatelessWidget {
  final ValueChanged<String> onchange;
  final String? initialValue;
  final double radius;

  const PhoneField({
    super.key,
    required this.onchange,
    this.initialValue,
    this.radius = AppConstants.radius,
  });

  @override
  Widget build(BuildContext context) {
    return PhoneTextField(
      initialCountryCode: AppConstants.countryCodeISO,
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: AppHelpers.getTranslation(TrKeys.phoneNumber),
        hintStyle: Style.interNormal(size: 14, color: Style.textHint),
        contentPadding: REdgeInsets.symmetric(horizontal: 12, vertical: 16),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: Style.black,
        filled: false,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.merge(const BorderSide(color: Style.icon),
                const BorderSide(color: Style.icon)),
            borderRadius: BorderRadius.circular(radius.r)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide.merge(const BorderSide(color: Style.icon),
                const BorderSide(color: Style.icon)),
            borderRadius: BorderRadius.circular(radius.r)),
        border: OutlineInputBorder(
            borderSide: BorderSide.merge(const BorderSide(color: Style.icon),
                const BorderSide(color: Style.icon)),
            borderRadius: BorderRadius.circular(radius.r)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.merge(const BorderSide(color: Style.icon),
                const BorderSide(color: Style.icon)),
            borderRadius: BorderRadius.circular(radius.r)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.merge(const BorderSide(color: Style.icon),
                const BorderSide(color: Style.icon)),
            borderRadius: BorderRadius.circular(radius.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.merge(const BorderSide(color: Style.icon),
                const BorderSide(color: Style.icon)),
            borderRadius: BorderRadius.circular(radius.r)),
      ),
      onChanged: (s) {
        onchange.call(s.completeNumber);
      },
    );
  }
}
