import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class SingleImagePicker extends StatelessWidget {
  final bool isEdit;
  final String? imageFilePath;
  final String? imageUrl;
  final Function(String) onImageChange;
  final Function() onDelete;
  final bool isAdding;
  final double? height;
  final double? width;

  const SingleImagePicker({
   super.key,
    required this.onImageChange,
    required this.onDelete,
    this.imageFilePath,
    this.imageUrl,
    this.isEdit = false,
    this.isAdding = true,
    this.height,
    this.width,
  }) ;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width / 4.8;
    return GestureDetector(
      onDoubleTap: () {
        // context.pushRoute();
      },
      child: Container(
        height: height ?? size + 16,
        width: width ?? size,
        padding: REdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.radius.r),
        ),
        child: (isAdding && imageFilePath == null)
            ? ButtonEffectAnimation(
                onTap: () async =>ImgService.getPhotoGallery(onImageChange),
                child: DottedBorder(
                  dashPattern: const [8],
                  color: Style.primary,
                  strokeWidth: 2.6,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(14.r),
                  child: Center(
                    child: Icon(
                      Remix.upload_cloud_2_line,
                      color: Style.primary,
                      size: 28.r,
                    ),
                  ),
                ),
              )
            : Stack(
                children: [
                  CommonImage(
                    height: height ?? size + 16,
                    width: width ?? size,
                    fileImage:
                        imageFilePath != null ? File(imageFilePath!) : null,
                    url: imageUrl,
                    radius: AppConstants.radius,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: imageFilePath != null
                        ? ButtonEffectAnimation(
                            onTap: onDelete,
                            child: BlurWrap(
                              radius: BorderRadius.circular(20.r),
                              child: Container(
                                height: 36.r,
                                width: 36.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Style.white.withOpacity(0.15),
                                ),
                                child: Icon(
                                  Remix.delete_bin_fill,
                                  color: Style.white,
                                  size: 18.r,
                                ),
                              ),
                            ),
                          )
                        : isEdit
                            ? ButtonEffectAnimation(
                                onTap: () async =>
                                   ImgService.getPhotoGallery(onImageChange),
                                child: BlurWrap(
                                  radius: BorderRadius.circular(20.r),
                                  child: Container(
                                    height: 36.r,
                                    width: 36.r,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Style.white.withOpacity(0.15),
                                    ),
                                    child: Icon(
                                      Remix.add_fill,
                                      color: Style.white,
                                      size: 18.r,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                  ),
                ],
              ),
      ),
    );
  }
}
