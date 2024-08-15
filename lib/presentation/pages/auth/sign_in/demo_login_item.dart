import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class DemoLoginItem extends StatelessWidget {
  final String login;
  final String password;
  final VoidCallback onTap;
  const DemoLoginItem({super.key, required this.login, required this.password, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  text:
                  '${AppHelpers.getTranslation(TrKeys.login)}:',
                  style:
                  Style.interNormal(letterSpacing: -0.3),
                  children: [
                    TextSpan(
                      text:
                      ' $login',
                      style: Style.interRegular(
                        letterSpacing: -0.3,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
              ),
              4.verticalSpace,
              RichText(
                text: TextSpan(
                  text:
                  '${AppHelpers.getTranslation(TrKeys.password)}:',
                  style:
                  Style.interNormal(letterSpacing: -0.3),
                  children: [
                    TextSpan(
                      text:
                      ' $password',
                      style: Style.interRegular(
                        letterSpacing: -0.3,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          24.horizontalSpace,
          const Icon(Remix.file_copy_fill),
          const Spacer(),
        ],
      ),
    );
  }
}
