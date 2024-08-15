import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class ColorExtras extends StatelessWidget {
  final int groupIndex;
  final List<UiExtra> uiExtras;
  final Function(UiExtra) onUpdate;

  const ColorExtras({
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
            (uiExtra) => AppHelpers.checkIfHex(uiExtra.value)
                ? Material(
                    shape: CircleBorder(
                        side: BorderSide(
                      color: uiExtra.value.substring(1, 7) == "ffffff"
                          ? Style.black.withOpacity(0.5)
                          : Style.transparent,
                    )),
                    color: Color(
                        int.parse('0xFF${uiExtra.value.substring(1, 7)}')),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(32.r),
                      onTap: () {
                        if (uiExtra.isSelected) {
                          return;
                        }
                        onUpdate(uiExtra);
                      },
                      child: uiExtra.isSelected
                          ? Container(
                              width: 32.r,
                              height: 32.r,
                              alignment: Alignment.center,
                              child: Icon(
                                Remix.check_double_line,
                                color: uiExtra.value.substring(1, 7) == "ffffff"
                                    ? Style.black
                                    : Style.white,
                                size: 18.r,
                              ),
                            )
                          : SizedBox(width: 32.r, height: 32.r),
                    ),
                  )
                : Material(
                    shape: const CircleBorder(),
                    color: Style.white,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.r),
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
                                  ? Style.primary
                                  : Style.black.withOpacity(0.1),
                              width: 1.5.r),
                        ),
                        padding: REdgeInsets.all(12),
                        child: Text(
                          uiExtra.value,
                          style: Style.interNormal(
                            size: 14,
                            color: Style.black,
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
