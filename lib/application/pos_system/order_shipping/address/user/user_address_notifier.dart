import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/data/my_address.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'user_address_state.dart';

class UserAddressNotifier extends StateNotifier<UserAddressState> {
  final AddressFacade _addressRepository;

  UserAddressNotifier(this._addressRepository)
      : super(const UserAddressState());
  int _page = 0;

  fetchUserUserAddress({
    BuildContext? context,
    bool? isRefresh,
    int? userId,
    int? cityId,
    int? regionId,
    int? countryId,
    RefreshController? controller,
  }) async {
    if (isRefresh ?? false) {
      controller?.resetNoData();
      _page = 0;
      state = state.copyWith(list: [], isLoading: true);
    }
    final res = await _addressRepository.getUserAddress(
      page: ++_page,
      userId: userId,
      cityId: cityId,
      regionId: regionId,
      countryId: countryId,
    );
    res.when(success: (data) {
      List<MyAddress> list = List.from(state.list);
      list.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, list: list);
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
      debugPrint(" ==> fetch user address fail: $failure");
      if (context != null) {
        AppHelpers.errorSnackBar(context, text: failure);
      }
    });
  }

  setDeliveryAddress({
    required BuildContext context,
    required int? userId,
    required MyAddress address,
    required ValueChanged<MyAddress> onSuccess,
  }) async {
    state = state.copyWith(isLoading: true);
    final res = await _addressRepository.addUserAddress(
      userId: userId,
      address: address,
    );
    res.when(success: (data) {
      state = state.copyWith(isLoading: false);
      onSuccess.call(data);
    }, failure: (failure, status) {
      state = state.copyWith(isLoading: false);
      debugPrint(" ==> set user address fail: $failure");
      AppHelpers.errorSnackBar(context, text: failure);
    });
  }
}
