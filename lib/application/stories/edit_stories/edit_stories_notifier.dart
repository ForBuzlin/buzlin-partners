import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'edit_stories_state.dart';

class EditStoriesNotifier extends StateNotifier<EditStoriesState> {
  final StoriesFacade _storiesRepository;
  final SettingsFacade _settingsRepository;

  EditStoriesNotifier(this._storiesRepository, this._settingsRepository)
      : super(EditStoriesState(textEditingController: TextEditingController()));

  Future<void> updateStories(
    BuildContext context, {
    VoidCallback? updated,
    VoidCallback? failed,
  }) async {
    state = state.copyWith(isLoading: true);
    List<String> imageUrl = List.from(state.listOfUrls);
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
    final response = await _storiesRepository.updateStories(
      id: state.selectProduct?.id,
      img: imageUrl,
      storyId: state.story?.id ?? 0,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        updated?.call();
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
        state = state.copyWith(isLoading: false);
        debugPrint('===> brand update fail $failure');
        failed?.call();
      },
    );
  }

  void setImageFile(String file) {
    List<String> list = List.from(state.images);
    list.add(file);
    state = state.copyWith(images: list);
  }

  void setProduct(ProductData product) {
    state = state.copyWith(selectProduct: product);
    state.textEditingController?.text = product.translation?.title ?? '';
  }

  void deleteImage(String value) {
    List<String> list = List.from(state.images);
    list.remove(value);
    List<String> urls = List.from(state.listOfUrls);
    urls.removeWhere((element) => element == value);
    state = state.copyWith(images: list, listOfUrls: urls);
  }

  Future<void> setStoryDetails(StoriesData? story) async {
    state = state.copyWith(
        story: story,
        listOfUrls: story?.fileUrls ?? [],
        images: [],
        selectProduct: story?.product);
    state.textEditingController?.text =
        story?.product?.translation?.title ?? '';
  }

  Future<void> createStories(
    BuildContext context, {
    VoidCallback? created,
    VoidCallback? failed,
  }) async {
    state = state.copyWith(isLoading: true);
    List<String> imageUrl = [];
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
    final response = await _storiesRepository.createStories(
      id: state.selectProduct?.id,
      img: imageUrl,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        created?.call();
      },
      failure: (failure, status) {
        AppHelpers.errorSnackBar(context, text: failure);
        state = state.copyWith(isLoading: false);
        debugPrint('===> brand update fail $failure');
        failed?.call();
      },
    );
  }
}
