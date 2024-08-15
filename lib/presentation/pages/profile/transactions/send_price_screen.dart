import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'package:venderuzmart/application/providers.dart';

class SendPriceScreen extends ConsumerStatefulWidget {
  const SendPriceScreen({super.key});

  @override
  ConsumerState<SendPriceScreen> createState() => _SenPriceScreenState();
}

class _SenPriceScreenState extends ConsumerState<SendPriceScreen> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final delayed = Delayed(milliseconds: 700);
  late TextEditingController priceController;
  late TextEditingController userController;
  UserData? user;

  @override
  void initState() {
    priceController = TextEditingController();
    userController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  void deactivate() {
    priceController.dispose();
    userController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(walletProvider);
    final notifier = ref.read(walletProvider.notifier);
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ModalDrag(),
              Text(
                AppHelpers.getTranslation(TrKeys.send),
                style: Style.interNormal(),
              ),
              16.verticalSpace,
              CustomTextFormField(
                hint: AppHelpers.getPriceLabel,
                validation: AppValidators.emptyCheck,
                controller: priceController,
                inputFormatters: [InputFormatter.currency],
                inputType: TextInputType.number,
              ),
              16.verticalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      hint: TrKeys.searchUser,
                      validation: AppValidators.emptyCheck,
                      controller: userController,
                      onChanged: (text) {
                        delayed.run(() {
                          notifier.searchUser(
                              context: context, search: text, isRefresh: true);
                        });
                      },
                    ),
                    state.isSearchingLoading
                        ? const Loading()
                        : Expanded(
                            child: ListView.builder(
                                padding: EdgeInsets.only(top: 16.r),
                                itemCount: state.listOfUser?.length ?? 0,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return UserItem(
                                    isEmail: false,
                                    user: state.listOfUser?[index],
                                    onTap: () {
                                      userController.text =
                                          "${state.listOfUser?[index].firstname ?? ""} ${state.listOfUser?[index].lastname ?? ""}";
                                      user = state.listOfUser?[index];
                                    },
                                    isSelected: false,
                                  );
                                }),
                          )
                  ],
                ),
              ),
              CustomButton(
                  isLoading: state.isButtonLoading,
                  title: AppHelpers.getTranslation(TrKeys.pay),
                  onPressed: () {
                    if (form.currentState?.validate() ?? false) {
                      notifier.sendWallet(
                          context: context,
                          price: priceController.text,
                          onSuccess: () {
                            notifier.fetchTransactions(
                                context: context, isRefresh: true);
                            ref
                                .read(profileProvider.notifier)
                                .fetchUser(context);
                            Navigator.pop(context);
                          },
                          uuid: user?.uuid ?? '');
                    }
                  }),
              28.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
