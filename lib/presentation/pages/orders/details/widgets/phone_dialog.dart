import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class PhoneDialog extends StatefulWidget {
  final ValueChanged<String> onSuccess;

  const PhoneDialog({super.key, required this.onSuccess});

  @override
  State<PhoneDialog> createState() => _PhoneDialogState();
}

class _PhoneDialogState extends State<PhoneDialog> {
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
        Text(AppHelpers.getTranslation(TrKeys.phoneNumber)),
        12.verticalSpace,
        Form(
            key: _formKey,
            child: PhoneField(
              onchange: (String value) {},
              initialValue: '',
            )),
        12.verticalSpace,
        CustomButton(
            height: 44,
            radius: AppConstants.radius,
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
