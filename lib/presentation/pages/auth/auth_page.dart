import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/application/providers.dart';
import 'confirmation/register_confirmation_cart.dart';
import 'package:auto_route/auto_route.dart';
import 'languages/languages_modal.dart';
import 'reset/reset_password_cart.dart';
import 'package:flutter/material.dart';
import 'reset/set_password_cart.dart';
import 'sign_in/login_cart.dart';
import 'sign_up/register_cart.dart';

@RoutePage()
class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(languagesProvider.notifier).checkLanguage(context),
    );
  }

  String verificationId = '';

  void selectLanguage() {
    AppHelpers.showCustomModalBottomSheet(
      isDismissible: false,
      isDrag: false,
      context: context,
      modal: LanguagesModal(
        afterUpdate: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(languagesProvider, (previous, next) {
      if (!next.isSelectLanguage &&
          !((previous?.isSelectLanguage ?? false) == next.isSelectLanguage)) {
        // selectLanguage();
      }
    });
    return KeyboardDisable(
      child: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imageSplash),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScaffold(
          backgroundColor: Style.transparent,
          body: (colors) => SafeArea(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  16.verticalSpace,
                  Row(
                    children: [
                      Text(
                        AppHelpers.getAppName(),
                        style: Style.interSemi(color: Style.white),
                      ),
                      const Spacer(),
                      Consumer(
                        builder: (context, ref, child) {
                          final state = ref.watch(authProvider);

                          return SecondButton(
                            title: state.selectIndex == 0
                                ? TrKeys.signUp
                                : TrKeys.signIn,
                            bgColor: Style.black,
                            titleColor: Style.white,
                            onTap: () {
                              ref
                                  .read(authProvider.notifier)
                                  .switchScreen(state.selectIndex == 0 ? 1 : 0);
                            },
                          );
                        },
                      ),
                      8.horizontalSpace,
                    ],
                  ),
                  const Spacer(),
                  BlurWrap(
                    radius: BorderRadius.circular(AppConstants.radius * 1.4.r),
                    child: Container(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.sizeOf(context).height - 160.h),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Style.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(
                              AppConstants.radius * 1.4.r)),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final state = ref.watch(authProvider);
                          final registerState = ref.watch(registerProvider);
                          final resetState = ref.watch(resetPasswordProvider);
                          return state.selectIndex == 0
                              ? const LoginCart()
                              : state.selectIndex == 1
                                  ? RegisterCart(
                                      isOnlyEmail: true,
                                      onChange: (s) => verificationId = s,
                                    )
                                  : state.selectIndex == 2
                                      ? RegisterConfirmationCart(
                                          verificationId: verificationId,
                                          userData: UserData(
                                              firstname:
                                                  registerState.firstName,
                                              lastname: registerState.lastName,
                                              phone: registerState.phone,
                                              email: registerState.email,
                                              password: registerState.password,
                                              confirmPassword: registerState
                                                  .confirmPassword),
                                        )
                                      : state.selectIndex == 3
                                          ? const RegisterCart(
                                              isOnlyEmail: false,
                                            )
                                          : state.selectIndex == 5
                                              ? const ResetPasswordCart()
                                              : state.selectIndex == 6
                                                  ? RegisterConfirmationCart(
                                                      verificationId: resetState
                                                          .verificationId,
                                                      userData: UserData(
                                                          phone:
                                                              resetState.phone,
                                                          email:
                                                              resetState.email),
                                                      isResetPassword: true,
                                                    )
                                                  : state.selectIndex == 7
                                                      ? const SetPasswordCart()
                                                      : const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                  24.verticalSpace
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
