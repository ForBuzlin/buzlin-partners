import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

@RoutePage()
class EditBrandPage extends ConsumerWidget {
  EditBrandPage(this.onSave, {super.key}) ;
  final Function() onSave;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(editBrandsProvider);
    final event = ref.read(editBrandsProvider.notifier);
    return KeyboardDisable(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppBar(
              child: Row(
                children: [
                  const PopButton(),
                  Expanded(
                      child: TitleAndIcon(title: state.brand?.title ?? "")),
                ],
              ),
            ),
            state.brand == null
                ? const Loading()
                : Padding(
                    padding: REdgeInsets.symmetric(horizontal: 16),
                    child: Stack(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              24.verticalSpace,
                              SingleImagePicker(
                                isEdit: true,
                                height: MediaQuery.sizeOf(context).width / 3,
                                width: MediaQuery.sizeOf(context).width / 3,
                                isAdding: state.brand?.img == null,
                                imageFilePath: state.imageFile,
                                imageUrl: state.brand?.img,
                                onImageChange: event.setImageFile,
                                onDelete: () => event.setImageFile(null),
                              ),
                              12.horizontalSpace,
                              UnderlinedTextField(
                                initialText: state.brand?.title,
                                label: AppHelpers.getTranslation(TrKeys.title),
                                inputType: TextInputType.text,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                textInputAction: TextInputAction.done,
                                onChanged: event.setTitle,
                                validator: AppValidators.emptyCheck,
                              ),
                              24.verticalSpace,
                              CustomRadio(
                                  title: TrKeys.active,
                                  subTitle: TrKeys.active,
                                  onChanged: event.changeActive,
                                  isActive: state.active),
                            ],
                          ),
                        ),
                      ],
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
                event.updateBrand(context, updated: () {
                  ref.read(brandProvider.notifier).fetchBrands(isRefresh: true);
                  Navigator.pop(context);
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
