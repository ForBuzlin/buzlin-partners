import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class FormOptionItem extends StatelessWidget {
  final FormOptionsData form;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final int spacing;

  const FormOptionItem({
    super.key,
    required this.form,
    required this.onEdit,
    this.spacing = 10,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular((AppConstants.radius / 1.4).r),
      ),
      margin: EdgeInsets.only(bottom: spacing.r),
      padding: REdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                width: 4.r,
                height: 56.r,
                padding: REdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color:  AppHelpers.getStatusColor(form.active.toString()),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    )),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(form.translation?.title ??
                        AppHelpers.getTranslation(TrKeys.unKnow)),
                    4.verticalSpace,

                  ],
                ),
              ),
              8.horizontalSpace,
              Row(
                children: [
                  CircleButton(
                    onTap: onEdit,
                    icon: Remix.pencil_line,
                  ),
                  8.horizontalSpace,
                  CircleButton(
                    onTap: onDelete,
                    icon: Remix.delete_bin_line,
                  ),
                ],
              ),
              12.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
