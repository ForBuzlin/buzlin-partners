import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class CreateNewGroupItemModal extends StatefulWidget {
  final Group group;

  const CreateNewGroupItemModal({super.key, required this.group})
      ;

  @override
  State<CreateNewGroupItemModal> createState() =>
      _CreateNewGroupItemModalState();
}

class _CreateNewGroupItemModalState extends State<CreateNewGroupItemModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(createNewGroupItemProvider);
            final event = ref.read(createNewGroupItemProvider.notifier);
            return Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ModalDrag(),
                  TitleAndIcon(
                      title: AppHelpers.getTranslation(TrKeys.addNewExtras)),
                  24.verticalSpace,
                  UnderlinedTextField(
                    label: AppHelpers.getTranslation(TrKeys.title),
                    inputType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    onChanged: event.setTitle,
                    validator: AppValidators.emptyCheck,
                  ),
                  36.verticalSpace,
                  CustomButton(
                    title: TrKeys.save,
                    isLoading: state.isLoading,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        event.createExtrasItem(
                          context,
                          groupId: widget.group.id,
                          success: () {
                            ref
                                .read(extrasGroupDetailsProvider.notifier)
                                .fetchGroupExtras(groupId: widget.group.id);
                            Navigator.pop(context);
                          },
                        );
                      }
                    },
                  ),
                  20.verticalSpace,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
