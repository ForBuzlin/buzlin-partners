import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'address_state.dart';

class AddressNotifier extends StateNotifier<AddressState> {
  final AddressFacade _addressRepository;

  AddressNotifier(this._addressRepository) : super(const AddressState());
  int page = 0;

  fetchCountry({
    required BuildContext context,
    bool? isRefresh,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      page = 0;
      state = state.copyWith(countries: [], isLoading: true);
    }
    final res = await _addressRepository.getCountry(page: ++page);
    res.when(success: (data) {
      List<CountryData> list = List.from(state.countries);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, countries: list);
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

  searchCountry({
    required BuildContext context,
    String? search,
  }) async {
    final res = await _addressRepository.searchCountry(search: search ?? "");
    res.when(success: (data) {
      state = state.copyWith(countries: data.data ?? []);
    }, failure: (failure, status) {
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  fetchCity(
      {required BuildContext context,
      required int countyId,
      bool? isRefresh,
      RefreshController? controller}) async {
    if (isRefresh ?? false) {
      page = 0;
      state = state.copyWith(cities: [], isCityLoading: true);
    }
    final res =
        await _addressRepository.getCity(page: ++page, countyId: countyId);
    res.when(success: (data) {
      List<CityData> list = List.from(state.cities);
      list.addAll(data.data ?? []);
      state = state.copyWith(isCityLoading: false, cities: list);
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
      state = state.copyWith(isCityLoading: false);
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }

  searchCity({
    required BuildContext context,
    required int countyId,
    String? search,
  }) async {
    final res = await _addressRepository.searchCity(
        search: search ?? "", countyId: countyId);
    res.when(success: (data) {
      state = state.copyWith(cities: data.data ?? []);
    }, failure: (failure, status) {
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }
}
