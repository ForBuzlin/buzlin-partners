import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'widgets/product_multiselection.dart';
import 'widgets/type_drop_down.dart';

@RoutePage()
class AddDiscountPage extends ConsumerStatefulWidget {
  const AddDiscountPage({super.key});

  @override
  ConsumerState<AddDiscountPage> createState() => _AddDiscountPageState();
}

class _AddDiscountPageState extends ConsumerState<AddDiscountPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => ref.read(addDiscountProvider.notifier).clear());
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBar(
                child: Row(
              children: [
                const PopButton(),
                Text(AppHelpers.getTranslation(TrKeys.discount)),
              ],
            )),
            Expanded(
              child: SingleChildScrollView(
                padding: REdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                child: Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(addDiscountProvider);
                    final notifier = ref.read(addDiscountProvider.notifier);
                    return Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          16.verticalSpace,
                          SingleImagePicker(
                            height: MediaQuery.sizeOf(context).width / 3,
                            width: MediaQuery.sizeOf(context).width / 3,
                            imageFilePath: state.imageFile,
                            onImageChange: notifier.setImageFile,
                            onDelete: () => notifier.setImageFile(null),
                          ),
                          24.verticalSpace,
                          DiscountTypeDropDown(
                            onTap: (value) => notifier.setActiveIndex(value!),
                          ),
                          16.verticalSpace,
                          UnderlinedTextField(
                            label:
                                '${AppHelpers.getTranslation(TrKeys.price)}${state.type != "fixed" ? "%" : ""}*',
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: notifier.setPrice,
                            validator: AppValidators.emptyCheck,
                            inputFormatters: [InputFormatter.currency],
                          ),
                          24.verticalSpace,
                          UnderlinedTextField(
                            textController: state.dateController,
                            label:
                                '${AppHelpers.getTranslation(TrKeys.startDate)} - ${AppHelpers.getTranslation(TrKeys.endDate)}',
                            inputType: TextInputType.number,
                            onTap: () {
                              AppHelpers.showCustomModalBottomSheet(
                                context: context,
                                modal: ModalWrap(
                                    body: CustomDatePicker(
                                  firstDate: DateTime.now(),
                                  onValueChanged: notifier.setDate,
                                )),
                              );
                            },
                            textInputAction: TextInputAction.next,
                            onChanged: notifier.setPrice,
                            validator: AppValidators.emptyCheck,
                          ),
                          24.verticalSpace,
                          GestureDetector(
                            onTap: () {
                              AppHelpers.showCustomModalBottomSheet(
                                  context: context,
                                  modal: const ModalWrap(
                                      body: MultiSelectionWidget()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Style.colorGrey,
                                          width: 0.5.r))),
                              height: 30.r,
                              width: MediaQuery.sizeOf(context).width,
                              child: state.stocks.isEmpty
                                  ? Text(
                                      AppHelpers.getTranslation(TrKeys.select),
                                      style: Style.interNormal(
                                          size: 14, color: Style.colorGrey),
                                    )
                                  : ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: state.stocks.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Chip(
                                          backgroundColor: Style.primary,
                                          deleteIcon: Icon(
                                            Remix.close_circle_fill,
                                            size: 20.r,
                                            color: Style.white,
                                          ),
                                          onDeleted: () =>
                                              notifier.deleteFromAddedProducts(
                                                  state.stocks[index].id),
                                          label: Text(
                                            state.stocks[index].product
                                                    ?.translation?.title ??
                                                "",
                                            style: Style.interNormal(
                                                color: Style.white),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return 10.horizontalSpace;
                                      },
                                    ),
                            ),
                          ),
                          24.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: CustomRadio(
                                    title: TrKeys.status,
                                    subTitle: state.active
                                        ? state.active
                                            ? TrKeys.active
                                            : TrKeys.nonActive
                                        : TrKeys.nonActive,
                                    onChanged: (c) =>
                                        notifier.setActive(!(state.active)),
                                    isActive: state.active),
                              ),
                            ],
                          ),
                          120.verticalSpace,
                          CustomButton(
                            textColor: Style.white,
                            title: AppHelpers.getTranslation(TrKeys.save),
                            isLoading: state.isLoading,
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                notifier.createDiscount(context, created: () {
                                  //widget.onSave();
                                  AppHelpers.successSnackBar(
                                    context,
                                    text: AppHelpers.getTranslation(
                                        TrKeys.successfullyCreated),
                                  );
                                  ref
                                      .read(discountProvider.notifier)
                                      .fetchDiscounts(
                                          context: context, isRefresh: true);
                                  Navigator.pop(context);
                                }, onError: () {});
                              }
                            },
                          ),
                          20.verticalSpace,
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
