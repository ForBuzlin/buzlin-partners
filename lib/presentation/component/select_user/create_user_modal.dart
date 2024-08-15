import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class CreateUserModal extends StatefulWidget {
  const CreateUserModal({super.key}) ;

  @override
  State<CreateUserModal> createState() => _CreateUserModalState();
}

class _CreateUserModalState extends State<CreateUserModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final event = ref.read(createUserProvider.notifier);
            final state = ref.watch(createUserProvider);
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ModalDrag(),
                    TitleAndIcon(
                      title: AppHelpers.getTranslation(TrKeys.addUser),
                    ),
                    24.verticalSpace,
                    UnderlinedTextField(
                      label: '${AppHelpers.getTranslation(TrKeys.firstname)}*',
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onChanged: event.setFirstname,
                      validator: AppValidators.emptyCheck,
                    ),
                    24.verticalSpace,
                    UnderlinedTextField(
                      label: AppHelpers.getTranslation(TrKeys.lastname),
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onChanged: event.setLastname,
                    ),
                    24.verticalSpace,
                    UnderlinePhoneField(onchange: event.setPhone),
                    24.verticalSpace,
                    UnderlinedTextField(
                      label: '${AppHelpers.getTranslation(TrKeys.email)}*',
                      inputType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.done,
                      onChanged: event.setEmail,
                      validator: AppValidators.emailCheck,
                    ),
                    24.verticalSpace,
                    CustomButton(
                      height: 54,
                      title: AppHelpers.getTranslation(TrKeys.save),
                      isLoading: state.isLoading,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          event.createUser(
                            context,
                            created: (user) {
                              Navigator.pop(context);
                              ref
                                  .read(orderUserProvider.notifier)
                                  .addCreatedUser(user);
                            },
                          );
                        }
                      },
                    ),
                    24.verticalSpace,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
