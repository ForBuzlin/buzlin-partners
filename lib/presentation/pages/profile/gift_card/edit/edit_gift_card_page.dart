import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/gift_cards/edit/edit_gift_card_notifier.dart';
import 'package:venderuzmart/application/gift_cards/edit/edit_gift_card_provider.dart';
import 'package:venderuzmart/application/gift_cards/gift_card_provider.dart';
import 'package:venderuzmart/infrastructure/models/data/gift_card_data.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import '../../../../component/components.dart';

@RoutePage()
class EditGiftCardPage extends ConsumerStatefulWidget {
  final GiftCardData? giftCardData;

  const EditGiftCardPage({super.key, required this.giftCardData});

  @override
  ConsumerState<EditGiftCardPage> createState() => _EditGiftCardPageState();
}

class _EditGiftCardPageState extends ConsumerState<EditGiftCardPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController desc;
  late TextEditingController price;
  late EditGiftCardNotifier notifier;

  @override
  void initState() {
    title = TextEditingController(
      text: widget.giftCardData?.translation?.title ?? '',
    );
    desc = TextEditingController(
      text: widget.giftCardData?.translations?.first.description ?? '',
    );
    price = TextEditingController(text: "${widget.giftCardData?.price ?? ''}");

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(editGiftCardProvider.notifier)
          .fetchGiftCardDetails(
        context: context,
        giftCard: widget.giftCardData,
        onSuccess: (description){
          desc.text = description ?? '';
        },
      )
    );
  }

  @override
  void didChangeDependencies() {
    notifier = ref.read(editGiftCardProvider.notifier);
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
    final state = ref.watch(editGiftCardProvider);
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
                        Text(AppHelpers.getTranslation(TrKeys.editGiftCard)),
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
                              validator: AppValidators.emptyCheck,
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
                                title: TrKeys.active,
                                subTitle: TrKeys.active,
                                onChanged: notifier.setActive,
                                isActive: state.active),
                            16.verticalSpace,
                            CustomButton(
                                title: AppHelpers.getTranslation(TrKeys.save),
                                isLoading: state.isLoading,
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    if (state.giftCardData?.time == null) {
                                      AppHelpers.errorSnackBar(
                                        context,
                                        text: AppHelpers.getTranslation(
                                          TrKeys.selectTime,
                                        ),
                                      );
                                    } else {
                                      notifier.updateGiftCard(
                                        context,
                                        updated: (value) {
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
                                  }
                                }),
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
