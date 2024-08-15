import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/profile/profile/profile_provider.dart';
import 'package:venderuzmart/application/profile/users/users_provider.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/pages/profile/edit_profile/gender_drop_down.dart';
import '../../../component/components.dart';

@RoutePage()
class EditProfilePage extends ConsumerStatefulWidget {
  final VoidCallback onSuccess;

  const EditProfilePage(this.onSuccess, {super.key}) ;

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(usersProvider.notifier).setProfileDetails();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(usersProvider);
    final notifier = ref.read(usersProvider.notifier);
    return KeyboardDisable(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppBar(
                child: Row(
              children: [
                const PopButton(),
                Text(AppHelpers.getTranslation(TrKeys.editProfile)),
              ],
            )),
            Expanded(
              child: SingleChildScrollView(
                padding: REdgeInsets.symmetric(horizontal: 16),
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      24.verticalSpace,
                      HorizontalImagePicker(
                        onImageChange: notifier.setImageFile,
                        onDelete: () => notifier.setImageFile(null),
                        imageFilePath: state.imageFile,
                        imageUrl: LocalStorage.getUser()?.img,
                      ),
                      24.verticalSpace,
                      UnderlinedTextField(
                        initialText: LocalStorage.getUser()?.firstname ?? '',
                        label: AppHelpers.getTranslation(TrKeys.firstname),
                        onChanged: notifier.setFirstName,
                        validator: AppValidators.emptyCheck,
                      ),
                      24.verticalSpace,
                      UnderlinedTextField(
                        initialText: LocalStorage.getUser()?.lastname ?? '',
                        label: AppHelpers.getTranslation(TrKeys.lastname),
                        onChanged: notifier.setLastName,
                        validator: AppValidators.emptyCheck,
                      ),
                      24.verticalSpace,
                      UnderlinedTextField(
                        initialText: LocalStorage.getUser()?.email ?? '',
                        label: AppHelpers.getTranslation(TrKeys.email),
                        onChanged: notifier.setEmail,
                        validator: AppValidators.emptyCheck,
                      ),
                      24.verticalSpace,
                      UnderlinePhoneField(
                        onchange: (v) => notifier.setPhone(v),
                        initialValue: LocalStorage.getUser()?.phone,
                      ),
                      24.verticalSpace,
                      UnderlinedTextField(
                        readOnly: true,
                        textController: state.birthday,
                        onTap: () => AppHelpers.showCustomModalBottomSheet(
                          context: context,
                          modal: ModalWrap(
                            body: CustomDatePicker(
                              isSingle: true,
                              range: const [],
                              onValueChanged: notifier.setDate,
                            ),
                          ),
                        ),
                        label: AppHelpers.getTranslation(TrKeys.birthday),
                        validator: AppValidators.emptyCheck,
                      ),
                      24.verticalSpace,
                      GenderDropDown(
                          onTap: notifier.setActiveIndex,
                          typeValue: state.gender ?? "male"),
                      24.verticalSpace,
                      UnderlinedTextField(
                        label: AppHelpers.getTranslation(TrKeys.password),
                        onChanged: notifier.setPassword,
                      ),
                      24.verticalSpace,
                      UnderlinedTextField(
                        label:
                            AppHelpers.getTranslation(TrKeys.confirmPassword),
                        onChanged: notifier.setConfirmPassword,
                      ),
                      24.verticalSpace,
                      CustomButton(
                        title: AppHelpers.getTranslation(TrKeys.save),
                        isLoading: state.isLoading,
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            notifier.updateProfile(context, updated: () {
                              ref
                                  .read(profileProvider.notifier)
                                  .fetchUser(context);
                              Navigator.pop(context);
                            });
                          }
                        },
                      ),
                      48.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
