import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class UpdateExtrasGroupModal extends ConsumerStatefulWidget {
  final Group group;

  const UpdateExtrasGroupModal({super.key, required this.group})
      ;

  @override
  ConsumerState<UpdateExtrasGroupModal> createState() =>
      _UpdateExtrasGroupModalState();
}

class _UpdateExtrasGroupModalState
    extends ConsumerState<UpdateExtrasGroupModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(updateExtrasGroupProvider.notifier)
          .setTitle(widget.group.translation?.title ?? ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(updateExtrasGroupProvider);
            final event = ref.read(updateExtrasGroupProvider.notifier);
            return Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ModalDrag(),
                  TitleAndIcon(title: AppHelpers.getTranslation(TrKeys.edit)),
                  24.verticalSpace,
                  UnderlinedTextField(
                    label: AppHelpers.getTranslation(TrKeys.title),
                    inputType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    onChanged: event.setTitle,
                    validator: AppValidators.emptyCheck,
                    initialText: widget.group.translation?.title,
                  ),
                  24.verticalSpace,
                  UnderlinedTextField(
                    readOnly: true,
                    label: AppHelpers.getTranslation(TrKeys.type),
                    inputType: TextInputType.text,
                    initialText:
                        AppHelpers.getTranslation(widget.group.type ?? ''),
                  ),
                  36.verticalSpace,
                  CustomButton(
                    title: TrKeys.save,
                    isLoading: state.isLoading,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        event.updateExtrasGroup(
                          context,
                          groupId: widget.group.id,
                          success: (group) {
                            ref
                                .read(extrasProvider.notifier)
                                .updateGroups(group);
                            Navigator.pop(context);
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
