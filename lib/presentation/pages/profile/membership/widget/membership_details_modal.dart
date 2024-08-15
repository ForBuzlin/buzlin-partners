import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
class MembershipDetailsModal extends StatelessWidget {
  final UserMembershipData userMembership;

  const MembershipDetailsModal({super.key, required this.userMembership});

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
        body: Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ModalDrag(),
          CustomDetailItem(
            title: TrKeys.id,
            value: "#${userMembership.id ?? 0}",
          ),
          CustomDetailItem(
            title: TrKeys.fullName,
            value:
                "${userMembership.user?.firstname ?? TrKeys.deletedUser} ${userMembership.user?.lastname ?? ''}",
          ),
          CustomDetailItem(
            title: TrKeys.purchase,
            value: DateService.dateFormatDMY(userMembership.createdAt),
          ),
          CustomDetailItem(
            title: TrKeys.time,
            value: "${userMembership.memberShip?.time ?? 0}",
          ),
          CustomDetailItem(
            title: TrKeys.expiredAt,
            value: DateService.dateFormatDMY(userMembership.expiredAt),
          ),
          CustomDetailItem(
            title: TrKeys.membership,
            value: userMembership.memberShip?.translation?.title ?? '',
          ),
          CustomDetailItem(
            title: TrKeys.sessions,
            value: "${userMembership.memberShip?.sessions ?? 0}",
          ),
          CustomDetailItem(
            title: TrKeys.sessionsCount,
            value: "${userMembership.memberShip?.sessionsCount ?? 0}",
          ),
          CustomDetailItem(
            title: TrKeys.price,
            value: AppHelpers.numberFormat(
                number: userMembership.memberShip?.price),
          ),
          CustomDetailItem(
            title: TrKeys.transactionStatus,
            value: AppHelpers.getTranslation(
                userMembership.transaction?.status ?? TrKeys.notePaid),
          ),
          28.verticalSpace,
        ],
      ),
    ));
  }
}
