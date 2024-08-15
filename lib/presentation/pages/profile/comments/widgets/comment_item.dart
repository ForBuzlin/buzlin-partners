import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class CommentItem extends StatelessWidget {
  final CommentsData commentsData;
  final int spacing;

  const CommentItem({
   super.key,
    required this.commentsData,
    this.spacing = 1,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.white,
         borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
      ),
      margin: EdgeInsets.only(bottom: spacing.r),
      padding: REdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CommonImage(
                width: 48,
                height: 48,
                url: commentsData.product?.img,
                errorRadius: 0,
                fit: BoxFit.cover,
              ),
              8.horizontalSpace,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width - 36.r,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              commentsData.product?.translation?.title ?? "",
                              style: Style.interNormal(
                                size: 14,
                                color: Style.black,
                                letterSpacing: -0.3,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              commentsData.product?.translation?.description ??
                                  "",
                              style: Style.interRegular(
                                size: 12,
                                color: Style.textColor,
                                letterSpacing: -0.3,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              12.horizontalSpace,
            ],
          ),
          Divider(height: 24.r),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonImage(
                width: 36,
                height: 36,
                url: commentsData.user?.img,
                errorRadius: 0,
                radius: 18,
                fit: BoxFit.cover,
              ),
              8.horizontalSpace,
              Expanded(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width - 50.r,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          '${commentsData.user?.firstname ?? ''} ${commentsData.user?.lastname ?? ''}',
                          style: Style.interNormal(
                            size: 14,
                            color: Style.black,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                      8.horizontalSpace,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.r),
                          color: Style.colorGrey,
                        ),
                        height: 6.r,
                        width: 6.r,
                      ),
                      8.horizontalSpace,
                      Icon(
                        Remix.star_smile_fill,
                        color: Style.starColor,
                        size: 20.r,
                      ),
                      8.horizontalSpace,
                      Text(
                        '${commentsData.rating?.toDouble() ?? ''}',
                        style: Style.interNormal(
                          size: 16,
                          color: Style.black,
                          letterSpacing: -0.3,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              12.horizontalSpace,
            ],
          ),
          12.verticalSpace,
          Text(
            commentsData.comment ?? '',
            style: Style.interRegular(
              size: 14,
              color: Style.textColor,
              letterSpacing: -0.3,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              DateService.dateFormatForOrder(commentsData.updatedAt),
              style: Style.interRegular(
                size: 12,
                color: Style.textColor,
                letterSpacing: -0.3,
              ),
            ),
          ),
          SizedBox(
            height: (commentsData.galleries?.isNotEmpty ?? false) ? 48 : 0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: commentsData.galleries?.length ?? 0,
                itemBuilder: (context, index) {
                  return CommonImage(
                    width: 48,
                    height: 48,
                    url: commentsData.galleries?[index].path,
                    errorRadius: 0,
                    fit: BoxFit.cover,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
