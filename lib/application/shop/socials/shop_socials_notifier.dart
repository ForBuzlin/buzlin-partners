import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'shop_socials_state.dart';

class ShopSocialsNotifier extends StateNotifier<ShopSocialsState> {
  final ShopsFacade _shopsRepository;

  ShopSocialsNotifier(this._shopsRepository) : super(const ShopSocialsState());

  Future<void> saveSocials({required VoidCallback? onSuccess}) async {
    state = state.copyWith(isSocialLoading: true);
    final response = await _shopsRepository.addShopSocials(
      socialTypes:
      AppHelpers.extractTextFromControllers(state.socialTypesController),
      socialContents:
      AppHelpers.extractTextFromControllers(state.socialControllers),
    );
    response.when(
      success: (data) {
        onSuccess?.call();
        state = state.copyWith(isSocialLoading: false);
      },
      failure: (failure, status) {
        state = state.copyWith(isSocialLoading: false);
        debugPrint('==> error social adding $failure');
      },
    );
  }

  Future<void> addSocial({String? type, String? value}) async {
    if (type?.isEmpty ?? true) {
      return;
    }
    List<TextEditingController> types = List.from(state.socialTypesController);
    List<TextEditingController> contents = List.from(state.socialControllers);
    types.add(TextEditingController(text: type));
    contents.add(TextEditingController(text: value));

    state = state.copyWith(
        socialTypesController: types, socialControllers: contents);
  }

  Future<void> fetchShopSocials(
      {VoidCallback? checkYourNetwork, VoidCallback? onSuccess}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSocialLoading: true);
      final response = await _shopsRepository.getShopSocials();
      response.when(
        success: (data) async {
          onSuccess?.call();
          List<TextEditingController> types = [];
          List<TextEditingController> contents = [];
          data.data?.forEach((element) {
            types.add(TextEditingController(text: element.type ?? ''));
            contents.add(TextEditingController(text: element.content ?? ''));
          });
          state = state.copyWith(
              isSocialLoading: false,
              socialData: data.data,
              socialTypesController: types,
              socialControllers: contents);
        },
        failure: (failure, status) {
          state = state.copyWith(isSocialLoading: false);
          debugPrint('==> get editShopData failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> deleteShopSocials(BuildContext context, int index) async {
    List<SocialData> tempList = List.from(state.socialData ?? []);
    if((state.socialData?.length ?? 0 ) > index) {
      tempList.removeAt(index);
    }
    List<TextEditingController> types = List.from(state.socialTypesController);
    List<TextEditingController> contents = List.from(state.socialControllers);
    types.removeAt(index);
    contents.removeAt(index);
    state = state.copyWith(
        socialData: tempList,
        socialTypesController: types,
        socialControllers: contents);
    await _shopsRepository.addShopSocials(
      socialTypes: AppHelpers.extractTextFromControllers(types),
      socialContents: AppHelpers.extractTextFromControllers(contents),
    );
  }
}
