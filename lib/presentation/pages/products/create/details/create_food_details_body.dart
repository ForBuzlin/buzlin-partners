import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'food_brands_modal.dart';
import 'food_categories_modal.dart';
import 'create_food_units_modal.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class CreateFoodDetailsBody extends ConsumerStatefulWidget {
  final Function() onNext;

  const CreateFoodDetailsBody({super.key, required this.onNext});

  @override
  ConsumerState<CreateFoodDetailsBody> createState() =>
      _CreateFoodDetailsBodyState();
}

class _CreateFoodDetailsBodyState extends ConsumerState<CreateFoodDetailsBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(createFoodDetailsProvider.notifier).clearAll();
      ref.read(createFoodUnitsProvider.notifier).clearAll();
      ref.read(createFoodBrandProvider.notifier).clearAll();
      ref
          .read(addFoodCategoriesProvider.notifier)
          .setCategories(ref.watch(foodCategoriesProvider).categories);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(createFoodDetailsProvider);
              final categoryState = ref.watch(addFoodCategoriesProvider);
              final categoryNotifier =
                  ref.read(addFoodCategoriesProvider.notifier);
              final unitState = ref.watch(createFoodUnitsProvider);
              final brandState = ref.watch(createFoodBrandProvider);
              final categoriesState = ref.watch(foodCategoriesProvider);
              final notifier = ref.read(createFoodDetailsProvider.notifier);
              final foodsEvent = ref.read(productsProvider.notifier);
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    16.verticalSpace,
                    MultiImagePicker(
                      onDelete: (value) => notifier.deleteImage(value),
                      listOfImages: state.images,
                      imageUrls: state.listOfUrls,
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
                      validator: AppValidators.emptyCheck,
                    ),
                    16.verticalSpace,
                    UnderlinedTextField(
                      label:
                          '${AppHelpers.getTranslation(TrKeys.description)}*',
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onChanged: notifier.setDescription,
                      validator: AppValidators.emptyCheck,
                      maxLines: 20,
                      minLines: 1,
                    ),
                    16.verticalSpace,
                    _selectCategory(
                        categoryState, categoryNotifier, categoriesState),
                    16.verticalSpace,
                    Consumer(
                      builder: (context, ref, child) {
                        return UnderlinedTextField(
                          textController: brandState.brandController,
                          label: '${AppHelpers.getTranslation(TrKeys.brand)}*',
                          suffixIcon: Icon(
                            Remix.arrow_down_s_line,
                            color: Style.black,
                            size: 18.r,
                          ),
                          readOnly: true,
                          onTap: () =>
                              AppHelpers.showCustomModalBottomDragSheet(
                            paddingTop:
                                MediaQuery.paddingOf(context).top + 180.h,
                            context: context,
                            modal: (s) => const FoodBrandsModal(),
                          ),
                        );
                      },
                    ),
                    16.verticalSpace,
                    Consumer(
                      builder: (context, ref, child) {
                        return UnderlinedTextField(
                          textController: unitState.unitController,
                          label: '${AppHelpers.getTranslation(TrKeys.units)}*',
                          suffixIcon: Icon(
                            Remix.arrow_down_s_line,
                            color: Style.black,
                            size: 18.r,
                          ),
                          readOnly: true,
                          validator: AppValidators.emptyCheck,
                          onTap: () => AppHelpers.showCustomModalBottomSheet(
                            paddingTop:
                                MediaQuery.paddingOf(context).top + 400.h,
                            context: context,
                            modal: const CreateFoodUnitsModal(),
                          ),
                        );
                      },
                    ),
                    16.verticalSpace,
                    UnderlinedTextField(
                      initialText: state.interval,
                      label: '${AppHelpers.getTranslation(TrKeys.interval)}*',
                      inputType: TextInputType.number,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onChanged: notifier.setInterval,
                      validator: AppValidators.minQtyCheck,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    16.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: UnderlinedTextField(
                            initialText: state.minQty,
                            label:
                                '${AppHelpers.getTranslation(TrKeys.minQuantity)}*',
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: notifier.setMinQty,
                            validator: (value) =>
                                AppValidators.minQtyCheck(value),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: UnderlinedTextField(
                            label:
                                '${AppHelpers.getTranslation(TrKeys.maxQuantity)}*',
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: notifier.setMaxQty,
                            validator: (value) =>
                                AppValidators.maxQtyCheck(value, state.minQty),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ],
                    ),
                    16.verticalSpace,
                    UnderlinedTextField(
                      initialText: state.tax,
                      label: '${AppHelpers.getTranslation(TrKeys.tax)}*',
                      inputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onChanged: notifier.setTax,
                      validator: AppValidators.emptyCheck,
                      inputFormatters: [InputFormatter.currency],
                    ),
                    16.verticalSpace,
                    UnderlinedTextField(
                      initialText: state.ageLimit,
                      label: '${AppHelpers.getTranslation(TrKeys.ageLimit)}*',
                      inputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onChanged: notifier.setAgeLimit,
                      validator: AppValidators.emptyCheck,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    16.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: CustomRadio(
                            title: TrKeys.status,
                            subTitle: TrKeys.active,
                            onChanged: notifier.setActive,
                            isActive: state.active,
                          ),
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
                      title: AppHelpers.getTranslation(TrKeys.next),
                      isLoading: state.isCreating,
                      onPressed: () {
                        if (state.images.isEmpty) {
                          AppHelpers.errorSnackBar(context,
                              text: TrKeys.pleaseSelectImage);
                          return;
                        }
                        if (_formKey.currentState?.validate() ?? false) {
                          notifier.createProduct(context,
                              categoryId: categoryState.selectCategory?.id,
                              unitId: unitState.units[unitState.activeIndex].id,
                              brandId: brandState.brands[brandState.activeIndex]
                                  .id, created: () {
                            widget.onNext();
                            AppHelpers.successSnackBar(
                              context,
                              text: AppHelpers.getTranslation(
                                  TrKeys.successfullyCreated),
                            );
                            foodsEvent.fetchProducts(isRefresh: true);
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
    );
  }

  Consumer _selectCategory(
      AddFoodCategoriesState categoryState,
      AddFoodCategoriesNotifier categoryNotifier,
      FoodCategoriesState categoriesState) {
    return Consumer(
      builder: (context, ref, child) {
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
                          : categoryState.selectCategories[i - 1].children
                                  ?.isNotEmpty ??
                              false) {
                        AppHelpers.showCustomModalBottomSheet(
                          paddingTop: MediaQuery.paddingOf(context).top + 200.h,
                          context: context,
                          modal: FoodCategoriesModal(
                            categories: i == 0
                                ? categoryState.categories
                                : categoryState
                                        .selectCategories[i - 1].children ??
                                    [],
                            onSelect: categoryNotifier.setSelectCategory,
                            onChange: categoryNotifier.setActiveIndex,
                          ),
                        );
                      }
                    },
                  ),
                )),
            if (categoryState.selectCategory == null ||
                categoriesState.isLoading)
              UnderlinedTextField(
                label: '${AppHelpers.getTranslation(TrKeys.productCategory)}*',
                suffixIcon: Icon(
                  Remix.arrow_down_s_line,
                  color: Style.black,
                  size: 18.r,
                ),
                initialText: categoriesState.isLoading ? "....." : "",
                readOnly: true,
                validator: AppValidators.emptyCheck,
                onTap: () {
                  AppHelpers.showCustomModalBottomSheet(
                    paddingTop: MediaQuery.paddingOf(context).top + 200.h,
                    context: context,
                    modal: FoodCategoriesModal(
                      categories: categoryState.selectCategories.isEmpty
                          ? categoryState.categories
                          : categoryState.selectCategories.last.children ?? [],
                      onSelect: categoryNotifier.setSelectCategory,
                      onChange: categoryNotifier.setActiveIndex,
                    ),
                  );
                },
              ),
          ],
        );
      },
    );
  }
}
