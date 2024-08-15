import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class CreateExtrasGroupModal extends StatefulWidget {
  const CreateExtrasGroupModal({super.key}) ;

  @override
  State<CreateExtrasGroupModal> createState() => _CreateExtrasGroupModalState();
}

class _CreateExtrasGroupModalState extends State<CreateExtrasGroupModal> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController title;

  var items = [
    TrKeys.text,
    TrKeys.color,
  ];

  @override
  void initState() {
    title = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(createExtrasGroupProvider);
            final event = ref.read(createExtrasGroupProvider.notifier);
            return Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ModalDrag(),
                  TitleAndIcon(
                    title: AppHelpers.getTranslation(TrKeys.addExtrasGroup),
                  ),
                  24.verticalSpace,
                  UnderlinedTextField(
                    label: "${AppHelpers.getTranslation(TrKeys.title)}*",
                    inputType: TextInputType.text,
                    textController: title,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    validator: AppValidators.emptyCheck,
                  ),
                  24.verticalSpace,
                  DropdownButtonFormField(
                    value: state.type,
                    items: items.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(AppHelpers.getTranslation(item)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      event.setType(newValue);
                    },
                    decoration: InputDecoration(
                      labelText: "${AppHelpers.getTranslation(TrKeys.type)}*",
                      labelStyle: Style.interNormal(
                        size: 14,
                        color: Style.black.withOpacity(0.7),
                      ),
                      contentPadding:
                          REdgeInsets.symmetric(horizontal: 0, vertical: 8),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Style.shimmerBase)),
                      errorBorder: InputBorder.none,
                      border: const UnderlineInputBorder(),
                      focusedErrorBorder: const UnderlineInputBorder(),
                      disabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Style.shimmerBase)),
                      focusedBorder: const UnderlineInputBorder(),
                    ),
                  ),
                  36.verticalSpace,
                  CustomButton(
                    title: TrKeys.save,
                    isLoading: state.isLoading,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        event.createExtrasGroup(
                          context,
                          title: title.text,
                          success: () {
                            ref.read(extrasProvider.notifier).fetchGroups();
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
