import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'media_state.dart';

class MediaNotifier extends StateNotifier<MediaState> {
  final SettingsFacade _settingsRepository;

  MediaNotifier(this._settingsRepository) : super(const MediaState());

  setVideo(String path) {
    state = state.copyWith(videoPath: path);
  }

  setPreview(String path) {
    state = state.copyWith(imagePath: path);
  }

  deletePreview() {
    state = state.copyWith(imagePath: null);
  }

  upload(BuildContext context,
      {required ValueChanged<Galleries> onSuccess}) async {
    state = state.copyWith(isLoading: true);
    final response = await _settingsRepository.uploadImage(
        state.imagePath!, UploadType.products);
    response.when(success: (image) async {
      final res = await _settingsRepository.uploadImage(
          state.videoPath!, UploadType.products);
      res.when(success: (video) {
        onSuccess.call(Galleries(
          path: video.imageData?.title ?? '',
          preview: image.imageData?.title ?? '',
        ));
      }, failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
      });
    }, failure: (failure, status) {
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }
}
