import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class StoriesItem extends StatelessWidget {
  final StoriesData stories;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final int spacing;

  const StoriesItem({
    super.key,
    required this.stories,
    required this.onEdit,
    this.spacing = 1,
    required this.onDelete,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
         borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
      ),
      margin: EdgeInsets.only(bottom: spacing.r),
      padding: REdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              12.horizontalSpace,
              CommonImage(
                width: 44,
                height: 48,
                url: (stories.fileUrls?.isNotEmpty ?? false)
                    ? stories.fileUrls?.first
                    : null,
                errorRadius: 0,
                fit: BoxFit.cover,
              ),
              8.horizontalSpace,
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        stories.product?.translation?.title ?? '',
                        style: Style.interRegular(
                          size: 14,
                          color: Style.black,
                          letterSpacing: -0.3,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    8.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        8.horizontalSpace,
                        CircleButton(
                          onTap: onEdit,
                          icon: Remix.pencil_line,
                        ),
                        8.horizontalSpace,
                        CircleButton(
                          onTap: onDelete,
                          icon: Remix.delete_bin_line,
                        ),
                        8.horizontalSpace,
                      ],
                    ),
                  ],
                ),
              ),
              12.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
