import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class EditGroupExtrasModal extends ConsumerStatefulWidget {
  final int groupIndex;

  const EditGroupExtrasModal({super.key, required this.groupIndex})
      ;

  @override
  ConsumerState<EditGroupExtrasModal> createState() =>
      _EditGroupsExtrasModalState();
}

class _EditGroupsExtrasModalState extends ConsumerState<EditGroupExtrasModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(editFoodStocksProvider.notifier)
          .fetchGroupExtras(context, groupIndex: widget.groupIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editFoodStocksProvider);
    final notifier = ref.read(editFoodStocksProvider.notifier);
    return Stack(
      children: [
        ModalWrap(
          body: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const ModalDrag(),
                  Column(
                    children: [
                      TitleAndIcon(
                        title: AppHelpers.getTranslation(state
                                .groups[widget.groupIndex].translation?.title ??
                            ''),
                        titleSize: 16,
                      ),
                      state.isLoading
                          ? Padding(
                              padding: REdgeInsets.symmetric(vertical: 24),
                              child: const Loading())
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: REdgeInsets.symmetric(vertical: 20),
                              shrinkWrap: true,
                              itemCount: state.activeGroupExtras.length,
                              itemBuilder: (context, index) {
                                return GroupExtrasItem(
                                  extras: state.activeGroupExtras[index],
                                  onTap: () => notifier.setExtrasIndex(index),
                                  isSelected: (state.localExtras.any(
                                      (element) =>
                                          element?.id ==
                                          state.activeGroupExtras[index].id)),
                                );
                              },
                            ),
                    ],
                  ),
                  72.verticalSpace,
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 24.r,
            right: 24.r,
            child: Container(
              color: Style.white,
              padding: REdgeInsets.only(bottom: 32),
              child: CustomButton(
                isLoading: state.isExtrasSave,
                title: TrKeys.save,
                onPressed: () {
                  notifier.setActiveExtras(widget.groupIndex, onSuccess: () {
                    Navigator.pop(context);
                  });
                },
              ),
            ))
      ],
    );
  }
}
