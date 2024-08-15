import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class ChatItem extends StatelessWidget {
  final ChatModel chat;

  const ChatItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.r),
      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 16.r),
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular(AppConstants.radius.r),
      ),
      child: Row(
        children: [
          CommonImage(
            url: chat.user?.img,
            height: 56,
            width: 56,
            radius: 28,
            name: chat.user?.firstname ?? chat.user?.lastname,
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${chat.user?.firstname ?? ""} ${chat.user?.lastname ?? ""}",
                  style: Style.interNormal(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                6.verticalSpace,
                Text(
                  chat.lastMessage ?? "",
                  style: Style.interRegular(color: Style.textHint, size: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          16.horizontalSpace,
          Text(
            DateService.dateFormatForChat(chat.lastTime?.toDate()),
            style: Style.interNormal(size: 14),
          ),
        ],
      ),
    );
  }
}
