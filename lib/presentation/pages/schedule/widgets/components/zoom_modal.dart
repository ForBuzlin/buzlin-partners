import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';

class ZoomModal extends ConsumerStatefulWidget {
  const ZoomModal({super.key});

  @override
  ConsumerState<ZoomModal> createState() => _ZoomModalState();
}

class _ZoomModalState extends ConsumerState<ZoomModal> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(zoomProvider.notifier)
          .changeZoom(ref.read(bookingProvider).calendarZoom);
    });
    super.initState();
  }

  List<String> sizeList = [
    TrKeys.small,
    TrKeys.normal,
    TrKeys.large,
  ];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(zoomProvider);
    final notifier = ref.read(zoomProvider.notifier);
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            24.verticalSpace,
            Slider(
              value: state.calendarZoom,
              max: 2.6,
              divisions: 2,
              min: 1.8,
              onChanged: notifier.changeZoom,
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  sizeList.length,
                  (i) => Text(AppHelpers.getTranslation(sizeList[i])),
                ),
              ),
            ),
            24.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      height: 42,
                      background: Style.iconColor,
                      title: TrKeys.cancel,
                      onPressed: () => Navigator.pop(context)),
                ),
                12.horizontalSpace,
                Expanded(
                  child: CustomButton(
                      height: 42,
                      title: TrKeys.save,
                      onPressed: () {
                        ref
                            .read(bookingProvider.notifier)
                            .changeZoom(i: state.calendarZoom);
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
