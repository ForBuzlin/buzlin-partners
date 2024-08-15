import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/pages/products/create/details/food_categories_modal.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

@RoutePage()
class EditCategoryPage extends StatelessWidget {
  final bool isService;

  EditCategoryPage({super.key, this.isService = false});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(editCategoryProvider);
          final notifier = ref.read(editCategoryProvider.notifier);
          final categoryState = ref.watch(editCategoryParentProvider);
          final categoryNotifier =
          ref.read(editCategoryParentProvider.notifier);
        return KeyboardDisable(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: state.isLoading
                ? const Loading()
                : SafeArea(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const PopButton(),
                              Expanded(
                                  child: TitleAndIcon(
                                      title: state.category?.translation
                                          ?.title ??
                                          "")),
                            ],
                          ),
                          24.verticalSpace,
                          SingleImagePicker(
                            isEdit: true,
                            height: MediaQuery.sizeOf(context).width / 3,
                            width: MediaQuery.sizeOf(context).width / 3,
                            isAdding: state.category?.img == null,
                            imageFilePath: state.imageFile,
                            imageUrl: state.category?.img,
                            onImageChange: notifier.setImageFile,
                            onDelete: () => notifier.setImageFile(null),
                          ),
                          12.horizontalSpace,
                          UnderlinedTextField(
                            initialText: state
                                .category?.translation?.title ??
                                AppHelpers.getTranslation(TrKeys.noName),
                            label:
                            AppHelpers.getTranslation(TrKeys.title),
                            inputType: TextInputType.text,
                            textCapitalization:
                            TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            onChanged: notifier.setTitle,
                            validator: AppValidators.emptyCheck,
                          ),
                          16.verticalSpace,
                          UnderlinedTextField(
                            initialText: state
                                .category?.translation?.description ??
                                '',
                            label: AppHelpers.getTranslation(
                                TrKeys.description),
                            inputType: TextInputType.text,
                            maxLines: 6,
                            minLines: 1,
                            textCapitalization:
                            TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            onChanged: notifier.setDescription,
                          ),
                          16.verticalSpace,
                          UnderlinedTextField(
                            initialText: "${state.category?.input ?? ''}",
                            label:
                            AppHelpers.getTranslation(TrKeys.input),
                            inputType: TextInputType.number,
                            inputFormatters: [InputFormatter.digitsOnly],
                            textInputAction: TextInputAction.done,
                            onChanged: notifier.setInput,
                          ),
                          16.horizontalSpace,
                          if (categoryState.oldCategory != null)
                            _oldCategory(
                                categoryState, context, categoryNotifier),
                          24.verticalSpace,
                          CustomRadio(
                              title: TrKeys.active,
                              subTitle: TrKeys.active,
                              onChanged: notifier.changeActive,
                              isActive: state.active),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                title: AppHelpers.getTranslation(TrKeys.save),
                isLoading: state.isUpdate,
                onPressed: () {
                  if (_formKey.currentState?.validate() ??
                      false) {
                    notifier.updateCategory(
                      context,
                      updated: () {
                        isService
                            ? ref.read(serviceCategoriesProvider.notifier)
                            .fetchAllCategories(context: context, isRefresh: true)
                            : ref
                            .read(categoriesProvider.notifier)
                            .fetchCategories(context: context, isRefresh: true);
                        Navigator.pop(context);
                      },
                      type: isService &&
                          categoryState
                              .selectCategories.length ==
                              1
                          ? 'sub_service'
                          : isService
                          ? 'service'
                          : categoryState.selectCategories
                          .length ==
                          1
                          ? "sub_main"
                          : categoryState.selectCategories
                          .length ==
                          2
                          ? TrKeys.child
                          : null,
                      parentId: categoryState.selectCategory?.id,
                    );
                  }
                },
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _oldCategory(EditCategoryParentState categoryState,
      BuildContext context, EditCategoryParentNotifier categoryNotifier) {
    return Column(
      children: [
        ...categoryState.categoryControllers.mapIndexed((e, i) => Padding(
              padding: REdgeInsets.only(bottom: 8),
              child: UnderlinedTextField(
                textController: e,
                label: AppHelpers.getTranslation(
                  i == 0 ? TrKeys.parentCategory : TrKeys.subCategory,
                ),
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
                      modal: FoodCategoriesModal(
                        categories: i == 0
                            ? categoryState.categories
                            : categoryState.selectCategories[i - 1].children ??
                                [],
                        onSelect: categoryNotifier.setSelectCategory,
                        onChange: categoryNotifier.setActiveIndex,
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
            label: '${AppHelpers.getTranslation(TrKeys.parentCategory)}*',
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
  }
}
