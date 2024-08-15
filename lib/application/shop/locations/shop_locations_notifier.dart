import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'shop_locations_state.dart';

class ShopLocationsNotifier extends StateNotifier<ShopLocationsState> {
  final ShopsFacade _shopsRepository;

  ShopLocationsNotifier(this._shopsRepository)
      : super(const ShopLocationsState());
  int page = 0;

  void setCountryId(int? value) {
    state = state.copyWith(countryId: value);
  }

  void setCityId(int? value) {
    state = state.copyWith(cityId: value);
  }

  void setRegionId(int? value) {
    state = state.copyWith(regionId: value);
  }

  Future<void> addShopLocations(
    BuildContext context, {
    VoidCallback? updateSuccess,
    required int type,
  }) async {
    if (state.regionId == null || state.countryId == null) {
      return;
    }
    bool? cityExist = state.locations
        .any((element) => element.city?.id == (state.cityId ?? 0));
    if (cityExist) return;

    bool? countryExists = state.locations
        .any((element) => element.country?.id == state.countryId!);

    if (countryExists) {
      List<ShopLocationData>? temp = state.locations
          .where((element) => element.countryId == state.countryId)
          .toList();
      for (int i = 0; i < temp.length; i++) {
        if (temp[i].cityId == null && state.cityId == null) {
          return;
        }
      }
    }

    state = state.copyWith(isLoading: true);
    final response = await _shopsRepository.updateShopLocations(
      regionId: state.regionId!,
      countryId: state.countryId!,
      cityId: state.cityId,
      type: type,
    );
    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          countryId: null,
          cityId: null,
          regionId: null,
        );
        updateSuccess?.call();
      },
      failure: (failure, status) {
        debugPrint('===> add locations fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  Future<void> deleteShopLocation(BuildContext context, int id,
      {VoidCallback? updateSuccess}) async {
    state = state.copyWith(isLoading: true);
    final response = await _shopsRepository.deleteShopLocation(
      countryId: id,
    );
    response.when(
      success: (data) {
        final temp = state.locations.toList();
        temp.removeWhere((element) => element.id == id);
        state = state.copyWith(
          isLoading: false,
          locations: temp
        );
        updateSuccess?.call();
      },
      failure: (failure, status) {
        debugPrint('===> delete locations fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.errorSnackBar(context, text: failure);
      },
    );
  }

  fetchLocations(
      {required BuildContext context,
      bool? isRefresh,
      RefreshController? controller,
      required int type}) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      page = 0;
      state = state.copyWith(locations: [], isLoading: true);
    }
    final res =
        await _shopsRepository.getShopLocations(page: ++page, type: type);

    res.when(success: (data) {
      List<ShopLocationData> list = List.from(state.locations);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, locations: list);
      if (isRefresh ?? false) {
        controller?.refreshCompleted();
        return;
      } else if (data.data?.isEmpty ?? true) {
        controller?.loadNoData();
        return;
      }
      controller?.loadComplete();
      return;
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }
}
