import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'media_dialog.dart';

class MultiImagePicker extends StatelessWidget {
  final List<String?>? listOfImages;
  final List<Galleries?>? imageUrls;
  final Function(String) onDelete;
  final Function(String) onImageChange;
  final ValueChanged<Galleries>? onUpload;
  final bool isExtras;
  final bool isShopGallery;

  const MultiImagePicker({
    super.key,
    this.listOfImages,
    required this.onDelete,
    this.imageUrls,
    required this.onImageChange,
    this.isExtras = false,
    this.onUpload,
    this.isShopGallery = false,
  });

  @override
  Widget build(BuildContext context) {
    return isExtras
        ? _editExtrasImage(context)
        : isShopGallery
        ? _shopGalleryImage(context)
        : _editProductImage(context);
  }

  _editProductImage(BuildContext context) {
    int itemCount = (listOfImages?.length ?? 0) + (imageUrls?.length ?? 0);
    return Column(
      children: [
        (itemCount > 0) == false
            ? ButtonEffectAnimation(
          onTap: () async {
            AppHelpers.showAlertDialog(
                context: context,
                child: MediaDialog(
                  onImageChange: onImageChange,
                  onUpload: (v) => onUpload?.call(v),
                ));
          },
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
              radius: 16,
              onDelete: () {
                AppHelpers.showCustomModalBottomSheet(
                    context: context,
                    modal: DeleteModal(onDelete: () {
                      onDelete(
                        (imageUrls?.isNotEmpty ?? false)
                            ? imageUrls?.first?.path ?? ""
                            : listOfImages?.first ?? "",
                      );
                      Navigator.pop(context);
                    }));
              },
              preview: imageUrls?.isNotEmpty ?? false
                  ? imageUrls?.first?.preview
                  : null,
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
        if (itemCount > 0)
          GridView.builder(
              padding: REdgeInsets.only(top: 12),
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
                    ? _mediaPicker(context)
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
                            : File(listOfImages?[index -
                            (imageUrls?.length ?? 0) +
                            1] ??
                            ""),
                        url: (imageUrls?.length ?? 0) > index + 1
                            ? imageUrls![index + 1]?.path
                            : null,
                        preview: (imageUrls?.length ?? 0) > index + 1
                            ? imageUrls![index + 1]?.preview
                            : null,
                        onDelete: () {
                          AppHelpers.showCustomModalBottomSheet(
                              context: context,
                              modal: DeleteModal(onDelete: () {
                                String path;
                                try {
                                  path =
                                      imageUrls?[index + 1]?.path ?? "";
                                } catch (e) {
                                  path = listOfImages?[(index -
                                      (imageUrls?.length ?? 0)) +
                                      1] ??
                                      "";
                                }
                                onDelete(path);
                                Navigator.pop(context);
                              }));
                        },
                        height: 80,
                        width: 70,
                        radius: 12,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if ((imageUrls?.length ?? 0) > index + 1
                        ? imageUrls![index + 1]?.preview == null
                        : true)
                      Positioned.fill(
                        child: Center(
                          child: ButtonEffectAnimation(
                            onTap: () {
                              String path;
                              try {
                                path = imageUrls?[index + 1]?.path ?? "";
                              } catch (e) {
                                path = listOfImages?[(index -
                                    (imageUrls?.length ?? 0)) +
                                    1] ??
                                    "";
                              }
                              onDelete(path);
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                  color: Style.white.withOpacity(0.8),
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Remix.delete_bin_line,
                                color: Style.black,
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                );
              }),
      ],
    );
  }

  _shopGalleryImage(BuildContext context) {
    int itemCount = (listOfImages?.length ?? 0) + (imageUrls?.length ?? 0) + 1;

    return Column(
      children: [
        GridView.builder(
            padding: REdgeInsets.only(top: 12),
            itemCount: itemCount,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 8.r,
                mainAxisSpacing: 8.r,
                maxCrossAxisExtent: 136.r,
                childAspectRatio: 0.9),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return itemCount == index + 1
                  ? _mediaPicker(context)
                  : Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
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
                      preview: (imageUrls?.length ?? 0) > index
                          ? imageUrls![index]?.preview
                          : null,
                      onDelete: () {
                        AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            modal: DeleteModal(onDelete: () {
                              String path;
                              try {
                                path = imageUrls?[index]?.path ?? "";
                              } catch (e) {
                                path = listOfImages?[(index -
                                    (imageUrls?.length ?? 0))] ??
                                    "";
                              }
                              onDelete(path);
                              Navigator.pop(context);
                            }));
                      },
                      height: 120,
                      radius: 12,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if ((imageUrls?.length ?? 0) > index
                      ? imageUrls![index]?.preview == null
                      : true)
                    Positioned(
                      top: 12.r,
                      right: 12.r,
                      child: ButtonEffectAnimation(
                        onTap: () {
                          String path;
                          try {
                            path = imageUrls?[index]?.path ?? "";
                          } catch (e) {
                            path = listOfImages?[
                            (index - (imageUrls?.length ?? 0))] ??
                                "";
                          }
                          onDelete(path);
                        },
                        child: Container(
                          padding: REdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Style.white.withOpacity(0.8),
                              shape: BoxShape.circle),
                          child: Icon(
                            Remix.delete_bin_line,
                            color: Style.black,
                            size: 21.r,
                          ),
                        ),
                      ),
                    )
                ],
              );
            }),
      ],
    );
  }

  _mediaPicker(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () async {
        AppHelpers.showAlertDialog(
            context: context,
            child: MediaDialog(
              onImageChange: onImageChange,
              onUpload: (v) => onUpload?.call(v),
            ));
      },
      child: DottedBorder(
        dashPattern: const [8],
        color: Style.primary,
        strokeWidth: 2.6,
        borderType: BorderType.RRect,
        radius: Radius.circular(AppConstants.radius.r),
        child: Center(
          child: Icon(
            Remix.upload_cloud_2_line,
            color: Style.primary,
            size: 28.r,
          ),
        ),
      ),
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
