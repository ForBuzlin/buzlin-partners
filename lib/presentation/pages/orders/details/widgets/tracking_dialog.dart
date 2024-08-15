import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class TrackingDialog extends StatefulWidget {
  final VoidCallback onSuccess;

  const TrackingDialog({super.key, required this.onSuccess});

  @override
  State<TrackingDialog> createState() => _TrackingDialogState();
}

class _TrackingDialogState extends State<TrackingDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController idController;
  late TextEditingController linkController;

  @override
  void initState() {
    nameController = TextEditingController();
    idController = TextEditingController();
    linkController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppHelpers.getTranslation(TrKeys.trackingInformation)),
          12.verticalSpace,
          CustomTextFormField(
            hint: TrKeys.name,
            controller: nameController,
            textCapitalization: TextCapitalization.sentences,
            validation: AppValidators.emptyCheck,
            textInputAction: TextInputAction.next,
            contentPadding: REdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
          12.verticalSpace,
          CustomTextFormField(
            hint: TrKeys.id,
            controller: idController,
            validation: AppValidators.emptyCheck,
            textInputAction: TextInputAction.next,
            contentPadding: REdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
          12.verticalSpace,
          CustomTextFormField(
            hint: TrKeys.link,
            controller: linkController,
            validation: AppValidators.emptyCheck,
            contentPadding: REdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
          12.verticalSpace,
          Consumer(builder: (context, ref, child) {
            return Row(
              children: [
                Expanded(
                  child: CustomButton(
                      height: 42,
                      background: Style.iconColor,
                      isLoading: ref.watch(orderDetailsProvider).isUpdating,
                      title: TrKeys.skip,
                      onPressed: () {
                        widget.onSuccess.call();
                        Navigator.pop(context);
                      }),
                ),
                12.horizontalSpace,
                Expanded(
                  child: CustomButton(
                      height: 42,
                      isLoading: ref.watch(orderDetailsProvider).isUpdating,
                      title: TrKeys.save,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          ref
                              .read(orderDetailsProvider.notifier)
                              .updateOrderTracking(
                            context,
                            name: nameController.text,
                            id: idController.text,
                            url: linkController.text,
                            success: () {
                              widget.onSuccess.call();
                              Navigator.pop(context);
                            },
                          );
                        }
                      }),
                )
              ],
            );
          })
        ],
      ),
    );
  }
}
