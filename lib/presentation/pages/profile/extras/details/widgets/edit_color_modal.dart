import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EditExtrasColorModal extends ConsumerStatefulWidget {
  final Group? group;
  final Extras? extras;
  final bool isAdd;

  const EditExtrasColorModal(
      {super.key, this.group, this.extras, this.isAdd = false})
      ;

  @override
  ConsumerState<EditExtrasColorModal> createState() =>
      _EditExtrasColorModalState();
}

class _EditExtrasColorModalState extends ConsumerState<EditExtrasColorModal> {
  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(editExtrasItemProvider);
            final event = ref.read(editExtrasItemProvider.notifier);
            final createExtrasEvent =
                ref.read(createNewGroupItemProvider.notifier);
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ModalDrag(),
                  TitleAndIcon(
                      title: AppHelpers.getTranslation(widget.isAdd
                          ? TrKeys.addNewExtras
                          : TrKeys.updateExtras)),
                  24.verticalSpace,
                  ColorPicker(
                      pickerAreaBorderRadius: BorderRadius.circular(36.r),
                      enableAlpha: false,
                      displayThumbColor: true,
                      labelTypes: const [ColorLabelType.hex],
                      colorPickerWidth: 200.r,
                      pickerColor: const Color.fromRGBO(255, 255, 255, 1),
                      onColorChanged: (pickedColor) {
                        if (widget.isAdd) {
                          createExtrasEvent.setTitle(
                              "#${pickedColor.toString().substring(10, pickedColor.toString().length - 1)}");
                        } else {
                          event.setTitle(
                              "#${pickedColor.toString().substring(10, pickedColor.toString().length - 1)}");
                        }
                      }),
                  36.verticalSpace,
                  CustomButton(
                    title: TrKeys.save,
                    isLoading: state.isLoading,
                    onPressed: () {
                      if (widget.isAdd) {
                        createExtrasEvent.createExtrasItem(
                          context,
                          groupId: widget.group?.id,
                          success: () {
                            ref
                                .read(extrasGroupDetailsProvider.notifier)
                                .fetchGroupExtras(groupId: widget.group?.id);
                            Navigator.pop(context);
                          },
                        );
                      } else {
                        event.updateExtrasItem(
                          context,
                          extrasId: widget.extras?.id,
                          groupId: widget.group?.id,
                          success: () {
                            ref
                                .read(extrasGroupDetailsProvider.notifier)
                                .fetchGroupExtras(groupId: widget.group?.id);
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
