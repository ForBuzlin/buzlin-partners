import 'dart:io';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

class DraggableImagePicker extends StatelessWidget {
  final List<String?>? listOfImages;
  final List<Galleries?>? imageUrls;
  final Function(String) onDelete;
  final Function(String) onImageChange;
  final bool isCreating;
  final bool isExtras;

  const DraggableImagePicker({
    super.key,
    this.listOfImages,
    required this.onDelete,
    this.imageUrls,
    required this.onImageChange,
    this.isCreating = false,
    this.isExtras = false,
  });

  @override
  Widget build(BuildContext context) {
    return isCreating
        ? _createProductImage(context)
        : !isExtras
            ? _editProductImage(context)
            : _editExtrasImage(context);
  }

  _createProductImage(BuildContext context) {
    int itemCount = (listOfImages?.length ?? 0) + (imageUrls?.length ?? 0);
    return Column(
      children: [
        (listOfImages?.isEmpty ?? true)
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
                        AppHelpers.getTranslation(TrKeys.productPicture),
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
                  CommonImage(
                    fileImage: ((imageUrls?.isEmpty ?? true) &&
                            (listOfImages?.isNotEmpty ?? false))
                        ? File(listOfImages?.first ?? "")
                        : null,
                    url: (imageUrls?.isNotEmpty ?? false)
                        ? imageUrls?.first?.path
                        : null,
                    height: MediaQuery.sizeOf(context).height / 5.5,
                    width: double.infinity,
                    radius: AppConstants.radius,
                    fit: BoxFit.fitWidth,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: ButtonEffectAnimation(
                      onTap: () => onDelete(listOfImages?.first ?? ""),
                      child: BlurWrap(
                        blur: 4,
                        radius: BorderRadius.circular(20.r),
                        child: Container(
                          height: 32.r,
                          width: 32.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Style.white.withOpacity(0.15),
                          ),
                          child: Icon(
                            Remix.delete_bin_fill,
                            color: Style.white,
                            size: 16.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        16.verticalSpace,
        GridView.builder(
            itemCount: itemCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.r,
              mainAxisSpacing: 8.r,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return itemCount == index + 1
                  ? SingleImagePicker(
                      onImageChange: onImageChange,
                      onDelete: () {},
                    )
                  : Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: CommonImage(
                            fileImage: (listOfImages?.length ?? 0) > (index - 1)
                                ? File(listOfImages?[index + 1] ?? "")
                                : null,
                            url: (imageUrls?.length ?? 0) > index
                                ? (imageUrls?[index + 1]?.path ?? "")
                                : null,
                            height: 50,
                            width: 60,
                            radius: AppConstants.radius,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ButtonEffectAnimation(
                            onTap: () {
                              String path;
                              try {
                                path = listOfImages![index + 1] ?? "";
                              } catch (e) {
                                path = imageUrls?[index -
                                            (listOfImages?.length ?? 0) +
                                            1]
                                        ?.path ??
                                    "";
                              }
                              onDelete(path);
                            },
                            child: BlurWrap(
                              blur: 4,
                              radius: BorderRadius.circular(20.r),
                              child: Container(
                                height: 32.r,
                                width: 32.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Style.white.withOpacity(0.15),
                                ),
                                child: Icon(
                                  Remix.delete_bin_fill,
                                  color: Style.white,
                                  size: 16.r,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
            }),
      ],
    );
  }

  _editProductImage(BuildContext context) {
    int itemCount = (listOfImages?.length ?? 0) + (imageUrls?.length ?? 0);
    return Column(
      children: [
        (itemCount > 0) == false
            ? InkWell(
                onTap: () async =>ImgService.getPhotoGallery(onImageChange),
                child: Container(
                  width: double.infinity,
                  height: 180.r,
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
                        AppHelpers.getTranslation(TrKeys.productPicture),
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
                  CommonImage(
                    fileImage: ((imageUrls?.isEmpty ?? true) &&
                            (listOfImages?.isNotEmpty ?? false))
                        ? File(listOfImages?.first ?? "")
                        : null,
                    url: (imageUrls?.isNotEmpty ?? false)
                        ? imageUrls?.first?.path
                        : null,
                    height: MediaQuery.sizeOf(context).height / 5.5,
                    width: double.infinity,
                    radius: AppConstants.radius,
                    fit: BoxFit.fitHeight,
                  ),
                  Positioned(
                    right: 16.r,
                    top: 16.r,
                    child: ButtonEffectAnimation(
                      onTap: () => onDelete(
                        (imageUrls?.isNotEmpty ?? false)
                            ? imageUrls?.first?.path ?? ""
                            : listOfImages?.first ?? "",
                      ),
                      child: BlurWrap(
                        blur: 6,
                        radius: BorderRadius.circular(20.r),
                        child: Container(
                          height: 40.r,
                          width: 40.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Style.white.withOpacity(0.2),
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
        16.verticalSpace,
        GridView.builder(
            itemCount: itemCount,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 8.r,
                mainAxisSpacing: 8.r,
                maxCrossAxisExtent: 100.r,
                childAspectRatio: 0.9),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return itemCount == index + 1
                  ? SingleImagePicker(
                      onImageChange: onImageChange,
                      onDelete: () {},
                    )
                  : Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: CommonImage(
                            fileImage: (imageUrls?.length ?? 0) > index + 1
                                ? null
                                : File(listOfImages?[
                                        index - (imageUrls?.length ?? 0) + 1] ??
                                    ""),
                            url: (imageUrls?.length ?? 0) > index + 1
                                ? imageUrls![index + 1]?.path
                                : null,
                            height: 80,
                            width: 70,
                            radius: 12,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ButtonEffectAnimation(
                            onTap: () {
                              String path;
                              try {
                                path = imageUrls?[index + 1]?.path ?? "";
                              } catch (e) {
                                path = listOfImages?[
                                        (index - (imageUrls?.length ?? 0)) +
                                            1] ??
                                    "";
                              }
                              onDelete(path);
                            },
                            child: BlurWrap(
                              blur: 4,
                              radius: BorderRadius.circular(20.r),
                              child: Container(
                                height: 32.r,
                                width: 32.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Style.white.withOpacity(0.15),
                                ),
                                child: Icon(
                                  Remix.delete_bin_fill,
                                  color: Style.white,
                                  size: 16.r,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
            }),
      ],
    );
  }

  _editExtrasImage(BuildContext context) {
    int itemCount = (listOfImages?.length ?? 0) + (imageUrls?.length ?? 0);
    return Column(
      children: [
        SizedBox(
          height: 130.r,
          child: ListView.builder(
              padding: REdgeInsets.symmetric(horizontal: 16),
              itemCount: itemCount + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: REdgeInsets.only(right: 12),
                  height: 130,
                  width: 116,
                  child: itemCount == index
                      ? SingleImagePicker(
                          width: 116,
                          height: 130,
                          onImageChange: onImageChange,
                          onDelete: () {},
                        )
                      : Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: CommonImage(
                                fileImage: (imageUrls?.length ?? 0) > index
                                    ? null
                                    : File(listOfImages?[
                                            index - (imageUrls?.length ?? 0)] ??
                                        ""),
                                url: (imageUrls?.length ?? 0) > index
                                    ? imageUrls![index]?.path
                                    : null,
                                radius: 12,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: REdgeInsets.all(6),
                                child: ButtonEffectAnimation(
                                  onTap: () {
                                    String path;
                                    try {
                                      path = imageUrls?[index]?.path ?? "";
                                    } catch (e) {
                                      path = listOfImages?[(index -
                                              (imageUrls?.length ?? 0))] ??
                                          "";
                                    }
                                    onDelete(path);
                                  },
                                  child: BlurWrap(
                                    blur: 8,
                                    radius: BorderRadius.circular(20.r),
                                    child: Container(
                                      height: 32.r,
                                      width: 32.r,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Style.white.withOpacity(0.15),
                                      ),
                                      child: Icon(
                                        Remix.delete_bin_fill,
                                        color: Style.white,
                                        size: 16.r,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                );
              }),
        )
      ],
    );
  }
}
