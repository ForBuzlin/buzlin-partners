import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'pickup_modal.dart';

@RoutePage()
class PickupMapPage extends ConsumerStatefulWidget {
  final int countryId;
  final int? regionId;

  const PickupMapPage({
    super.key,
    required this.countryId,
    required this.regionId,
  });

  @override
  ConsumerState<PickupMapPage> createState() => _PickupMapPageState();
}

class _PickupMapPageState extends ConsumerState<PickupMapPage> {
  dynamic check;
  late LatLng latLng;
  GoogleMapController? googleMapController;

  LatLngBounds _bounds(Set<Marker> markers) {
    if (markers.isEmpty) {
      return LatLngBounds(
          southwest: const LatLng(0, 0), northeast: const LatLng(0, 0));
    }
    return _createBounds(markers.map((m) => m.position).toList());
  }

  LatLngBounds _createBounds(List<LatLng> positions) {
    final southwestLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value < element ? value : element); // smallest
    final southwestLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value < element ? value : element);
    final northeastLat = positions.map((p) => p.latitude).reduce(
        (value, element) => value > element ? value : element); // biggest
    final northeastLon = positions
        .map((p) => p.longitude)
        .reduce((value, element) => value > element ? value : element);
    return LatLngBounds(
        southwest: LatLng(southwestLat, southwestLon),
        northeast: LatLng(northeastLat, northeastLon));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(pickupPointsProvider.notifier).fetchPoints(
            context: context,
            countyId: widget.countryId,
            regionId: widget.regionId,
            isRefresh: true,
          );
    });
    latLng = LatLng(
      LocalStorage.getAddressSelected()?.location?.latitude ??
          AppHelpers.getInitialLatitude(),
      LocalStorage.getAddressSelected()?.location?.longitude ??
          AppHelpers.getInitialLongitude(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pickupPointsProvider);
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        body: state.isLoading
            ? const Center(child: Loading())
            : state.markers.isEmpty
                ? const Center(child: NoItem(title: TrKeys.noPoint))
                : Stack(
                    children: [
                      GoogleMap(
                        padding: REdgeInsets.only(bottom: 16, left: 8),
                        myLocationButtonEnabled: false,
                        zoomGesturesEnabled: false,
                        markers: state.markers
                            .map(
                              (e) => e.copyWith(onTapParam: () {
                                AppHelpers.showCustomModalBottomSheet(
                                  context: context,
                                  modal: PickupModal(
                                    deliveryPoint: state.deliveryPoints[
                                        int.tryParse(e.markerId.value) ?? 0],
                                    onTap: (value) {
                                      ref
                                          .read(orderCartProvider.notifier)
                                          .setPointAddress(value);
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              }),
                            )
                            .toSet(),
                        onMapCreated: (GoogleMapController controller) {
                          googleMapController = controller;
                          googleMapController?.animateCamera(
                            CameraUpdate.newLatLngBounds(
                                _bounds(state.markers), 50),
                          );
                        },
                        initialCameraPosition: CameraPosition(
                          target: state.deliveryPoints.isNotEmpty
                              ? LatLng(
                                  state.deliveryPoints.first.location
                                          ?.latitude ??
                                      0,
                                  state.deliveryPoints.first.location
                                          ?.longitude ??
                                      0,
                                )
                              : const LatLng(AppConstants.demoLatitude,
                                  AppConstants.demoLongitude),
                          zoom: 10,
                        ),
                        mapToolbarEnabled: false,
                        zoomControlsEnabled: false,
                      ),
                      Positioned(
                        bottom: 20.r,
                        right: 20.r,
                        child: MapButtons(
                          zoomIn: () {
                            googleMapController
                                ?.animateCamera(CameraUpdate.zoomIn());
                          },
                          zoomOut: () {
                            googleMapController
                                ?.animateCamera(CameraUpdate.zoomOut());
                          },
                          navigate: () {
                            getMyLocation();
                          },
                        ),
                      ),
                      const Positioned(
                        bottom: 24,
                        left: 24,
                        child: BlackPopButton(),
                      )
                    ],
                  ),
      ),
    );
  }

  Future<void> getMyLocation() async {
    if (check == LocationPermission.denied ||
        check == LocationPermission.deniedForever) {
      check = await Geolocator.requestPermission();
      if (check != LocationPermission.denied &&
          check != LocationPermission.deniedForever) {
        var loc = await Geolocator.getCurrentPosition();
        latLng = LatLng(loc.latitude, loc.longitude);
        googleMapController!
            .animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
      }
    } else {
      if (check != LocationPermission.deniedForever) {
        var loc = await Geolocator.getCurrentPosition();
        latLng = LatLng(loc.latitude, loc.longitude);
        googleMapController!
            .animateCamera(CameraUpdate.newLatLngZoom(latLng, 15));
      }
    }
  }
}
