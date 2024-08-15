import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DeliverymanItem extends StatelessWidget {
  final UserData user;
  final ValueChanged<String> onTap;

  const DeliverymanItem({
    super.key,
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final status = user.invitations
            ?.where((element) => element.shopId == LocalStorage.getShop()?.id)
            .last
            .status ??
        TrKeys.unKnow;
    return Container(
      margin: REdgeInsets.only(bottom: 8),
      width: double.infinity,
      height: 108.r,
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            margin: REdgeInsets.symmetric(vertical: 12),
            decoration: ShapeDecoration(
              color: (user.invitations?.isNotEmpty ?? false)
                  ? AppHelpers.getStatusColor(status)
                  : Style.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                ),
              ),
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CommonImage(
                      url: user.img,
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
                            '${user.firstname} ${user.lastname ?? ''}',
                            style: Style.interSemi(size: 15),
                            maxLines: 1,
                          ),
                          4.verticalSpace,
                          Text(
                            user.phone ?? '',
                            style: Style.interNormal(
                                size: 12, color: Style.textColor),
                          ),
                          const Divider(height: 4),
                        ],
                      ),
                    ),
                    16.horizontalSpace,
                    if (status.isNotEmpty)
                      Padding(
                        padding:
                            REdgeInsets.only(left: 16, bottom: 8, right: 8),
                        child: StatusButton(
                          status: status,
                          onTap: () => onTap(status),
                        ),
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
                            user.email ?? '',
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
                          AppHelpers.getTranslation(user.gender ?? ""),
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
        ],
      ),
    );
  }
}
