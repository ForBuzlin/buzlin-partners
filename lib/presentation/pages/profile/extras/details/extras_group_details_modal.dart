import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/styles/style.dart';
import 'widgets/edit_color_modal.dart';
import 'widgets/edit_extras_item_modal.dart';
import 'widgets/delete_extras_item_modal.dart';
import 'widgets/group_detail_extras_item.dart';
import '../delete/delete_extras_group_modal.dart';
import '../update/update_extras_group_modal.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'widgets/create_new_group_item_modal.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class ExtrasGroupDetailsModal extends ConsumerStatefulWidget {
  final Group group;

  const ExtrasGroupDetailsModal({super.key, required this.group})
      ;

  @override
  ConsumerState<ExtrasGroupDetailsModal> createState() =>
      _ExtrasGroupDetailsModalState();
}

class _ExtrasGroupDetailsModalState
    extends ConsumerState<ExtrasGroupDetailsModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(extrasGroupDetailsProvider.notifier)
          .fetchGroupExtras(groupId: widget.group.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const ModalDrag(),
            if (widget.group.shopId == LocalStorage.getShop()?.id)
              Column(
                children: [
                  ButtonEffectAnimation(
                    child: GestureDetector(
                      onTap: () => AppHelpers.showCustomModalBottomSheet(
                        context: context,
                        modal: widget.group.type == TrKeys.color
                            ? EditExtrasColorModal(
                                isAdd: true,
                                group: widget.group,
                              )
                            : CreateNewGroupItemModal(group: widget.group),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Remix.play_list_add_line,
                            color: Style.primary,
                            size: 18.r,
                          ),
                          10.horizontalSpace,
                          Text(
                            AppHelpers.getTranslation(TrKeys.addNewExtras),
                            style: Style.interSemi(
                              size: 14,
                              color: Style.primary,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  16.verticalSpace,
                  Divider(
                      color: Style.toggleColor, height: 1.r, thickness: 1.r),
                  16.verticalSpace,
                ],
              ),
            UnderlinedTextField(
              label: '',
              readOnly: true,
              initialText: widget.group.translation?.title,
              onTap: () {
                if (widget.group.shopId == LocalStorage.getShop()?.id) {
                  AppHelpers.showCustomModalBottomSheet(
                    context: context,
                    modal: UpdateExtrasGroupModal(group: widget.group),
                  );
                }
              },
              suffixIcon: widget.group.shopId == LocalStorage.getShop()?.id
                  ? GestureDetector(
                      onTap: () => AppHelpers.showCustomModalBottomSheet(
                        context: context,
                        modal: DeleteExtrasGroupModal(group: widget.group),
                      ),
                      child: Icon(
                        Remix.delete_bin_fill,
                        size: 24.r,
                        color: Style.red,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(extrasGroupDetailsProvider);
                  return state.isLoading
                      ? const Loading()
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: REdgeInsets.only(top: 16, bottom: 24),
                          shrinkWrap: true,
                          itemCount: state.extras.length,
                          itemBuilder: (context, index) =>
                              GroupDetailExtrasItem(
                            extras: state.extras[index],
                            type: widget.group.type ?? "",
                            onEditTap: () =>
                                AppHelpers.showCustomModalBottomSheet(
                              context: context,
                              modal: widget.group.type == "color"
                                  ? EditExtrasColorModal(
                                      group: widget.group,
                                      extras: state.extras[index])
                                  : EditExtrasItemModal(
                                      group: widget.group,
                                      extras: state.extras[index],
                                    ),
                            ),
                            onDeleteTap: () =>
                                AppHelpers.showCustomModalBottomSheet(
                              context: context,
                              modal: DeleteExtrasItemModal(
                                extras: state.extras[index],
                              ),
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
