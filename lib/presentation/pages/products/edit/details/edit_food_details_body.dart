import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/products/edit/details/category/edit_food_categories_state.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'edit_food_brands_modal.dart';
import 'edit_food_units_modal.dart';
import 'edit_food_categories_modal.dart';
import 'package:venderuzmart/application/providers.dart';

class EditFoodDetailsBody extends ConsumerStatefulWidget {
  final Function() onNext;

  const EditFoodDetailsBody({super.key, required this.onNext});

  @override
  ConsumerState<EditFoodDetailsBody> createState() =>
      _EditFoodDetailsBodyState();
}

class _EditFoodDetailsBodyState extends ConsumerState<EditFoodDetailsBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(editFoodDetailsProvider);
            final categoryState = ref.watch(editFoodCategoriesProvider);
            final unitState = ref.watch(editFoodUnitsProvider);
            final notifier = ref.read(editFoodDetailsProvider.notifier);
            final brandState = ref.watch(editFoodBrandProvider);
            return state.product == null
                ? const Loading()
                : Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          16.verticalSpace,
                          state.isLoading
                              ? SizedBox(
                                  height: 200.r,
                                  child: const Center(
                                    child: Loading(),
                                  ),
                                )
                              : MultiImagePicker(
                                  onDelete: notifier.deleteImage,
                                  imageUrls: state.listOfUrls,
                                  listOfImages: state.images,
                                  onImageChange: notifier.setImageFile,
                                  onUpload: notifier.setUploadImage,
                                ),
                          16.verticalSpace,
                          UnderlinedTextField(
                            label:
                                '${AppHelpers.getTranslation(TrKeys.productTitle)}*',
                            inputType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            onChanged: notifier.setTitle,
                            initialText: state.product?.translation?.title,
                            validator: AppValidators.emptyCheck,
                          ),
                          16.verticalSpace,
                          UnderlinedTextField(
                            maxLines: 20,
                            minLines: 1,
                            label:
                                '${AppHelpers.getTranslation(TrKeys.description)}*',
                            inputType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            onChanged: notifier.setDescription,
                            initialText:
                                state.product?.translation?.description,
                            validator: AppValidators.emptyCheck,
                          ),
                          16.verticalSpace,
                          _selectCategory(categoryState),
                          16.verticalSpace,
                          UnderlinedTextField(
                            textController: brandState.brandController,
                            label:
                                '${AppHelpers.getTranslation(TrKeys.brand)}*',
                            suffixIcon: Icon(
                              Remix.arrow_down_s_line,
                              color: Style.black,
                              size: 18.r,
                            ),
                            readOnly: true,
                            onTap: () => AppHelpers.showCustomModalBottomSheet(
                              paddingTop:
                                  MediaQuery.paddingOf(context).top + 250.h,
                              context: context,
                              modal: const EditFoodBrandsModal(),
                            ),
                          ),
                          16.verticalSpace,
                          UnderlinedTextField(
                            textController: unitState.unitController,
                            label:
                                '${AppHelpers.getTranslation(TrKeys.units)}*',
                            suffixIcon: Icon(
                              Remix.arrow_down_s_line,
                              color: Style.black,
                              size: 18.r,
                            ),
                            readOnly: true,
                            onTap: () => AppHelpers.showCustomModalBottomSheet(
                              paddingTop:
                                  MediaQuery.paddingOf(context).top + 250.h,
                              context: context,
                              modal: const EditFoodUnitsModal(),
                            ),
                            validator: AppValidators.emptyCheck,
                          ),
                          16.verticalSpace,
                          UnderlinedTextField(
                            label:
                                '${AppHelpers.getTranslation(TrKeys.interval)}*',
                            inputType: TextInputType.number,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            onChanged: notifier.setTitle,
                            initialText: state.interval,
                            validator: AppValidators.emptyCheck,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                          16.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: UnderlinedTextField(
                                  label:
                                      '${AppHelpers.getTranslation(TrKeys.minQuantity)}*',
                                  inputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  initialText: state.minQty,
                                  onChanged: notifier.setMinQty,
                                  validator: AppValidators.emptyCheck,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                              16.horizontalSpace,
                              Expanded(
                                child: UnderlinedTextField(
                                  label:
                                      '${AppHelpers.getTranslation(TrKeys.maxQuantity)}*',
                                  inputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  initialText: state.maxQty,
                                  onChanged: notifier.setMaxQty,
                                  validator: (value) =>
                                      AppValidators.maxQtyCheck(
                                          value, state.minQty),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                ),
                              ),
                            ],
                          ),
                          16.verticalSpace,
                          UnderlinedTextField(
                            label:
                                '${AppHelpers.getTranslation(TrKeys.ageLimit)}*',
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            initialText: state.ageLimit.toString(),
                            onChanged: notifier.setAgeLimit,
                            validator: AppValidators.emptyCheck,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                          16.verticalSpace,
                          UnderlinedTextField(
                            label: '${AppHelpers.getTranslation(TrKeys.tax)}*',
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            initialText: state.tax,
                            onChanged: notifier.setTax,
                            validator: AppValidators.emptyCheck,
                            inputFormatters: [InputFormatter.currency],
                          ),
                          16.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: CustomRadio(
                                    title: TrKeys.status,
                                    subTitle: TrKeys.active,
                                    onChanged: notifier.setActive,
                                    isActive: state.active),
                              ),
                              Expanded(
                                child: CustomRadio(
                                  title: TrKeys.digital,
                                  subTitle: TrKeys.digital,
                                  onChanged: notifier.setDigital,
                                  isActive: state.digital,
                                ),
                              ),
                            ],
                          ),
                          40.verticalSpace,
                          CustomButton(
                            textColor: Style.white,
                            background: Style.primary,
                            title: AppHelpers.getTranslation(TrKeys.next),
                            isLoading: state.isLoading,
                            onPressed: () {
                              if (state.images.isEmpty &&
                                  state.listOfUrls.isEmpty) {
                                AppHelpers.errorSnackBar(context,
                                    text: TrKeys.pleaseSelectImage);
                                return;
                              }
                              if (_formKey.currentState?.validate() ?? false) {
                                ref
                                    .read(editFoodDetailsProvider.notifier)
                                    .updateProduct(
                                  context,
                                  unit: unitState.foodUnit,
                                  category: categoryState.selectCategory ??
                                      categoryState.oldCategory,
                                  brand: brandState.brand,
                                  updated: (product) {
                                    widget.onNext();

                                    ref
                                        .read(productsProvider.notifier)
                                        .updateSingleProduct(product);
                                  },
                                );
                              }
                            },
                          ),
                          20.verticalSpace,
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  Widget _selectCategory(EditFoodCategoriesState categoryState) {
    return Column(
      children: [
        ...categoryState.categoryControllers.mapIndexed((e, i) => Padding(
              padding: REdgeInsets.only(bottom: 8),
              child: UnderlinedTextField(
                textController: e,
                label:
                    '${AppHelpers.getTranslation(i == 0 ? TrKeys.parentCategory : i == 1 ? TrKeys.subCategory : TrKeys.productCategory)}*',
                suffixIcon: Icon(
                  Remix.arrow_down_s_line,
                  color: Style.black,
                  size: 18.r,
                ),
                readOnly: true,
                validator: AppValidators.emptyCheck,
                onTap: () {
                  if (i == 0
                      ? categoryState.categories.isNotEmpty
                      : categoryState
                              .selectCategories[i - 1].children?.isNotEmpty ??
                          false) {
                    AppHelpers.showCustomModalBottomSheet(
                      paddingTop: MediaQuery.paddingOf(context).top + 200.h,
                      context: context,
                      modal: EditFoodCategoriesModal(
                        categories: i == 0
                            ? categoryState.categories
                            : categoryState.selectCategories[i - 1].children ??
                                [],
                      ),
                    );
                  }
                },
              ),
            )),
        if (categoryState.selectCategory == null)
          UnderlinedTextField(
            textController: categoryState.oldCategory != null
                ? categoryState.categoryController
                : null,
            label: '${AppHelpers.getTranslation(TrKeys.productCategory)}*',
            suffixIcon: Icon(
              Remix.arrow_down_s_line,
              color: Style.black,
              size: 18.r,
            ),
            readOnly: true,
            validator: AppValidators.emptyCheck,
            onTap: () {
              AppHelpers.showCustomModalBottomSheet(
                paddingTop: MediaQuery.paddingOf(context).top + 200.h,
                context: context,
                modal: EditFoodCategoriesModal(
                  categories: categoryState.selectCategories.isEmpty
                      ? categoryState.categories
                      : categoryState.selectCategories.last.children ?? [],
                ),
              );
            },
          ),
      ],
    );
  }
}
