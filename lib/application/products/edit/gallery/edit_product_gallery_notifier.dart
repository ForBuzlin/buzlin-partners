import 'package:flutter/material.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'edit_product_gallery_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class EditProductGalleryNotifier
    extends StateNotifier<EditProductGalleryState> {
  final ProductsFacade _productsRepository;
  final SettingsFacade _settingsRepository;

  EditProductGalleryNotifier(this._productsRepository, this._settingsRepository)
      : super(const EditProductGalleryState());

  void initial(List<Stocks>? stocks) {
    stocks = stocks ?? [];
    Map<String, List<Galleries?>> gallery = Map.from(state.listOfUrls);
    List<Extras> extras = [];
    List<int> ids = [];
    for (int i = 0; i < stocks.length; i++) {
      final list = stocks[i]
          .extras
          ?.where((element) => element.group?.type == TrKeys.color)
          .toList();
      if (list?.isNotEmpty ?? false) {
        if (!ids.contains(list?.first.id)) {
          extras.add(list?.first ?? Extras());
          ids.add(list?.first.id ?? 0);
          gallery[list?.first.stockId.toString() ?? ''] =
              stocks[i].galleries ?? [];
        }
      }
    }
    state = state.copyWith(
        images: <String, List<String?>>{}, listOfUrls: gallery, extras: extras);
  }

  void setImageFile({required String path, required String key}) {
    Map<String, List<String?>> image = Map.from(state.images);
    List<String> list = List.from(image[key] ?? []);
    list.add(path);
    image[key] = list;
    state = state.copyWith(images: image);
  }

  void deleteImage({required String path, required String key}) {
    Map<String, List<String?>> images = Map.from(state.images);
    List<String> list = List.from(images[key] ?? []);
    list.remove(path);
    images[key] = list;
    Map<String, List<Galleries?>> gallery = Map.from(state.listOfUrls);
    List<Galleries> urls = List.from(gallery[key] ?? []);
    urls.removeWhere((element) => element.path == path);
    gallery[key] = urls;

    state = state.copyWith(images: images, listOfUrls: gallery);
  }

  updateGallery(
    BuildContext context, {
    VoidCallback? updated,
  }) async {
    state = state.copyWith(isSaving: true);
    Map<String, List<String?>> imageUrl = {};
    Map<String, List<Galleries?>> listOfUrls = Map.from(state.listOfUrls);
    for (var key in listOfUrls.keys) {
      imageUrl[key] = listOfUrls[key]?.map((e) => e?.path).toList() ?? [];
    }
    for (var key in state.images.keys) {
      if (state.images[key]?.isNotEmpty ?? false) {
        final imageResponse = await _settingsRepository.uploadMultiImage(
          state.images[key]!,
          UploadType.stocks,
        );
        imageResponse.when(
          success: (data) {
            imageUrl.addAll({key: data.data?.title ?? []});
          },
          failure: (failure, status) {
            debugPrint('==> upload galleries image fail: $failure');
       AppHelpers.errorSnackBar(context, text: failure);
            state = state.copyWith(isLoading: true);
          },
        );
      }
    }
    final response = await _productsRepository.updateGalleries(imageUrl);
    response.when(
      success: (data) {
        state = state.copyWith(isSaving: false);
        updated?.call();
      },
      failure: (failure, status) {
        state = state.copyWith(isSaving: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }
}
