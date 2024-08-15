import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class TextExtras extends StatelessWidget {
  final int groupIndex;
  final List<UiExtra> uiExtras;
  final Function(UiExtra) onUpdate;

  const TextExtras({
   super.key,
    required this.groupIndex,
    required this.uiExtras,
    required this.onUpdate,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.r,
      runSpacing: 10.r,
      children: uiExtras
          .map(
            (uiExtra) => Material(
              shape: const CircleBorder(),
              color: uiExtra.isSelected ? Style.primary : Style.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(32.r),
                onTap: () {
                  if (uiExtra.isSelected) {
                    return;
                  }
                  onUpdate(uiExtra);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: uiExtra.isSelected
                            ? Style.transparent
                            : Style.black.withOpacity(0.1)),
                  ),
                  padding: REdgeInsets.all(10),
                  child: Text(
                    uiExtra.value,
                    style: Style.interNormal(
                      size: 14,
                      color: uiExtra.isSelected ? Style.white : Style.black,
                      letterSpacing: -14 * 0.01,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
