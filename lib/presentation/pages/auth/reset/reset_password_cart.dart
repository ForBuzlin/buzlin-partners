import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class ResetPasswordCart extends ConsumerStatefulWidget {
  const ResetPasswordCart({super.key}) ;

  @override
  ConsumerState<ResetPasswordCart> createState() => _ResetPasswordCartState();
}

class _ResetPasswordCartState extends ConsumerState<ResetPasswordCart> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final notifier = ref.read(resetPasswordProvider.notifier);
    final state = ref.watch(resetPasswordProvider);
    ref.listen(resetPasswordProvider, (previous, next) {
      if (previous!.isSuccess != next.isSuccess && next.isSuccess) {
        ref.read(authProvider.notifier).switchScreen(6);
      }
    });
    return Form(
      key: formKey,
      child: Directionality(
        textDirection: LocalStorage.getLangLtr(),
        child: AbsorbPointer(
          absorbing: state.isLoading,
          child: KeyboardDisable(
            child: Container(
              padding: MediaQuery.viewInsetsOf(context) / 1.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppConstants.radius.r),
                topRight: Radius.circular(AppConstants.radius.r),
              )),
              width: double.infinity,
              child: Padding(
                padding: REdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          AppBarBottomSheet(
                            title:
                                AppHelpers.getTranslation(TrKeys.resetPassword),
                            onBack: () {
                              ref.read(authProvider.notifier).switchScreen(0);
                            },
                          ),
                          Text(
                            AppHelpers.getTranslation(TrKeys.resetPasswordText),
                            style: Style.interRegular(
                              size: 14,
                              color: Style.textColor,
                            ),
                          ),
                          32.verticalSpace,
                          if (AppConstants.isSpecificNumberEnabled)
                            IntlPhoneField(
                              cursorWidth: 1,
                              cursorColor: Style.textColor,
                              disableLengthCheck:
                              !AppConstants.isNumberLengthAlwaysSame,
                              initialCountryCode: AppConstants.countryCodeISO,
                              autovalidateMode:
                              AppConstants.isNumberLengthAlwaysSame
                                  ? AutovalidateMode.onUserInteraction
                                  : AutovalidateMode.disabled,
                              showCountryFlag: AppConstants.showFlag,
                              showDropdownIcon: AppConstants.showArrowIcon,
                              validator: (s) {
                                if (AppConstants.isNumberLengthAlwaysSame &&
                                    (s?.isValidNumber() ?? true)) {
                                  return AppHelpers.getTranslation(
                                      TrKeys.phoneNumberIsNotValid);
                                }
                                return null;
                              },
                              style: Style.interNormal(size: 14, color: Style.black),
                              onChanged: (phoneNum) {
                                controller.text = phoneNum.completeNumber;
                              },
                              dropdownTextStyle: Style.interNormal(size: 14, color: Style.black),
                              keyboardType: TextInputType.phone,
                              invalidNumberMessage:
                              AppHelpers.getTranslation(TrKeys.phoneNumberIsNotValid),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textAlignVertical: const TextAlignVertical(y: .2),
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                FloatingLabelBehavior.always,
                                fillColor: Style.black,
                                filled: false,
                                counterText: '',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AppConstants.radius),
                                    borderSide:
                                    const BorderSide(color: Style.icon)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AppConstants.radius),
                                    borderSide: const BorderSide(
                                        color: Style.icon)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AppConstants.radius),
                                    borderSide: const BorderSide(
                                        color: Style.icon)),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AppConstants.radius),
                                    borderSide: const BorderSide(
                                        color: Style.icon)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AppConstants.radius),
                                    borderSide: const BorderSide(
                                        color: Style.icon)),
                              ),
                            ),
                          if (!AppConstants.isSpecificNumberEnabled)
                          CustomTextFormField(
                            controller: controller,
                            validation: AppValidators.emptyCheck,
                            hint: TrKeys.phoneNumber,
                          ),
                        ],
                      ),
                      48.verticalSpace,
                      CustomButton(
                        isLoading: state.isLoading,
                        title: AppHelpers.getTranslation(TrKeys.send),
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            AppValidators.isValidEmail(controller.text)
                                ? notifier.sendCode(context,
                                    email: controller.text)
                                : notifier.sendCodeToNumber(context,
                                    phone: controller.text);
                          }
                        },
                      ),
                      16.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
