import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class SocialItem extends StatelessWidget {
  final VoidCallback? onDelete;
  final VoidCallback? onChange;
  final TextEditingController typeController;
  final TextEditingController valueController;

  const SocialItem(
      {super.key,
      required this.onDelete,
      required this.typeController,
      required this.valueController,
      this.onChange})
      ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 8),
      child: Slidable(
        endActionPane: onDelete == null
            ? null
            : ActionPane(
                extentRatio: 0.12,
                motion: const ScrollMotion(),
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Slidable.of(context)?.close();
                            onDelete?.call();
                          },
                          child: Container(
                            width: 50.r,
                            height: 72.r,
                            decoration: BoxDecoration(
                              color: Style.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppConstants.radius.r),
                                bottomLeft: Radius.circular(AppConstants.radius.r),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Remix.delete_bin_line,
                              color: Style.white,
                              size: 24.r,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
        child: Container(
          margin: REdgeInsets.symmetric(horizontal: 8),
          padding: REdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Style.white,
             borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomDropDown(
                  hint: TrKeys.type,
                  radius: 12,
                  value: typeController.text.isNotEmpty
                      ? typeController.text
                      : null,
                  list: List.from(AppConstants.socialIcon.keys),
                  onChanged: (value) {
                    typeController.text = value;
                    if (onDelete == null) {
                      onChange?.call();
                    }
                  },
                ),
              ),
              8.horizontalSpace,
              Expanded(
                flex: 5,
                child: CustomTextFormField(
                  hint: TrKeys.value,
                  radius: 12,
                  controller: valueController,
                  contentPadding:
                      REdgeInsets.symmetric(horizontal: 18, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
