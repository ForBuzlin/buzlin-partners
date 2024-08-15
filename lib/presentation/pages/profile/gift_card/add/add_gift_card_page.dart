import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/gift_cards/add/add_gift_card_notifier.dart';
import 'package:venderuzmart/application/gift_cards/add/add_gift_card_provider.dart';
import 'package:venderuzmart/application/gift_cards/gift_card_provider.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

@RoutePage()
class AddGiftCardPage extends ConsumerStatefulWidget {
  const AddGiftCardPage({super.key});

  @override
  ConsumerState<AddGiftCardPage> createState() => _AddGiftCardPageState();
}

class _AddGiftCardPageState extends ConsumerState<AddGiftCardPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController desc;
  late TextEditingController price;
  late AddGiftCardNotifier notifier;

  @override
  void initState() {
    title = TextEditingController();
    desc = TextEditingController();
    price = TextEditingController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(addGiftCardProvider.notifier).clear(),
    );
  }

  @override
  void didChangeDependencies() {
    notifier = ref.read(addGiftCardProvider.notifier);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    title.dispose();
    desc.dispose();
    price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addGiftCardProvider);
    return KeyboardDisable(
      child: Scaffold(
        body: state.giftCardData == null || state.isLoading
            ? const Loading()
            : Column(
                children: [
                  CommonAppBar(
                    child: Row(
                      children: [
                        const PopButton(),
                        Text(AppHelpers.getTranslation(TrKeys.addGiftCard)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        padding: REdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            24.verticalSpace,
                            UnderlinedTextField(
                              label:
                                  '${AppHelpers.getTranslation(TrKeys.title)}*',
                              textInputAction: TextInputAction.next,
                              textController: title,
                              validator: AppValidators.emptyCheck,
                            ),
                            12.verticalSpace,
                            UnderlinedTextField(
                              label:
                                  '${AppHelpers.getTranslation(TrKeys.description)}*',
                              textInputAction: TextInputAction.next,
                              textController: desc,
                              validator: AppValidators.emptyCheck,
                            ),
                            12.verticalSpace,
                            UnderlinedTextField(
                              label: AppHelpers.getPriceLabel,
                              textInputAction: TextInputAction.next,
                              textController: price,
                              inputFormatters: [InputFormatter.currency],
                              validator: AppValidators.isNumberValidator,
                            ),
                            12.verticalSpace,
                            UnderlineDropDown(
                              value: state.giftCardData?.time,
                              list: DropDownValues.timeOptionsList,
                              onChanged: notifier.setTime,
                              label: TrKeys.time,
                            ),
                            12.verticalSpace,
                            CustomRadio(
                                title: TrKeys.status,
                                subTitle: state.active
                                    ? state.active
                                    ? TrKeys.active
                                    : TrKeys.nonActive
                                    : TrKeys.nonActive,
                                onChanged: (c) =>
                                    notifier.setActive(!(state.active)),
                                isActive: state.active),
                            16.verticalSpace,
                            CustomButton(
                              title: AppHelpers.getTranslation(TrKeys.save),
                              isLoading: state.isLoading,
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  state.giftCardData?.time == null ?
                                  AppHelpers.errorSnackBar(
                                    context,
                                    text: AppHelpers.getTranslation(
                                        TrKeys.selectTime),
                                  )
                                      : notifier.createGiftCard(
                                    context,
                                    created: () {
                                      ref
                                          .read(giftCardProvider.notifier)
                                          .fetchGiftCards(
                                        context: context,
                                        isRefresh: true,
                                      );
                                      Navigator.pop(context);
                                    },
                                    title: title.text,
                                    description: desc.text,
                                    price: price.text,
                                  );
                                }
                              },
                            ),
                            56.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
