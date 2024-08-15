import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class AddBrandModal extends ConsumerStatefulWidget {
  const AddBrandModal({super.key}) ;

  @override
  ConsumerState<AddBrandModal> createState() => _AddBrandModalState();
}

class _AddBrandModalState extends ConsumerState<AddBrandModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(createBrandProvider.notifier).clear();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createBrandProvider);
    final notifier = ref.read(createBrandProvider.notifier);
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ModalDrag(),
              TitleAndIcon(
                  title: AppHelpers.getTranslation(TrKeys.addNewBrand)),
              24.verticalSpace,
              Row(
                children: [
                  SingleImagePicker(
                    isAdding: state.brand?.img == null,
                    imageFilePath: state.imageFile,
                    imageUrl: state.brand?.img,
                    onImageChange: notifier.setImageFile,
                    onDelete: () => notifier.setImageFile(null),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        UnderlinedTextField(
                          label: AppHelpers.getTranslation(TrKeys.title),
                          inputType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.done,
                          onChanged: notifier.setTitle,
                          validator: AppValidators.emptyCheck,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              24.verticalSpace,
              36.verticalSpace,
              CustomButton(
                title: AppHelpers.getTranslation(TrKeys.save),
                isLoading: state.isLoading,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    notifier.createBrand(
                      context,
                      created: () {
                        ref
                            .read(createFoodBrandProvider.notifier)
                            .updateBrands(context);
                        ref
                            .read(brandProvider.notifier)
                            .fetchBrands(context: context, isRefresh: true);
                        Navigator.pop(context);
                      },
                    );
                  }
                },
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
