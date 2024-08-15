import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'shop_galleries_state.dart';

class ShopGalleriesNotifier extends StateNotifier<ShopGalleriesState> {
  final ShopsFacade _shopsRepository;
  final SettingsFacade _settingsRepository;

  ShopGalleriesNotifier(this._shopsRepository, this._settingsRepository)
      : super(const ShopGalleriesState());

  Future<void> setGalleries(BuildContext context) async {
    state = state.copyWith(isUpdating: true);
    List<String> imageUrl = List.from(state.listOfUrls.map((e) => e.path));
    if (state.images.isNotEmpty) {
      final imageResponse = await _settingsRepository.uploadMultiImage(
        state.images,
        UploadType.products,
      );
      imageResponse.when(
        success: (data) {
          imageUrl.addAll(data.data?.title ?? []);
        },
        failure: (failure, status) {
          debugPrint('==> upload product image fail: $failure');
          AppHelpers.errorSnackBar(context, text: failure);
          state = state.copyWith(isLoading: true);
        },
      );
    }
    List<Galleries> tempList = List.from(List.from(state.listOfUrls)
        .where((element) => element.preview != null));
    List<String> previews = [];
    for (var element in tempList) {
      if (element.preview?.isNotEmpty ?? false) {
        previews.add(element.preview!);
      }
    }
    final response = await _shopsRepository.setGalleries(
        images: imageUrl, previews: previews);
    response.when(
      success: (data) {
        state = state.copyWith(isUpdating: false);
        AppHelpers.successSnackBar(context);
      },
      failure: (failure, status) {
        state = state.copyWith(isUpdating: false);
        AppHelpers.errorSnackBar(context, text: failure);
        debugPrint('==> set shop galleries failure $failure');
      },
    );
  }

  Future<void> fetchShopGalleries(
      {VoidCallback? checkYourNetwork, VoidCallback? onSuccess}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _shopsRepository.getGalleries();
      response.when(
        success: (data) async {
          state = state.copyWith(
              isLoading: false, listOfUrls: data.galleries ?? [], images: []);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> get shop galleries failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setImageFile(String file) {
    List<String> list = List.from(state.images);
    list.add(file);
    state = state.copyWith(images: list);
  }

  void setUploadImage(Galleries gallery) {
    List<Galleries> list = List.from(state.listOfUrls);
    list.insert(0, gallery);
    state = state.copyWith(listOfUrls: list);
  }

  void deleteImage(String value) {
    List<String> list = List.from(state.images);
    list.remove(value);
    List<Galleries> urls = List.from(state.listOfUrls);
    urls.removeWhere((element) => element.path == value);
    state = state.copyWith(images: list, listOfUrls: urls);
  }
}
