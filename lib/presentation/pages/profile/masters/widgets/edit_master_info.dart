import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';

class EditMasterInfo extends ConsumerStatefulWidget {
  final UserData? master;

  const EditMasterInfo({super.key, required this.master});

  @override
  ConsumerState<EditMasterInfo> createState() => _EditMasterInfoState();
}

class _EditMasterInfoState extends ConsumerState<EditMasterInfo> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController email;

  @override
  void initState() {
    firstname = TextEditingController(text: widget.master?.firstname);
    lastname = TextEditingController(text: widget.master?.lastname);
    email = TextEditingController(text: widget.master?.email);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .read(editMastersProvider.notifier)
            .fetchMasterDetails(context: context, master: widget.master);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    firstname.dispose();
    lastname.dispose();
    email.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editMastersProvider);
    final notifier = ref.read(editMastersProvider.notifier);
    return state.isLoading
        ? const Loading()
        : SingleChildScrollView(
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
                    imageUrl: state.master?.img,
                  ),
                  24.verticalSpace,
                  UnderlinedTextField(
                    label: AppHelpers.getTranslation(TrKeys.firstname),
                    textController: firstname,
                    validator: AppValidators.emptyCheck,
                  ),
                  24.verticalSpace,
                  UnderlinedTextField(
                    label: AppHelpers.getTranslation(TrKeys.lastname),
                    textController: lastname,
                    validator: AppValidators.emptyCheck,
                  ),
                  24.verticalSpace,
                  UnderlinedTextField(
                    label: AppHelpers.getTranslation(TrKeys.email),
                    textController: email,
                    readOnly: true,
                  ),
                  24.verticalSpace,
                  UnderlinePhoneField(
                    onchange: notifier.setPhone,
                    initialValue: state.master?.phone,
                  ),
                  24.verticalSpace,
                  UnderlineDropDown(
                    value: state.master?.gender,
                    list: DropDownValues.gender,
                    onChanged: notifier.setGender,
                  ),
                  36.verticalSpace,
                  CustomButton(
                    title: AppHelpers.getTranslation(TrKeys.save),
                    isLoading: state.isUpdating,
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        notifier.updateMaster(
                          context,
                          updated: (master) {
                            _fetchMasters();
                            Navigator.pop(context);
                          },
                          firstname: firstname.text,
                          lastname: lastname.text,
                          email: email.text,
                        );
                      }
                    },
                  ),
                  48.verticalSpace,
                ],
              ),
            ),
          );
  }

  _fetchMasters() {
    switch (ref.watch(mastersProvider).index) {
      case 0:
        ref.read(newMastersProvider.notifier).fetchMembers(isRefresh: true);
        break;
      case 1:
        ref
            .read(acceptedMastersProvider.notifier)
            .fetchMembers(context: context, isRefresh: true);
        break;
      case 2:
        ref
            .read(cancelledMastersProvider.notifier)
            .fetchMembers(isRefresh: true);
        break;
      case 3:
        ref
            .read(rejectedMastersProvider.notifier)
            .fetchMembers(isRefresh: true);
        break;
    }
  }
}
