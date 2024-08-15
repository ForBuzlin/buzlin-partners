import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class SetPasswordCart extends ConsumerStatefulWidget {
  const SetPasswordCart({super.key}) ;

  @override
  ConsumerState<SetPasswordCart> createState() => _SetPasswordCartState();
}

class _SetPasswordCartState extends ConsumerState<SetPasswordCart> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController confirmPassword;

  @override
  void initState() {
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(resetPasswordProvider.notifier);
    final state = ref.watch(resetPasswordProvider);
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: AbsorbPointer(
        absorbing: state.isLoading,
        child: KeyboardDisable(
          child: Container(
            padding: MediaQuery.viewInsetsOf(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppConstants.radius.r),
              topRight: Radius.circular(AppConstants.radius.r),
            )),
            width: double.infinity,
            child: Padding(
              padding: REdgeInsets.all(16),
              child: Form(
                key: formKey,
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
                              ref.read(authProvider.notifier).switchScreen(5);
                            },
                          ),
                          40.verticalSpace,
                          UnderlinedTextField(
                            label: AppHelpers.getTranslation(TrKeys.password)
                                .toUpperCase(),
                            textController: password,
                            obscure: state.showPassword,
                            suffixIcon: IconButton(
                              splashRadius: 25,
                              icon: Icon(
                                state.showPassword
                                    ? Remix.eye_line
                                    : Remix.eye_close_line,
                                size: 20.r,
                              ),
                              onPressed: () => notifier.toggleShowPassword(),
                            ),
                          ),
                          34.verticalSpace,
                          UnderlinedTextField(
                            label: AppHelpers.getTranslation(TrKeys.password)
                                .toUpperCase(),
                            textController: confirmPassword,
                            obscure: state.showConfirmPassword,
                            suffixIcon: IconButton(
                              splashRadius: 25,
                              icon: Icon(
                                state.showConfirmPassword
                                    ? Remix.eye_line
                                    : Remix.eye_close_line,
                                size: 20.r,
                              ),
                              onPressed: () =>
                                  notifier.toggleShowConfirmPassword(),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.paddingOf(context).bottom,
                            top: 64.h),
                        child: CustomButton(
                          isLoading: state.isLoading,
                          title: AppHelpers.getTranslation(TrKeys.save),
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              if (AppValidators.isValidConfirmPassword(
                                      password.text, confirmPassword.text) ==
                                  null) {
                                notifier.setResetPassword(
                                  context,
                                  onSuccess: () {
                                    ref
                                        .read(notificationProvider.notifier)
                                        .fetchCount(context);
                                    ref
                                        .read(authProvider.notifier)
                                        .switchScreen(0);
                                  },
                                  password: password.text,
                                );
                              } else {
                                AppHelpers.errorSnackBar(context,
                                    text: AppHelpers.getTranslation(
                                        TrKeys.passwordNoCorrect));
                              }
                            }
                          },
                        ),
                      ),
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
