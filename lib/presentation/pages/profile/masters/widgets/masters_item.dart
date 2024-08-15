import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class MastersItem extends StatelessWidget {
  final UserData? user;
  final VoidCallback onTap;
  final int spacing;

  const MastersItem({
    super.key,
    required this.user,
    required this.onTap,
    this.spacing = 1,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        context.pushRoute(EditMasterRoute(master: user));
      },
      child: Container(
        margin: REdgeInsets.only(bottom: 8),
        width: double.infinity,
        height: 108.r,
        decoration: BoxDecoration(
          color: Style.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: REdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CommonImage(
                  url: user?.img,
                  width: 48,
                  height: 48,
                  radius: 14,
                  errorRadius: 14,
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AutoSizeText(
                        '${user?.firstname} ${user?.lastname ?? ''}',
                        style: Style.interSemi(size: 15),
                        maxLines: 1,
                      ),
                      4.verticalSpace,
                      Text(
                        user?.phone ?? '',
                        style:
                            Style.interNormal(size: 12, color: Style.textColor),
                      ),
                      const Divider(height: 4),
                    ],
                  ),
                ),
                if (user?.invitations?.isNotEmpty ?? false)
                  Padding(
                    padding: REdgeInsets.only(left: 16, bottom: 8),
                    child:
                        SecondButton(title: TrKeys.changeStatus, onTap: onTap),
                  ),
              ],
            ),
            4.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppHelpers.getTranslation(TrKeys.email),
                        style: Style.interNormal(
                          size: 12,
                          color: Style.textColor,
                        ),
                      ),
                      2.verticalSpace,
                      Text(
                        user?.email ?? '',
                        style: Style.interNormal(size: 12),
                      ),
                    ],
                  ),
                ),
                12.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.gender),
                      style: Style.interNormal(
                        size: 12,
                        color: Style.textColor,
                      ),
                    ),
                    2.verticalSpace,
                    Text(
                      AppHelpers.getTranslation(user?.gender ?? ""),
                      style: Style.interNormal(size: 12),
                    ),
                  ],
                ),
                24.horizontalSpace,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
