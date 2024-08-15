import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class NoteDialog extends StatefulWidget {
  final ValueChanged<String> onSuccess;

  const NoteDialog({super.key, required this.onSuccess});

  @override
  State<NoteDialog> createState() => _NoteDialogState();
}

class _NoteDialogState extends State<NoteDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(AppHelpers.getTranslation(TrKeys.areYouSure)),
        12.verticalSpace,
        Form(
          key: _formKey,
          child: CustomTextFormField(
              hint: TrKeys.note,
              minLines: 2,
              maxLines: null,
              controller: controller,
              textCapitalization: TextCapitalization.sentences,
              validation: AppValidators.emptyCheck,
              onChanged: (value) {}),
        ),
        12.verticalSpace,
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     SecondButton(
        //       title: TrKeys.cancel,
        //       onTap: () {},
        //       // titleSize: 14,
        //     ),
        //     6.horizontalSpace,
        //     SecondButton(
        //       title: TrKeys.save,
        //       onTap: () {},
        //       // titleSize: 14,
        //     ),
        //   ],
        // ),
        CustomButton(
            title: TrKeys.save,
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                widget.onSuccess.call(controller.text);
                Navigator.pop(context);
              }
            })
      ],
    );
  }
}
