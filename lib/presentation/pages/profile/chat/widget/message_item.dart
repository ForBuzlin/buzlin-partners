import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'focused_custom_menu.dart';
import 'image_chat_screen.dart';

class MessageItem extends StatelessWidget {
  final MessageModel message;
  final MessageModel? replyMessage;
  final ValueChanged<String> edit;
  final ValueChanged<MessageModel> reply;
  final ValueChanged<String> delete;

  const MessageItem({
    super.key,
    required this.message,
    required this.edit,
    required this.reply,
    required this.delete,
    required this.replyMessage,
  });

  @override
  Widget build(BuildContext context) {
    bool owner = LocalStorage.getUser()?.id == message.senderId;
    return FocusedMenuHolder(
      menuBoxDecoration: const BoxDecoration(
        color: Style.white,
      ),
      borderColor: Style.transparent,
      menuItems: owner
          ? [
              if (message.type != "image")
                FocusedMenuItem(
                    backgroundColor: Style.subCategory,
                    title: Text(
                      TrKeys.edit,
                      style: Style.interNormal(),
                    ),
                    trailingIcon: const Icon(
                      Remix.edit_box_line,
                    ),
                    onPressed: () => edit(message.doc ?? "")),
              if (message.type != "image")
                FocusedMenuItem(
                    backgroundColor: Style.subCategory,
                    title: Text(
                      TrKeys.copy,
                      style: Style.interNormal(),
                    ),
                    trailingIcon: const Icon(
                      Remix.file_copy_2_line,
                    ),
                    onPressed: () {
                      AppHelpers.errorSnackBar(context,
                          text: TrKeys.messageCopied);
                      Clipboard.setData(
                        ClipboardData(
                          text: message.message ?? "",
                        ),
                      );
                    }),
              FocusedMenuItem(
                  backgroundColor: Style.subCategory,
                  title: Text(
                    TrKeys.reply,
                    style: Style.interNormal(),
                  ),
                  trailingIcon: const Icon(
                    Remix.reply_line,
                  ),
                  onPressed: () {
                    reply(message);
                  }),
              FocusedMenuItem(
                  backgroundColor: Style.subCategory,
                  title: Text(
                    TrKeys.delete,
                    style: Style.interNormal(color: Style.red),
                  ),
                  trailingIcon: const Icon(
                    Remix.delete_bin_6_line,
                    color: Style.red,
                  ),
                  onPressed: () => delete(message.doc ?? "")),
            ]
          : [
              FocusedMenuItem(
                  backgroundColor: Style.subCategory,
                  title: Text(
                    TrKeys.reply,
                    style: Style.interNormal(),
                  ),
                  trailingIcon: const Icon(
                    Remix.reply_line,
                  ),
                  onPressed: () => reply(message)),
              if (message.type != "image")
                FocusedMenuItem(
                    backgroundColor: Style.subCategory,
                    title: Text(
                      TrKeys.copy,
                      style: Style.interNormal(),
                    ),
                    trailingIcon: const Icon(
                      Remix.file_copy_2_line,
                    ),
                    onPressed: () {
                      AppHelpers.errorSnackBar(context,
                          text: TrKeys.messageCopied);
                      Clipboard.setData(
                        ClipboardData(
                          text: message.message ?? "",
                        ),
                      );
                    }),
            ],
      child: SwipeTo(
        key: UniqueKey(),
        onLeftSwipe: (s) {
          return reply(message);
        },
        child: Container(
          color: Style.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (owner) const Spacer(),
              message.type == "image"
                  ? _image(owner, context)
                  : _message(owner, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(bool owner, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ImageChatPage(image: message.message ?? ""),
          ),
        );
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 2 / 3,
        height: MediaQuery.sizeOf(context).width * 2 / 3,
        margin: EdgeInsets.only(bottom: 8.r, left: 8.r, right: 8.r),
        padding: EdgeInsets.all(2.r),
        decoration: BoxDecoration(
          color: owner ? Style.primary : Style.subCategory,
          borderRadius: BorderRadius.circular(AppConstants.radius.r),
        ),
        child: CommonImage(
            url: message.message ?? "",
            height: MediaQuery.sizeOf(context).width * 2 / 3,
            width: MediaQuery.sizeOf(context).width * 2 / 3,
            radius: AppConstants.radius),
      ),
    );
  }

  Widget _message(bool owner, BuildContext context) {
    return (message.message?.length ?? 0) > 26
        ? Container(
            width: MediaQuery.sizeOf(context).width * 2 / 3,
            margin: EdgeInsets.only(bottom: 8.r, left: 8.r, right: 8.r),
            padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 16.r),
            decoration: BoxDecoration(
              color: owner ? Style.primary : Style.subCategory,
              borderRadius: BorderRadius.circular(AppConstants.radius.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (replyMessage?.doc != "")
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        VerticalDivider(
                          color: owner ? Style.dividerColor : Style.icon,
                          thickness: 2,
                        ),
                        replyMessage?.type == "image"
                            ? CommonImage(
                                url: replyMessage?.message ?? "",
                                height: 56,
                                width: 56,
                                fit: BoxFit.contain,
                                radius: 0)
                            : (replyMessage?.message?.length ?? 0) > 26
                                ? SizedBox(
                                    width: MediaQuery.sizeOf(context).width *
                                        2 /
                                        3,
                                    child: Text(
                                      replyMessage?.message ?? "",
                                      style: Style.interNormal(
                                          color:
                                              owner ? Style.white : Style.black,
                                          size: 12),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                : Text(
                                    replyMessage?.message ?? "",
                                    style: Style.interNormal(
                                        color:
                                            owner ? Style.white : Style.black,
                                        size: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                      ],
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        message.message ?? "",
                        style: Style.interNormal(
                            color: owner ? Style.white : Style.black, size: 12),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.r,
                        left: 4.r,
                      ),
                      child: Row(
                        children: [
                          Text(
                            DateFormat("HH:mm")
                                .format(message.time ?? DateTime.now()),
                            style: Style.interRegular(
                                color: owner ? Style.white : Style.black,
                                size: 10),
                          ),
                          if (owner)
                            Icon(
                              message.read
                                  ? Remix.check_double_line
                                  : Remix.check_line,
                              size: 12.r,
                              color: Style.white,
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.only(bottom: 8.r, left: 8.r, right: 8.r),
            padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 16.r),
            decoration: BoxDecoration(
              color: owner ? Style.primary : Style.subCategory,
              borderRadius: BorderRadius.circular(AppConstants.radius.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (replyMessage?.doc != "")
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        VerticalDivider(
                          color: owner ? Style.dividerColor : Style.icon,
                          thickness: 2,
                        ),
                        replyMessage?.type == "image"
                            ? CommonImage(
                                url: replyMessage?.message ?? "",
                                height: 56,
                                width: 56,
                                fit: BoxFit.contain,
                                radius: 0)
                            : (replyMessage?.message?.length ?? 0) > 26
                                ? SizedBox(
                                    width: MediaQuery.sizeOf(context).width *
                                        2 /
                                        3,
                                    child: Text(
                                      replyMessage?.message ?? "",
                                      style: Style.interNormal(
                                          color:
                                              owner ? Style.white : Style.black,
                                          size: 12),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                : Text(
                                    replyMessage?.message ?? "",
                                    style: Style.interNormal(
                                        color:
                                            owner ? Style.white : Style.black,
                                        size: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                      ],
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message.message ?? "",
                      style: Style.interNormal(
                          color: owner ? Style.white : Style.black, size: 12),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10.r,
                        left: 4.r,
                      ),
                      child: Row(
                        children: [
                          Text(
                            DateFormat("HH:mm")
                                .format(message.time ?? DateTime.now()),
                            style: Style.interRegular(
                                color: owner ? Style.white : Style.black,
                                size: 10),
                          ),
                          if (owner)
                            Icon(
                              message.read
                                  ? Remix.check_double_line
                                  : Remix.check_line,
                              size: 12.r,
                              color: Style.white,
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
