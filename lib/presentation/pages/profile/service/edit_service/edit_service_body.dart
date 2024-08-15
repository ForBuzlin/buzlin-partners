import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/service/edit/edit_service_provider.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import '../../../../../application/providers.dart';
import '../widgets/service_categories_modal.dart';

class EditServiceBody extends ConsumerStatefulWidget {
  final int? id;
  final VoidCallback? onNext;

  const EditServiceBody({super.key, this.id, this.onNext});

  @override
  ConsumerState<EditServiceBody> createState() => _EditLooksPageState();
}

class _EditLooksPageState extends ConsumerState<EditServiceBody> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController desc;
  late TextEditingController pause;
  late TextEditingController price;
  late TextEditingController interval;
  late TextEditingController category;
  CategoryData? selectCategory;

  @override
  void initState() {
    final ServiceData? serviceData = ref.read(editServiceProvider).serviceData;
    title = TextEditingController(text: serviceData?.translation?.title ?? '');
    desc = TextEditingController(
        text: serviceData?.translation?.description ?? '');
    pause = TextEditingController(text: "${serviceData?.pause ?? 0}");
    price = TextEditingController(text: "${serviceData?.price ?? 0}");
    interval = TextEditingController(text: "${serviceData?.interval ?? ''}");
    category = TextEditingController(
        text: "${serviceData?.category?.translation?.title ?? 0}");
    selectCategory = serviceData?.category;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(editServiceProvider.notifier).fetchServiceDetails(
          context: context,
          id: widget.id,
          onSuccess: (ServiceData? value) {
            selectCategory = value?.category;
            desc.text = value?.translation?.description ?? '';
            category.text = value?.category?.translation?.title ?? '';
          }),
    );
  }

  @override
  void dispose() {
    title.dispose();
    desc.dispose();
    pause.dispose();
    price.dispose();
    interval.dispose();
    category.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editServiceProvider);
    final notifier = ref.read(editServiceProvider.notifier);
    return state.serviceData == null || state.isLoading
        ? const Loading()
        : Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  24.verticalSpace,
                  MultiImagePicker(
                    imageUrls: state.listOfUrls,
                    listOfImages: state.images,
                    onImageChange: notifier.setImageFile,
                    onDelete: notifier.deleteImage,
                    isExtras: true,
                  ),
                  16.verticalSpace,
                  UnderlinedTextField(
                    label: '${AppHelpers.getTranslation(TrKeys.title)}*',
                    textInputAction: TextInputAction.next,
                    textController: title,
                    validator: AppValidators.emptyCheck,
                  ),
                  12.verticalSpace,
                  UnderlinedTextField(
                    maxLines: 12,
                    minLines: 1,
                    label: AppHelpers.getTranslation(TrKeys.description),
                    textInputAction: TextInputAction.next,
                    textController: desc,
                  ),
                  16.verticalSpace,
                  UnderlinedTextField(
                    readOnly: true,
                    onTap: () {
                      AppHelpers.showCustomModalBottomSheet(
                        context: context,
                        modal: ModalWrap(
                          body: ServiceCategoriesModal(
                            onChange: (value) {
                              selectCategory = value;
                              category.text = value.translation?.title ?? '';
                            },
                          ),
                        ),
                      );
                    },
                    label: "${AppHelpers.getTranslation(TrKeys.category)}*",
                    textInputAction: TextInputAction.next,
                    validator: AppValidators.emptyCheck,
                    textController: category,
                  ),
                  16.verticalSpace,
                  UnderlinedTextField(
                    label: '${AppHelpers.getTranslation(TrKeys.interval)}*',
                    textInputAction: TextInputAction.next,
                    textController: interval,
                    inputType: TextInputType.number,
                    validator: (p0) {
                      final res = AppValidators.isNumberValidator(p0);
                      if (res != null) {
                        return res;
                      }
                      if (int.parse(p0 ?? "0") > 30000) {
                        return "Interval must be less than 30000";
                      }
                      return null;
                    },
                    inputFormatters: [InputFormatter.digitsOnly],
                  ),
                  16.verticalSpace,
                  UnderlinedTextField(
                    label: '${AppHelpers.getTranslation(TrKeys.pause)}*',
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.number,
                    textController: pause,
                    validator: AppValidators.isNumberValidator,
                    inputFormatters: [InputFormatter.digitsOnly],
                  ),
                  16.verticalSpace,
                  UnderlinedTextField(
                    label: AppHelpers.getPriceLabel,
                    textInputAction: TextInputAction.next,
                    textController: price,
                    inputType: TextInputType.number,
                    validator: AppValidators.emptyCheck,
                    inputFormatters: [InputFormatter.currency],
                  ),
                  16.verticalSpace,
                  UnderlineDropDown(
                    label: TrKeys.type,
                    list: DropDownValues.serviceTypeList,
                    onChanged: notifier.setType,
                    value: state.serviceData?.type,
                  ),
                  16.verticalSpace,
                  UnderlineDropDown(
                    label: TrKeys.gender,
                    list: DropDownValues.genderList,
                    onChanged: notifier.setGender,
                    value: state.serviceData?.gender,
                  ),
                  48.verticalSpace,
                  CustomButton(
                    textColor: Style.white,
                    title: AppHelpers.getTranslation(TrKeys.save),
                    isLoading: state.isUpdating,
                    onPressed: () {
                      // if (state.imageFile?.isEmpty ?? true) {
                      //   AppHelpers.errorSnackBar(context, text: TrKeys.imageCantEmpty);
                      // return;
                      // }
                      if ((_formKey.currentState?.validate() ?? false) &&
                          selectCategory?.id != null) {
                        notifier.updateService(
                          context,
                          updated: (service) {
                            AppHelpers.successSnackBar(
                              context,
                              text: AppHelpers.getTranslation(
                                  TrKeys.successfullyUpdated),
                            );

                            widget.onNext?.call();
                          },
                          title: title.text,
                          description: desc.text,
                          price: price.text,
                          interval: interval.text,
                          pause: pause.text,
                          categoryId: selectCategory!.id!,
                        );
                      }
                    },
                  ),
                  60.verticalSpace,
                ],
              ),
            ),
          );
  }
}
