import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io' show Platform;

import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class SendButton extends StatelessWidget {
  final VoidCallback sendMessage;
  final VoidCallback sendImage;
  final TextEditingController controller;
  final FocusNode focusNode;
  final MessageModel? replyMessage;
  final bool isLoading;
  final VoidCallback removeReplyMessage;

  const SendButton(
      {super.key,
      required this.sendMessage,
      required this.controller,
      required this.focusNode,
      this.replyMessage,
      required this.removeReplyMessage,
      required this.sendImage,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          6.verticalSpace,
          if (replyMessage != null)
            Padding(
              padding: EdgeInsets.only(left: 16.r, top: 8.r, bottom: 8.r),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    const Icon(
                      Remix.reply_line,
                    ),
                    8.horizontalSpace,
                    const VerticalDivider(
                      color: Style.dividerColor,
                      thickness: 2,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 120.r,
                      child: replyMessage?.type == "image"
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: CommonImage(
                                  url: replyMessage?.message ?? "",
                                  height: 56,
                                  width: 56,
                                  fit: BoxFit.contain,
                                  radius: 0),
                            )
                          : Text(
                              replyMessage?.message ?? "",
                              style: Style.interNormal(
                                size: 12,
                                letterSpacing: -0.5,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                    ),
                    ButtonEffectAnimation(
                        onTap: removeReplyMessage,
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: const Icon(
                            Remix.close_line,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          Container(
            height: 60.r,
            margin: EdgeInsets.only(
                left: 16.r,
                right: 16.r,
                bottom: MediaQuery.viewInsetsOf(context).bottom +
                    (MediaQuery.paddingOf(context).bottom/2) +
                    (Platform.isAndroid ? 8.r : (8.r))),
            padding: REdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Style.icon),
              borderRadius: BorderRadius.circular(AppConstants.radius.r),
              color: Style.icon,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    onPressed: sendImage,
                    icon: const Icon(
                      Remix.gallery_line,
                    )),
                Expanded(
                  child: TextFormField(
                    focusNode: focusNode,
                    onEditingComplete: sendMessage,
                    controller: controller,
                    cursorWidth: 1.r,
                    cursorColor: Style.black,
                    style: Style.interNormal(
                      size: 14,
                      letterSpacing: -0.5,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: Style.interNormal(
                        size: 12,
                        letterSpacing: -0.5,
                        color: Style.textHint,
                      ),
                      hintText: AppHelpers.getTranslation(TrKeys.typeSomething),
                    ),
                  ),
                ),
                8.horizontalSpace,
                InkWell(
                  onTap: sendMessage,
                  child: Container(
                    width: 42.r,
                    height: 42.r,
                    decoration: const BoxDecoration(
                        color: Style.backgroundColor, shape: BoxShape.circle),
                    child: isLoading
                        ? const Loading()
                        : Icon(
                            Remix.send_plane_2_line,
                            size: 18.r,
                          ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
