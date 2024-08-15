import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import '../../../products/create/details/food_categories_modal.dart';

@RoutePage()
class AddCategoryPage extends ConsumerStatefulWidget {
  final bool isService;

  const AddCategoryPage({super.key, this.isService = false});

  @override
  ConsumerState<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends ConsumerState<AddCategoryPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(createCategoryProvider.notifier).clear();
      ref.read(createCategoryParentProvider.notifier).setCategories(
            widget.isService
                ? ref.read(serviceCategoriesProvider).allCategories
                : ref.read(categoriesProvider).categories,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createCategoryProvider);
    final notifier = ref.read(createCategoryProvider.notifier);
    final categoryState = ref.watch(createCategoryParentProvider);
    final categoryNotifier = ref.read(createCategoryParentProvider.notifier);

    return KeyboardDisable(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppBar(
                height: 60,
                bottomPadding: 6,
                child: Row(
                  children: [
                    const PopButton(),
                    Expanded(
                      child: TitleAndIcon(
                        title: AppHelpers.getTranslation(TrKeys.addNewCategory),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        24.verticalSpace,
                        SingleImagePicker(
                          height: MediaQuery.sizeOf(context).width / 3,
                          width: MediaQuery.sizeOf(context).width / 3,
                          isAdding: state.category?.img == null,
                          imageFilePath: state.imageFile,
                          imageUrl: state.category?.img,
                          onImageChange: notifier.setImageFile,
                          onDelete: () => notifier.setImageFile(null),
                        ),
                        16.horizontalSpace,
                        UnderlinedTextField(
                          label: "${AppHelpers.getTranslation(TrKeys.name)}*",
                          inputType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          onChanged: notifier.setTitle,
                          validator: AppValidators.emptyCheck,
                        ),
                        16.verticalSpace,
                        UnderlinedTextField(
                          label: AppHelpers.getTranslation(TrKeys.description),
                          inputType: TextInputType.text,
                          maxLines: 6,
                          minLines: 1,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.next,
                          onChanged: notifier.setDescription,
                        ),
                        16.verticalSpace,
                        UnderlinedTextField(
                          label: AppHelpers.getTranslation(TrKeys.input),
                          inputType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          inputFormatters: [InputFormatter.digitsOnly],
                          onChanged: notifier.setInput,
                        ),
                        16.verticalSpace,
                        _parent(categoryState, categoryNotifier),
                        24.verticalSpace,
                        CustomRadio(
                          title: TrKeys.active,
                          subTitle: TrKeys.active,
                          onChanged: notifier.changeActive,
                          isActive: state.active,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            title: AppHelpers.getTranslation(TrKeys.save),
            isLoading: state.isLoading,
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                notifier.createCategory(
                  context,
                  type: widget.isService &&
                          categoryState.selectCategories.length == 1
                      ? 'sub_service'
                      : widget.isService
                          ? 'service'
                          : categoryState.selectCategories.length == 1
                              ? "sub_main"
                              : categoryState.selectCategories.length == 2
                                  ? TrKeys.child
                                  : TrKeys.main,
                  parentId: categoryState.selectCategory?.id ??
                          (categoryState.selectCategories.isNotEmpty
                              ? categoryState.selectCategories.last.id
                              : null),
                  created: () {
                    widget.isService
                        ? ref
                            .read(serviceCategoriesProvider.notifier)
                            .fetchAllCategories(context: context, isRefresh: true)
                        : ref
                            .read(categoriesProvider.notifier)
                            .fetchCategories(context: context, isRefresh: true);
                    Navigator.pop(context);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _parent(CreateCategoryParentState categoryState,
      CreateCategoryParentNotifier categoryNotifier) {
    final categoriesState = ref.watch(categoriesProvider);
    final serviceCategoriesState = ref.watch(serviceCategoriesProvider);
    return Consumer(
      builder: (context, ref, child) {
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
                (widget.isService
                    ? serviceCategoriesState.isLoading
                    : categoriesState.isLoading))
              UnderlinedTextField(
                label: AppHelpers.getTranslation(TrKeys.parentCategory),
                suffixIcon: Icon(
                  Remix.arrow_down_s_line,
                  color: Style.black,
                  size: 18.r,
                ),
                readOnly: true,
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
