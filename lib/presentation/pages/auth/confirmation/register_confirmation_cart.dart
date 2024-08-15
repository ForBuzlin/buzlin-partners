// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class RegisterConfirmationCart extends ConsumerStatefulWidget {
  final UserData userData;
  final bool isResetPassword;
  final String verificationId;

  const RegisterConfirmationCart({
   super.key,
    required this.userData,
    this.isResetPassword = false,
    required this.verificationId,
  }) ;

  @override
  ConsumerState<RegisterConfirmationCart> createState() =>
      _RegisterConfirmationScreenState();
}

class _RegisterConfirmationScreenState
    extends ConsumerState<RegisterConfirmationCart> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.refresh(registerConfirmationProvider);
      ref.read(registerConfirmationProvider.notifier).startTimer();
    });
  }

  @override
  void deactivate() {
    ref.read(registerConfirmationProvider.notifier).disposeTimer();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(registerConfirmationProvider.notifier);
    final state = ref.watch(registerConfirmationProvider);
    final bool isDarkMode = LocalStorage.getAppThemeMode();

    ref.listen(registerConfirmationProvider, (previous, next) {
      if (previous!.isSuccess != next.isSuccess && next.isSuccess) {
        ref.read(authProvider.notifier).switchScreen(3);
      }
      if (previous.isResetPasswordSuccess != next.isResetPasswordSuccess &&
          next.isResetPasswordSuccess) {
        ref.read(authProvider.notifier).switchScreen(7);
      }
    });
    return AbsorbPointer(
      absorbing: state.isLoading || state.isResending,
      child: KeyboardDisable(
        child: Container(
          padding: MediaQuery.viewInsetsOf(context) / 2,
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
                        title: AppHelpers.getTranslation(TrKeys.enterOtp),
                        onBack: () {
                          ref
                              .read(authProvider.notifier)
                              .switchScreen(widget.isResetPassword ? 5 : 1);
                        },
                      ),
                      Text(
                        AppHelpers.getTranslation(TrKeys.sendOtp),
                        style: Style.interRegular(
                          size: 14,
                          color: Style.black,
                        ),
                      ),
                      Text(
                        widget.userData.email ?? "",
                        style: Style.interRegular(
                          size: 14,
                          color: Style.black,
                        ),
                      ),
                      40.verticalSpace,
                      SizedBox(
                        height: 64,
                        child: PinFieldAutoFill(
                          codeLength: 6,
                          currentCode: state.confirmCode,
                          onCodeChanged: notifier.setCode,
                          cursor: Cursor(
                            width: 1,
                            height: 24,
                            color: isDarkMode ? Style.white : Style.black,
                            enabled: true,
                          ),
                          decoration: BoxLooseDecoration(
                            gapSpace: 10.r,
                            textStyle: Style.interNormal(
                              size: 15,
                              color: isDarkMode ? Style.white : Style.black,
                            ),
                            bgColorBuilder: FixedColorBuilder(
                              isDarkMode ? Style.black : Style.transparent,
                            ),
                            strokeColorBuilder: FixedColorBuilder(
                              state.isCodeError
                                  ? Style.red
                                  : isDarkMode
                                      ? Style.borderColor
                                      : Style.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.paddingOf(context).bottom,
                        top: 120.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomButton(
                            isLoading: state.isResending,
                            title: state.isTimeExpired
                                ? AppHelpers.getTranslation(TrKeys.resendOtp)
                                : state.timerText,
                            onPressed: () {
                              if (state.isTimeExpired) {
                                widget.verificationId.isEmpty
                                    ? notifier.resendConfirmation(
                                        context, widget.userData.email ?? "",
                                        isResetPassword: widget.isResetPassword)
                                    : notifier.sendCodeToNumber(
                                        context,
                                        widget.userData.phone ?? "",
                                      );
                                notifier.startTimer();
                              }
                            },
                          ),
                        ),
                        16.horizontalSpace,
                        Expanded(
                          child: CustomButton(
                            isLoading: state.isLoading,
                            title:
                                AppHelpers.getTranslation(TrKeys.confirmation),
                            onPressed: () {
                              if (state.confirmCode.length == 6) {
                                if (widget.isResetPassword) {
                                  widget.verificationId.isEmpty
                                      ? notifier.confirmCodeResetPassword(
                                          context, widget.userData.email ?? "")
                                      : notifier
                                          .confirmCodeResetPasswordWithPhone(
                                              context,
                                              widget.userData.phone ?? "",
                                              widget.verificationId, (v) {
                                          ref
                                              .read(resetPasswordProvider
                                                  .notifier)
                                              .setVerifyId(v);
                                          ref
                                              .read(resetPasswordProvider
                                                  .notifier)
                                              .setPhone(widget.userData.phone);
                                        });
                                } else {
                                  widget.verificationId.isEmpty
                                      ? notifier.confirmCode(context)
                                      : notifier.confirmCodeWithFirebase(
                                          context: context,
                                          verificationId: widget.verificationId,
                                          onSuccess: (String value) {
                                            ref
                                                .read(registerProvider.notifier)
                                                .setId(value);
                                          });
                                }
                              }
                            },
                            background: state.isConfirm
                                ? Style.primary
                                : Style.greyColor,
                            textColor:
                                state.isConfirm ? Style.white : Style.colorGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
