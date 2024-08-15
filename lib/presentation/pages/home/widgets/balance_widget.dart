import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';

class BalanceWidget extends StatelessWidget {
  final Wallet? wallet;

  const BalanceWidget({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        context.pushRoute(const TransactionListRoute());
      },
      child: Container(
        height: 120.r,
        width: MediaQuery.sizeOf(context).width / 3 * 1.64,
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          boxShadow: Style.walletShadow,
           borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
          gradient: Style.walletGradient,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 27.r,
              backgroundColor: Style.white.withOpacity(.2),
              child: Padding(
                padding: REdgeInsets.only(top: 12),
                child: Center(
                  child: SvgPicture.asset(Assets.svgDollarIcon),
                ),
              ),
            ),
            5.horizontalSpace,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppHelpers.getTranslation(TrKeys.balance),
                    style: Style.interNormal(color: Style.white, size: 12),
                  ),
                  AutoSizeText(
                    AppHelpers.numberFormat(
                        number: wallet?.price ??
                            LocalStorage.getUser()?.wallet?.price,
                        isOrder: true,
                        symbol: LocalStorage.getUser()?.wallet?.symbol),
                    style: Style.interSemi(size: 16, color: Style.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 15,
                  ),
                  8.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
