import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class DeleteModal extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteModal({super.key, required this.onDelete}) ;

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ModalDrag(),
            40.verticalSpace,
            Text(
              '${AppHelpers.getTranslation(TrKeys.areYouSureToDelete)}?',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 18,
                color: Style.black,
                fontWeight: FontWeight.w500,
                letterSpacing: -14 * 0.02,
              ),
            ),
            36.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: TrKeys.cancel,
                    onPressed: () => Navigator.pop(context),
                    background: Style.transparent,
                    borderColor: Style.black,
                    textColor: Style.textColor,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      return CustomButton(
                        title: AppHelpers.getTranslation(TrKeys.yes),
                        isLoading: ref.watch(discountProvider).isLoading,
                        onPressed: () {
                          onDelete.call();
                          Navigator.pop(context);
                        },
                        background: Style.red,
                        borderColor: Style.red,
                      );
                    },
                  ),
                ),
              ],
            ),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
