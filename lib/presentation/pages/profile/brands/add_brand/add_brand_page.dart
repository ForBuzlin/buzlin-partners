import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

@RoutePage()
class AddBrandPage extends ConsumerStatefulWidget {
  const AddBrandPage({super.key}) ;

  @override
  ConsumerState<AddBrandPage> createState() => _AddBrandPageState();
}

class _AddBrandPageState extends ConsumerState<AddBrandPage> {
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
    return KeyboardDisable(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppBar(
              child: Row(
                children: [
                  const PopButton(),
                  Expanded(
                    child: TitleAndIcon(
                        title: AppHelpers.getTranslation(TrKeys.addNewBrand)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    24.verticalSpace,
                    SingleImagePicker(
                      height: MediaQuery.sizeOf(context).width / 3,
                      width: MediaQuery.sizeOf(context).width / 3,
                      isAdding: state.brand?.img == null,
                      imageFilePath: state.imageFile,
                      imageUrl: state.brand?.img,
                      onImageChange: notifier.setImageFile,
                      onDelete: () => notifier.setImageFile(null),
                    ),
                    12.horizontalSpace,
                    UnderlinedTextField(
                      label: AppHelpers.getTranslation(TrKeys.title),
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.done,
                      onChanged: notifier.setTitle,
                      validator: AppValidators.emptyCheck,
                    ),
                    24.verticalSpace,
                    CustomRadio(
                        title: TrKeys.active,
                        subTitle: TrKeys.active,
                        onChanged: notifier.changeActive,
                        isActive: state.active),
                  ],
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
                notifier.createBrand(
                  context,
                  created: () {
                    ref
                        .read(brandProvider.notifier)
                        .fetchBrands(context: context, isRefresh: true);
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
}
