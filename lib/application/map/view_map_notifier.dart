import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'view_map_state.dart';

class ViewMapNotifier extends StateNotifier<ViewMapState> {
  final UsersFacade _shopsRepository;

  ViewMapNotifier(this._shopsRepository) : super(const ViewMapState());

  void changePlace(AddressData place) {
    state = state.copyWith(place: place, isSetAddress: true);
  }

  void checkAddress() {
    AddressData? data = LocalStorage.getAddressSelected();
    if (data == null) {
      state = state.copyWith(isSetAddress: false);
    } else {
      state = state.copyWith(isSetAddress: true);
    }
  }

  updateActive() {
    state = state.copyWith(isLoading: true);
  }

  Future<void> checkDriverZone(
      {required BuildContext context,
      required LatLng location,
      int? shopId}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, isActive: false);
      final response =
          await _shopsRepository.checkDriverZone(location, shopId: shopId);
      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false, isActive: data);
          if (!data) {
            AppHelpers.errorSnackBar(
              context,
              text: AppHelpers.getTranslation(TrKeys.noDriverZone),
            );
          }
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          if (status != 400) {
            AppHelpers.errorSnackBar(context, text: failure);
          }
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}
