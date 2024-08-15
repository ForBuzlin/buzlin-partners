import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/application/media/media_provider.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/buttons/animation_button_effect.dart';
import 'package:venderuzmart/presentation/component/buttons/second_button.dart';
import 'package:venderuzmart/presentation/styles/style.dart';

import 'custom_image_picker.dart';
import 'video_item.dart';

class MediaDialog extends ConsumerWidget {
  final ValueChanged<String> onImageChange;
  final ValueChanged<Galleries> onUpload;

  const MediaDialog(
      {super.key, required this.onImageChange, required this.onUpload});

  @override
  Widget build(BuildContext context, ref) {
    final notifier = ref.read(mediaProvider.notifier);
    final state = ref.watch(mediaProvider);
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (state.videoPath == null)
            Row(
              children: [
                _image(context),
                12.horizontalSpace,
                _video(notifier.setVideo),
              ],
            ),
          if (state.videoPath != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoItem(
                  url: state.videoPath,
                  height: 180,
                  isNetwork: false,
                  width: MediaQuery.sizeOf(context).width / 1.4,
                ),
                12.verticalSpace,
                Text('${AppHelpers.getTranslation(TrKeys.preview)}*'),
                4.verticalSpace,
                CustomImagePicker(
                  imageFilePath: state.imagePath,
                  onImageChange: notifier.setPreview,
                  onDelete: notifier.deletePreview,
                  width: MediaQuery.sizeOf(context).width / 1.4,
                ),
                12.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SecondButton(
                      bgColor: Style.bg,
                      title: TrKeys.cancel,
                      titleColor: Style.black,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    6.horizontalSpace,
                    SecondButton(
                      isLoading: state.isLoading,
                      title: TrKeys.save,
                      onTap: () {
                        if (state.imagePath == null) {
                          AppHelpers.errorSnackBar(context,
                              text: AppHelpers.getTranslation(
                                  TrKeys.pleaseSelectPreview));
                        } else {
                          notifier.upload(context, onSuccess: (s) {
                            onUpload.call(s);
                            Navigator.pop(context);
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  _image(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        Delayed(milliseconds: 300).run(() async {
         ImgService.getPhotoGallery(onImageChange);
        });
        Navigator.pop(context);
      },
      child: Container(
        height: 124,
        width: 124,
        decoration: BoxDecoration(
          color: Style.bg,
           borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Remix.image_add_line,
              color: Style.colorGrey,
              size: 24.r,
            ),
            Text(
              AppHelpers.getTranslation(TrKeys.image),
              style: Style.interNormal(color: Style.colorGrey, size: 14),
            )
          ],
        ),
      ),
    );
  }

  _video(Function(String) onChange) {
    return ButtonEffectAnimation(
      onTap: () async =>ImgService.getVideoGallery(onChange),
      child: Container(
        height: 124,
        width: 124,
        decoration: BoxDecoration(
          color: Style.bg,
           borderRadius: BorderRadius.circular((AppConstants.radius/1.4).r),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Remix.video_upload_line,
              color: Style.colorGrey,
              size: 24.r,
            ),
            Text(
              AppHelpers.getTranslation(TrKeys.video),
              style: Style.interNormal(color: Style.colorGrey, size: 14),
            )
          ],
        ),
      ),
    );
  }
}
