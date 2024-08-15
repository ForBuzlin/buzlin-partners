import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class FaqItem extends StatelessWidget {
  final VoidCallback? onDelete;
  final VoidCallback? onChange;
  final TextEditingController questionController;
  final TextEditingController answerController;

  const FaqItem(
      {super.key,
      required this.onDelete,
      required this.questionController,
      required this.answerController,
      this.onChange});

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
                                bottomLeft:
                                    Radius.circular(AppConstants.radius.r),
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
            borderRadius: BorderRadius.circular((AppConstants.radius / 1.4).r),
          ),
          child: Column(
            children: [
              CustomTextFormField(
                label: TrKeys.question,
                radius: 12,
                controller: questionController,
              ),
              8.verticalSpace,
              CustomTextFormField(
                label: TrKeys.answer,
                radius: 12,
                controller: answerController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
