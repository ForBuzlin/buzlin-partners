import 'dart:io';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

class HorizontalImagePicker extends StatelessWidget {
  final String? imageFilePath;
  final String? imageUrl;
  final Function(String) onImageChange;
  final Function() onDelete;
  final bool isAdding;

  const HorizontalImagePicker({
   super.key,
    required this.onImageChange,
    required this.onDelete,
    this.imageFilePath,
    this.imageUrl,
    this.isAdding = false,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radius.r),
      ),
      child: (isAdding && (imageFilePath?.isEmpty ?? true))
          ? InkWell(
              onTap: () async =>ImgService.getPhotoGallery(onImageChange),
              child: Container(
                width: double.infinity,
                height: 180.h,
                decoration: BoxDecoration(
                  color: Style.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: REdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    Icon(
                      Remix.upload_cloud_2_line,
                      color: Style.primary,
                      size: 36.r,
                    ),
                    16.verticalSpace,
                    Text(
                      AppHelpers.getTranslation(TrKeys.bgPicture),
                      style: Style.interSemi(
                        size: 14,
                        color: Style.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      AppHelpers.getTranslation(TrKeys.recommendedSize),
                      style: Style.interRegular(
                        size: 14,
                        color: Style.black,
                        letterSpacing: -0.3,
                      ),
                    )
                  ],
                ),
              ),
            )
          : Stack(
              children: [
                SizedBox(
                  height: 180.h,
                  width: double.infinity,
                  child: imageFilePath != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(AppConstants.radius.r),
                          child: Image.file(
                            File(imageFilePath!),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                      : CommonImage(
                          url: imageUrl,
                          width: double.infinity,
                          radius: AppConstants.radius,
                          fit: BoxFit.cover,
                        ),
                ),
                Positioned(
                  bottom: 12.h,
                  right: 16.w,
                  child: Row(
                    children: [
                      ButtonEffectAnimation(
                        child: GestureDetector(
                            onTap: () async =>
                               ImgService.getPhotoGallery(onImageChange),
                            child: CustomTextButton(
                              text:
                                  AppHelpers.getTranslation(TrKeys.changePhoto),
                              backGroundColor: Style.white,
                            )
                            // BlurWrap(
                            //   radius: BorderRadius.circular(18.r),
                            //   child: Container(
                            //     height: 36.r,
                            //     width: 36.r,
                            //     decoration: BoxDecoration(
                            //       shape: BoxShape.circle,
                            //       color: Style.white.withOpacity(0.15),
                            //     ),
                            //     child: Icon(
                            //       Remix.image_add_fill,
                            //       color: (!isAdding &&
                            //               imageUrl == null &&
                            //               imageFilePath == null)
                            //           ? Style.black
                            //           : Style.white,
                            //       size: 18.r,
                            //     ),
                            //   ),
                            // ),
                            ),
                      ),
                      10.horizontalSpace,
                      if (imageFilePath != null)
                        ButtonEffectAnimation(
                          child: CircleButton(
                            icon: Remix.delete_bin_line,
                            onTap: onDelete,
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
