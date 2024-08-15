import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EditExtrasItemModal extends ConsumerStatefulWidget {
  final Group group;
  final Extras extras;

  const EditExtrasItemModal({
   super.key,
    required this.group,
    required this.extras,
  }) ;

  @override
  ConsumerState<EditExtrasItemModal> createState() =>
      _EditExtrasItemModalState();
}

class _EditExtrasItemModalState extends ConsumerState<EditExtrasItemModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(editExtrasItemProvider.notifier)
          .setTitle(widget.extras.value ?? ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(editExtrasItemProvider);
            final event = ref.read(editExtrasItemProvider.notifier);
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
                    initialText: widget.extras.value,
                  ),
                  36.verticalSpace,
                  CustomButton(
                    title: TrKeys.save,
                    isLoading: state.isLoading,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        event.updateExtrasItem(
                          context,
                          extrasId: widget.extras.id,
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
