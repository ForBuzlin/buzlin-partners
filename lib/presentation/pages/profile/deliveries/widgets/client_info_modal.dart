import 'package:venderuzmart/application/profile/users/users_provider.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'client_info_item.dart';

class ClientInfoModal extends ConsumerWidget {
  const ClientInfoModal({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(usersProvider).selectedUser;
    return ModalWrap(
        body: Padding(
      padding: REdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                margin: REdgeInsets.symmetric(vertical: 12),
                decoration: ShapeDecoration(
                  color: (user?.active ?? false) ? Style.primary : Style.red,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        CommonImage(
                          url: user?.img,
                          width: 56,
                          height: 56,
                          radius: 14,
                          errorRadius: 14,
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${user?.firstname ?? ""} ${user?.lastname ?? ''}',
                                style: Style.interSemi(size: 15),
                              ),
                              4.verticalSpace,
                              Text(
                                user?.phone ?? '',
                                style: Style.interNormal(
                                    size: 14, color: Style.textColor),
                              ),
                              const Divider(
                                height: 6,
                                thickness: 1,
                              ),
                            ],
                          ),
                        ),
                        16.horizontalSpace,
                      ],
                    ),
                    8.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: ClientInfoItem(
                            label: TrKeys.id,
                            title: "${user?.id ?? " "}",
                          ),
                        ),
                        24.horizontalSpace,
                        StatusButton(
                          status: (user?.active ?? false)
                              ? TrKeys.active
                              : TrKeys.inactive,
                        ),
                        24.horizontalSpace,
                      ],
                    ),
                    ClientInfoItem(
                      label: TrKeys.email,
                      title: user?.email ?? "",
                    ),
                    ClientInfoItem(
                      label: TrKeys.gender,
                      title: AppHelpers.getTranslation(user?.gender ?? ""),
                    ),
                    // ClientInfoItem(
                    //   label: TrKeys.wallet,
                    //   title:
                    //       AppHelperss.numberFormat(number: user?.wallet?.price),
                    // ),
                    if (user?.birthday != null)
                      ClientInfoItem(
                        label: TrKeys.dateOfBirth,
                        title: DateService.dateFormatDay(user?.birthday),
                      ),
                    12.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
