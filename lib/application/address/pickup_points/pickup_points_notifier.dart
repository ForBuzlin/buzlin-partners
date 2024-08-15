import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/domain/interface/interfaces.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/infrastructure/services/marker_image_cropper.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

import 'pickup_points_state.dart';

class PickupPointsNotifier extends StateNotifier<PickupPointsState> {
  final AddressFacade _addressRepository;

  PickupPointsNotifier(this._addressRepository)
      : super(const PickupPointsState());
  int page = 0;

  changePickup(int index) {
    state = state.copyWith(pickupIndex: index);
  }

  fetchPoints(
      {required BuildContext context,
      required int? countyId,
      required int? regionId,
      bool? isRefresh,
      RefreshController? controller,
      OrderCartNotifier? orderCartNotifier}) async {
    if (isRefresh ?? false) {
      page = 0;
      state = state.copyWith(deliveryPoints: [], isLoading: true);
    }
    final res = await _addressRepository.getDeliveryPoints(
        page: ++page, countryId: countyId ?? 0, cityId: regionId);
    res.when(success: (data) async {
      final ImageCropperForMarker image = ImageCropperForMarker();
      Set<Marker> list = {};
      final icon = await image.resizeAndCircle(null, 120);
      for (int i = 0; i < (data.data?.length ?? 0); i++) {
        list.add(
          Marker(
            markerId: MarkerId(i.toString()),
            position: LatLng(
              data.data?[i].location?.latitude ?? AppConstants.demoLatitude,
              data.data?[i].location?.longitude ?? AppConstants.demoLongitude,
            ),
            icon: icon,
          ),
        );
      }
      state = state.copyWith(markers: list);
      List<DeliveryPointsData> points = List.from(state.deliveryPoints);
      points.addAll(data.data ?? []);
      state = state.copyWith(isLoading: false, deliveryPoints: points);
      orderCartNotifier?.setPointAddress(data.data?.first);
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

  DeliveryPointsData checkPoint(LatLng latLng) {
    for (int i = 0; i < state.deliveryPoints.length; i++) {
      if (state.deliveryPoints[i].location?.latitude == latLng.latitude &&
          state.deliveryPoints[i].location?.longitude == latLng.longitude) {
        return state.deliveryPoints[i];
      }
    }
    return DeliveryPointsData();
  }
}
