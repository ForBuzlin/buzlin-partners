import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';

class LogoutModal extends StatelessWidget {
  final bool isDeleteAccount;

  const LogoutModal({super.key, this.isDeleteAccount = false}) ;

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalDrag(),
            Text(
              AppHelpers.getTranslation(isDeleteAccount
                  ? TrKeys.areYouSure
                  : TrKeys.doYouReallyWantToLogout),
              style: Style.interSemi(size: 16),
              textAlign: TextAlign.center,
            ),
            40.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      borderColor: Style.black,
                      background: Style.transparent,
                      textColor: Style.black,
                      title: AppHelpers.getTranslation(TrKeys.cancel),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Consumer(builder: (context, ref, child) {
                    if (isDeleteAccount) {
                      return CustomButton(
                          background: Style.red,
                          textColor: Style.white,
                          title:
                              AppHelpers.getTranslation(TrKeys.deleteAccount),
                          onPressed: () {
                            ref
                                .read(profileProvider.notifier)
                                .deleteAccount(context);
                          });
                    } else {
                      return CustomButton(
                          title: AppHelpers.getTranslation(TrKeys.logout),
                          onPressed: () {
                            ref.refresh(mainProvider.notifier).selectIndex(0);
                            context.router.popUntilRoot();
                            context.replaceRoute(const AuthRoute());
                            ref
                                .read(profileProvider.notifier)
                                .logOut(context);
                          });
                    }
                  }),
                ),
              ],
            ),
            36.verticalSpace,
          ],
        ),
      ),
    );
  }
}
