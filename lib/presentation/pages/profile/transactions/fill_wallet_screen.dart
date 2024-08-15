import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter/material.dart';

class FillWalletScreen extends ConsumerStatefulWidget {
  const FillWalletScreen({super.key});

  @override
  ConsumerState<FillWalletScreen> createState() => _FillWalletScreenState();
}

class _FillWalletScreenState extends ConsumerState<FillWalletScreen> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  late TextEditingController priceController;

  @override
  void initState() {
    priceController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(walletProvider.notifier).fetchPayments(context: context);
    });
    super.initState();
  }

  @override
  void deactivate() {
    priceController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(walletProvider);
    final notifier = ref.read(walletProvider.notifier);
    return KeyboardDismisser(
      child: ModalWrap(
        body: Form(
          key: form,
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ModalDrag(),
                Text(
                  AppHelpers.getTranslation(TrKeys.fillWallet),
                  style: Style.interNormal(),
                ),
                16.verticalSpace,
                CustomTextFormField(
                  hint: AppHelpers.getPriceLabel,
                  validation: AppValidators.emptyCheck,
                  controller: priceController,
                  inputType: TextInputType.number,
                  inputFormatters: [InputFormatter.currency],
                ),
                16.verticalSpace,
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: state.list?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => notifier.selectPayment(index: index),
                          child: Column(
                            children: [
                              8.verticalSpace,
                              Row(
                                children: [
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
                                    AppHelpers.getTranslation(
                                        state.list?[index].tag ?? ""),
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
                16.verticalSpace,
                CustomButton(
                    isLoading: state.isButtonLoading,
                    title: AppHelpers.getTranslation(TrKeys.pay),
                    onPressed: () {
                      if (form.currentState?.validate() ?? false) {
                        if (state.list?.isEmpty ?? true) {
                          AppHelpers.openDialog(
                              context: context, title: TrKeys.noPaymentMethods);
                          return;
                        }
                        notifier.fillWallet(
                            context: context,
                            price: priceController.text,
                            onSuccess: () {
                              notifier.fetchTransactions(
                                  context: context, isRefresh: true);
                              ref
                                  .read(profileProvider.notifier)
                                  .fetchUser(context);
                              if ((state.list?[state.selectPayment].tag ==
                                  TrKeys.maksekeskus)) {
                                Navigator.pop(context);
                              }
                              Navigator.pop(context);
                            });
                      }
                    }),
                28.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
