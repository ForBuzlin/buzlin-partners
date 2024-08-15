import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import '../../../styles/style.dart';

class RegisterCart extends StatefulWidget {
  final bool isOnlyEmail;
  final ValueChanged<String>? onChange;

  const RegisterCart({super.key, required this.isOnlyEmail, this.onChange});

  @override
  State<RegisterCart> createState() => _RegisterCartState();
}

class _RegisterCartState extends State<RegisterCart> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final event = ref.read(registerProvider.notifier);
      final state = ref.watch(registerProvider);
      return KeyboardDisable(
        child: Container(
          margin: MediaQuery.viewInsetsOf(context) / 1.2,
          width: double.infinity,
          child: Padding(
            padding: REdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppHelpers.getTranslation(TrKeys.signUp),
                          style:
                              Style.interSemi(color: Style.textColor, size: 30),
                        ),
                        24.verticalSpace,
                        widget.isOnlyEmail
                            ? Column(
                                children: [
                                  if (AppConstants.isSpecificNumberEnabled)
                                    IntlPhoneField(
                                      cursorWidth: 1,
                                      cursorColor: Style.textColor,
                                      disableLengthCheck: !AppConstants
                                          .isNumberLengthAlwaysSame,
                                      initialCountryCode:
                                          AppConstants.countryCodeISO,
                                      autovalidateMode: AppConstants
                                              .isNumberLengthAlwaysSame
                                          ? AutovalidateMode.onUserInteraction
                                          : AutovalidateMode.disabled,
                                      showCountryFlag: AppConstants.showFlag,
                                      showDropdownIcon:
                                          AppConstants.showArrowIcon,
                                      validator: (s) {
                                        if (AppConstants
                                                .isNumberLengthAlwaysSame &&
                                            (s?.isValidNumber() ?? true)) {
                                          return AppHelpers.getTranslation(
                                              TrKeys.phoneNumberIsNotValid);
                                        }
                                        return null;
                                      },
                                      style: Style.interNormal(
                                          size: 14, color: Style.black),
                                      onChanged: (phoneNum) {
                                        event.setEmail(phoneNum.completeNumber);
                                      },
                                      dropdownTextStyle: Style.interNormal(
                                          size: 14, color: Style.black),
                                      keyboardType: TextInputType.phone,
                                      invalidNumberMessage:
                                          AppHelpers.getTranslation(
                                              TrKeys.phoneNumberIsNotValid),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      textAlignVertical:
                                          const TextAlignVertical(y: .2),
                                      decoration: InputDecoration(
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        fillColor: Style.black,
                                        filled: false,
                                        counterText: '',
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppConstants.radius),
                                            borderSide: const BorderSide(
                                                color: Style.icon)),
                                        errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppConstants.radius),
                                            borderSide: const BorderSide(
                                                color: Style.icon)),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppConstants.radius),
                                            borderSide: const BorderSide(
                                                color: Style.icon)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppConstants.radius),
                                            borderSide: const BorderSide(
                                                color: Style.icon)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                AppConstants.radius),
                                            borderSide: const BorderSide(
                                                color: Style.icon)),
                                      ),
                                    ),
                                  if (!AppConstants.isSpecificNumberEnabled)
                                    CustomTextFormField(
                                      validation: AppValidators.emptyCheck,
                                      hint: TrKeys.phoneNumber,
                                      onChanged: event.setEmail,
                                    ),
                                  24.verticalSpace,
                                ],
                              )
                            : const SizedBox.shrink(),
                        widget.isOnlyEmail
                            ? const SizedBox.shrink()
                            : Column(
                                children: [
                                  (state.verificationId.isEmpty)
                                      ? 24.verticalSpace
                                      : 24.verticalSpace,
                                  (state.verificationId.isEmpty)
                                      ? ((AppConstants.isSpecificNumberEnabled)
                                          ? IntlPhoneField(
                                              cursorWidth: 1,
                                              cursorColor: Style.textColor,
                                              disableLengthCheck: !AppConstants
                                                  .isNumberLengthAlwaysSame,
                                              initialCountryCode:
                                                  AppConstants.countryCodeISO,
                                              autovalidateMode: AppConstants
                                                      .isNumberLengthAlwaysSame
                                                  ? AutovalidateMode
                                                      .onUserInteraction
                                                  : AutovalidateMode.disabled,
                                              showCountryFlag:
                                                  AppConstants.showFlag,
                                              showDropdownIcon:
                                                  AppConstants.showArrowIcon,
                                              validator: (s) {
                                                if (AppConstants
                                                        .isNumberLengthAlwaysSame &&
                                                    (s?.isValidNumber() ??
                                                        true)) {
                                                  return AppHelpers
                                                      .getTranslation(TrKeys
                                                          .phoneNumberIsNotValid);
                                                }
                                                return null;
                                              },
                                              style: Style.interNormal(
                                                  size: 14, color: Style.black),
                                              onChanged: (phoneNum) {
                                                event.setPhone(
                                                    phoneNum.completeNumber);
                                              },
                                              dropdownTextStyle:
                                                  Style.interNormal(
                                                      size: 14,
                                                      color: Style.black),
                                              keyboardType: TextInputType.phone,
                                              invalidNumberMessage: AppHelpers
                                                  .getTranslation(TrKeys
                                                      .phoneNumberIsNotValid),
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              textAlignVertical:
                                                  const TextAlignVertical(
                                                      y: .2),
                                              decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior
                                                        .always,
                                                fillColor: Style.black,
                                                filled: false,
                                                counterText: '',
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    AppConstants
                                                                        .radius),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Style
                                                                    .icon)),
                                                errorBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppConstants
                                                                .radius),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Style.icon)),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppConstants
                                                                .radius),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Style.icon)),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    AppConstants
                                                                        .radius),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Style
                                                                    .icon)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    AppConstants
                                                                        .radius),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Style
                                                                    .icon)),
                                              ),
                                            )
                                          : CustomTextFormField(
                                              validation:
                                                  AppValidators.emptyCheck,
                                              hint: TrKeys.phoneNumber,
                                              onChanged: event.setPhone,
                                            ))
                                      : CustomTextFormField(
                                          validation: AppValidators.emptyCheck,
                                          hint: TrKeys.email,
                                          onChanged: event.setEmail,
                                        ),
                                  24.verticalSpace,
                                  CustomTextFormField(
                                    validation: AppValidators.emptyCheck,
                                    hint: TrKeys.firstname,
                                    onChanged: event.setFirstName,
                                  ),
                                  24.verticalSpace,
                                  CustomTextFormField(
                                    validation: AppValidators.emptyCheck,
                                    hint: TrKeys.lastname,
                                    onChanged: event.setLatName,
                                  ),
                                  24.verticalSpace,
                                  CustomTextFormField(
                                    obscure: state.showPassword,
                                    validation: AppValidators.passwordCheck,
                                    hint: TrKeys.password,
                                    onChanged: event.setPassword,
                                    suffixIcon: GestureDetector(
                                      onTap: event.toggleShowPassword,
                                      child: Icon(
                                        state.showPassword
                                            ? Remix.eye_line
                                            : Remix.eye_close_line,
                                        color: Style.icon,
                                        size: 20.r,
                                      ),
                                    ),
                                  ),
                                  24.verticalSpace,
                                  CustomTextFormField(
                                    obscure: state.showConfirmPassword,
                                    validation: (value) {
                                      return AppValidators.confirmPasswordCheck(
                                        value,
                                        state.password,
                                      );
                                    },
                                    hint: TrKeys.confirmPassword,
                                    onChanged: event.setConfirmPassword,
                                    suffixIcon: GestureDetector(
                                      onTap: event.toggleShowConfirmPassword,
                                      child: Icon(
                                        state.showPassword
                                            ? Remix.eye_line
                                            : Remix.eye_close_line,
                                        color: Style.icon,
                                        size: 20.r,
                                      ),
                                    ),
                                  ),
                                  24.verticalSpace,
                                ],
                              ),
                      ],
                    ),
                  ),
                  CustomButton(
                    isLoading: state.isLoading,
                    title: AppHelpers.getTranslation(TrKeys.signUp),
                    onPressed: () {
                      if (widget.isOnlyEmail) {
                        if (formKey.currentState?.validate() ?? false) {
                          (event.checkEmail()
                              ? event.sendCode(context, () {
                                  ref
                                      .read(authProvider.notifier)
                                      .switchScreen(2);
                                  widget.onChange?.call("");
                                })
                              : event.sendCodeToNumber(context, (s) {
                                  ref
                                      .read(authProvider.notifier)
                                      .switchScreen(2);
                                  widget.onChange?.call(s);
                                }));
                        }
                      } else {
                        if (formKey.currentState?.validate() ?? false) {
                          state.verificationId.isEmpty
                              ? event.register(context)
                              : event.registerWithPhone(context);
                        }
                      }
                    },
                  ),
                  widget.isOnlyEmail
                      ? const SizedBox.shrink()
                      : 24.verticalSpace,
                  24.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
