import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/application/providers.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final number = AppHelpers.numberFormat(
      number: ref.watch(profileProvider).userData?.wallet?.price ??
          LocalStorage.getUser()?.wallet?.price,
      isOrder: true,
      symbol:  LocalStorage.getUser()?.wallet?.symbol,
    );
    return ButtonEffectAnimation(
      onTap: () => context.pushRoute(const TransactionListRoute()),
      child: Container(
        height: 56.r,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            color: Style.newBoxColor,
            borderRadius: BorderRadius.circular(16.r)),
        child: Row(
          children: [
            const Icon(Remix.wallet_3_line),
            8.horizontalSpace,
            if (number.length < 12)
              Text(
                "${AppHelpers.getTranslation(TrKeys.wallet)} : ",
                style: Style.interNormal(size: 16),
              ),
            Expanded(
              child: AutoSizeText(
                number,
                style: Style.interNormal(size: 16),
                maxLines: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
