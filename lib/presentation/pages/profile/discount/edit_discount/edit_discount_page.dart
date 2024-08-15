import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/application/providers.dart';
import '../../../../component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import '../add_discount/widgets/product_multiselection.dart';
import '../add_discount/widgets/type_drop_down.dart';

@RoutePage()
class EditDiscountPage extends ConsumerStatefulWidget {
  final int id;

  const EditDiscountPage(this.id, {super.key}) ;

  @override
  ConsumerState<EditDiscountPage> createState() => _EditDiscountPageState();
}

class _EditDiscountPageState extends ConsumerState<EditDiscountPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(editDiscountProvider.notifier)
          .fetchDiscountDetails(context: context, id: widget.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(editDiscountProvider);
            final event = ref.read(editDiscountProvider.notifier);
            return state.discount == null || state.isLoading
                ? const Loading()
                : SafeArea(
                    child: Padding(
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const PopButton(),
                                  Expanded(
                                      child: TitleAndIcon(
                                          title: AppHelpers.getTranslation(
                                              TrKeys.editDiscount))),
                                ],
                              ),
                              24.verticalSpace,
                              SingleImagePicker(
                                isEdit: true,
                                height: MediaQuery.sizeOf(context).width / 3,
                                width: MediaQuery.sizeOf(context).width / 3,
                                isAdding: state.discount?.img == null,
                                imageFilePath: state.imageFile,
                                imageUrl: state.discount?.img,
                                onImageChange: event.setImageFile,
                                onDelete: () => event.setImageFile(null),
                              ),
                              24.verticalSpace,
                              DiscountTypeDropDown(
                                onTap: (value) => event.setActiveIndex(value!),
                                typeValue: state.discount?.type,
                              ),
                              16.verticalSpace,
                              UnderlinedTextField(
                                label:
                                    '${AppHelpers.getTranslation(TrKeys.price)}${state.type != "fixed" ? "%" : ""}*',
                                initialText: "${state.discount?.price ?? 0}",
                                textInputAction: TextInputAction.next,
                                onChanged: event.setPrice,
                                validator: AppValidators.emptyCheck,
                                inputFormatters: [InputFormatter.currency],
                              ),
                              24.verticalSpace,
                              UnderlinedTextField(
                                textController: state.dateController,
                                readOnly: true,
                                label:
                                    '${AppHelpers.getTranslation(TrKeys.startDate)} - ${AppHelpers.getTranslation(TrKeys.endDate)}',
                                inputType: TextInputType.number,
                                onTap: () {
                                  AppHelpers.showCustomModalBottomSheet(
                                    context: context,
                                    modal: ModalWrap(
                                        body: CustomDatePicker(
                                            firstDate: DateTime.now(),
                                            onValueChanged: event.setDate)),
                                  );
                                },
                                textInputAction: TextInputAction.next,
                                onChanged: event.setPrice,
                                validator: AppValidators.emptyCheck,
                              ),
                              24.verticalSpace,
                              GestureDetector(
                                onTap: () {
                                  AppHelpers.showCustomModalBottomSheet(
                                      context: context,
                                      modal: const ModalWrap(
                                          body: MultiSelectionWidget(
                                              isEdit: true)));
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
                                          AppHelpers.getTranslation(
                                              TrKeys.select),
                                          style: Style.interNormal(
                                              size: 14, color: Style.colorGrey),
                                        )
                                      : ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: state.stocks.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Chip(
                                              backgroundColor: Style.primary,
                                              deleteIcon: Icon(
                                                Remix.close_circle_fill,
                                                size: 20.r,
                                                color: Style.white,
                                              ),
                                              onDeleted: () =>
                                                  event.deleteFromAddedProducts(
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
                                              (BuildContext context,
                                                  int index) {
                                            return 10.horizontalSpace;
                                          },
                                        ),
                                ),
                              ),
                              24.verticalSpace,
                              CustomRadio(
                                  title: TrKeys.active,
                                  subTitle: TrKeys.active,
                                  onChanged: event.changeActive,
                                  isActive: state.active),
                              24.verticalSpace,
                              CustomButton(
                                title: AppHelpers.getTranslation(TrKeys.save),
                                isLoading: state.isLoading,
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    event.updateDiscount(context, updated: () {
                                      ref
                                          .read(discountProvider.notifier)
                                          .fetchDiscounts(
                                              context: context,
                                              isRefresh: true);
                                      Navigator.pop(context);
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
