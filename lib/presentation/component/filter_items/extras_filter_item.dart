import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class ExtrasFilterItem extends StatelessWidget {
  final String type;
  final Extra extra;
  final List<int> list;

  const ExtrasFilterItem(
      {super.key, required this.type, required this.extra, required this.list});

  @override
  Widget build(BuildContext context) {
    return type == "color"
        ? AppHelpers.checkIfHex(extra.value)
            ? Container(
                margin: EdgeInsets.all(4.r),
                width: 50.r,
                height: 50.r,
                decoration: BoxDecoration(
                    color:
                        Color(int.parse('0xFF${extra.value?.substring(1, 7)}')),
                    borderRadius: BorderRadius.circular(AppConstants.radius.r)),
                child: list.contains(extra.id)
                    ? Container(
                        width: 42.r,
                        height: 42.r,
                        alignment: Alignment.center,
                        child: Icon(
                          Remix.check_double_line,
                          color: extra.value?.substring(1, 7) == "ffffff"
                              ? Style.black
                              : Style.white,
                        ),
                      )
                    : SizedBox(width: 42.r, height: 42.r),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: REdgeInsets.all(12),
                child: Text(
                  extra.value ?? "",
                  style: Style.interNormal(
                    size: 14,
                    color: Style.black,
                  ),
                ),
              )
        : Column(
            children: [
              Row(
                children: [
                  Icon(
                    list.contains(extra.id)
                        ? Remix.checkbox_circle_fill
                        : Remix.checkbox_blank_circle_line,
                    color:
                        list.contains(extra.id) ? Style.primary : Style.black,
                  ),
                  10.horizontalSpace,
                  Text(
                    extra.value ?? "",
                    style: Style.interNormal(
                      size: 14,
                      color: Style.textColor,
                    ),
                  )
                ],
              ),
              const Divider(
                color: Style.backgroundColor,
              )
            ],
          );
  }
}
