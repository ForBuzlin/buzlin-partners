import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

@RoutePage()
class AddMasterPage extends ConsumerStatefulWidget {
  const AddMasterPage({super.key});

  @override
  ConsumerState<AddMasterPage> createState() => _AddMasterPageState();
}

class _AddMasterPageState extends ConsumerState<AddMasterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createUserProvider);
    final notifier = ref.read(createUserProvider.notifier);

    return KeyboardDisable(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBar(
                child: Row(
              children: [
                const PopButton(),
                Text(AppHelpers.getTranslation(TrKeys.addMaster)),
              ],
            )),
            Expanded(
              child: SingleChildScrollView(
                padding: REdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                child: Form(
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
                      16.verticalSpace,
                      UnderlinedTextField(
                        label:
                            '${AppHelpers.getTranslation(TrKeys.firstname)}*',
                        inputType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        onChanged: notifier.setFirstname,
                        validator: AppValidators.emptyCheck,
                      ),
                      16.verticalSpace,
                      UnderlinedTextField(
                        label: AppHelpers.getTranslation(TrKeys.lastname),
                        inputType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        onChanged: notifier.setLastname,
                      ),
                      16.verticalSpace,
                      UnderlinedTextField(
                        label: '${AppHelpers.getTranslation(TrKeys.title)}*',
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
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        onChanged: notifier.setDescription,
                      ),
                      16.verticalSpace,
                      UnderlinePhoneField(onchange: notifier.setPhone),
                      16.verticalSpace,
                      UnderlinedTextField(
                        label: '${AppHelpers.getTranslation(TrKeys.email)}*',
                        inputType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        onChanged: notifier.setEmail,
                        validator: AppValidators.emailCheck,
                      ),
                      24.verticalSpace,
                      UnderlinedTextField(
                        label: '${AppHelpers.getTranslation(TrKeys.password)}*',
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.done,
                        onChanged: notifier.setPassword,
                        validator: AppValidators.emptyCheck,
                      ),
                      100.verticalSpace,
                    ],
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
                notifier.createUser(
                  context,
                  role: TrKeys.master,
                  created: (user) {
                    Navigator.pop(context);
                    ref.read(newMastersProvider.notifier).addCreatedUser(user);
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
