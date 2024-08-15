import 'dart:io';

import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/buttons/animation_button_effect.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import '../helper/blur_wrap.dart';
import 'common_image.dart';

class CustomImagePicker extends StatelessWidget {
  final String? imageFilePath;
  final String? imageUrl;
  final String? preview;
  final Function(String) onImageChange;
  final VoidCallback? onDelete;
  final bool isAdding;
  final double width;
  final double radius;
  final double height;

  const CustomImagePicker({
   super.key,
    required this.onImageChange,
    this.onDelete,
    this.imageFilePath,
    this.imageUrl,
    this.isAdding = false,
    this.width = double.infinity,
    this.height = 172,
    this.preview,
    this.radius = AppConstants.radius,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.r,
      width: width.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.r),
      ),
      child: Stack(
        children: [
          ButtonEffectAnimation(
            onTap: () async =>ImgService.getPhotoGallery(onImageChange),
            child: SizedBox(
              width: width.r,
              height: height.r,
              child: (imageFilePath != null || imageUrl != null)
                  ? CommonImage(
                      url: imageUrl,
                      fileImage:
                          imageFilePath != null ? File(imageFilePath!) : null,
                      preview: preview,
                      width: width,
                      radius: radius,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: width.r,
                      height: height.r,
                      decoration: BoxDecoration(
                        color: Style.greyColor,
                        borderRadius: BorderRadius.circular(radius.r),
                      ),
                      child: Center(
                          child: Icon(
                        Remix.image_add_fill,
                        color: (!isAdding &&
                                imageUrl == null &&
                                imageFilePath == null)
                            ? Style.colorGrey
                            : Style.white,
                        size: 18.r,
                      )),
                    ),
            ),
          ),
          Positioned(
            top: 12.h,
            right: 16.w,
            child: Row(
              children: [
                if (imageFilePath != null && onDelete != null)
                  ButtonEffectAnimation(
                    child: GestureDetector(
                      onTap: onDelete,
                      child: BlurWrap(
                        radius: BorderRadius.circular(radius.r),
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
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
