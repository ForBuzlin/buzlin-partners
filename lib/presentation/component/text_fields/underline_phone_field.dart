import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_text_field/phone_text_field.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class UnderlinePhoneField extends StatelessWidget {
  final ValueChanged<String> onchange;
  final String? initialValue;
  final bool isHint;

  const UnderlinePhoneField(
      {super.key,
      required this.onchange,
      this.initialValue,
      this.isHint = false});

  @override
  Widget build(BuildContext context) {
    return PhoneTextField(
      initialCountryCode: AppConstants.countryCodeISO,
      initialValue: initialValue,
      decoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(
          maxHeight: 30.r,
          maxWidth: 30.r,
        ),
        labelText:
            isHint ? null : AppHelpers.getTranslation(TrKeys.phoneNumber),
        hintText:
            !isHint ? null : AppHelpers.getTranslation(TrKeys.phoneNumber),
        hintStyle: Style.interNormal(
          size: 12,
          color: Style.textColor,
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
      onChanged: (s) {
        onchange.call(s.completeNumber);
      },
    );
  }
}
