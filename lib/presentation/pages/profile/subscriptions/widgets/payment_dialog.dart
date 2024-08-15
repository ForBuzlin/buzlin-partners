import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class PaymentDialog extends ConsumerWidget {
  const PaymentDialog({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(subscriptionProvider);
    final notifier = ref.read(subscriptionProvider.notifier);
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: SizedBox(
        height: (state.payments?.length ?? 0) > 8
            ? MediaQuery.sizeOf(context).height / 1.6
            : MediaQuery.sizeOf(context).height / 2,
        width: MediaQuery.sizeOf(context).width / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppHelpers.getTranslation(TrKeys.selectPayment)),
            Expanded(
              child: ListView.builder(
                  padding: REdgeInsets.symmetric(vertical: 12),
                  itemCount: (state.payments?.length ?? 0),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => notifier.selectPayment(index: index),
                      child: Column(
                        children: [
                          8.verticalSpace,
                          Row(
                            children: [
                              8.horizontalSpace,
                              Icon(
                                state.selectPayment == index
                                    ? Remix.checkbox_circle_fill
                                    : Remix.checkbox_blank_circle_line,
                                color: state.selectPayment == index
                                    ? Style.primary
                                    : Style.black,
                              ),
                              10.horizontalSpace,
                              Text(
                                state.payments?[index].tag ?? "",
                                style: Style.interNormal(
                                  size: 14,
                                ),
                              )
                            ],
                          ),
                          const Divider(),
                          8.verticalSpace
                        ],
                      ),
                    );
                  }),
            ),
            CustomButton(
                height: 44,
                isLoading: state.isPaymentLoading,
                title: TrKeys.payment,
                onPressed: () {
                  notifier.payment(context, onSuccess: () {
                    notifier.fetchSubscriptions(
                        isRefresh: true, context: context);
                    ref.read(shopProvider.notifier).fetchMyShop();
                    Navigator.pop(context);
                  });
                })
          ],
        ),
      ),
    );
  }
}
