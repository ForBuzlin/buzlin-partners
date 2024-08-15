import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/presentation/routes/app_router.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';
import 'package:venderuzmart/domain/di/dependency_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderuzmart/presentation/app_assets.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remixicon/remixicon.dart';
import 'package:geolocator/geolocator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ViewMapPage extends ConsumerStatefulWidget {
  final VoidCallback onChanged;

  const ViewMapPage(this.onChanged, {super.key}) ;

  @override
  ConsumerState<ViewMapPage> createState() => _ViewMapPageState();
}

class _ViewMapPageState extends ConsumerState<ViewMapPage> {
  late ViewMapNotifier notifier;
  late TextEditingController controller;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  GoogleMapController? googleMapController;
  CameraPosition? cameraPosition;
  dynamic check;
  late LatLng latLng;

  @override
  void didChangeDependencies() {
    notifier = ref.read(viewMapProvider.notifier);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  checkPermission() async {
    check = await _geolocatorPlatform.checkPermission();
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

  @override
  void initState() {
    controller = TextEditingController();
    latLng = LatLng(
      LocalStorage.getShop()?.latLong?.latitude ??
          AppHelpers.getInitialLatitude(),
      LocalStorage.getShop()?.latLong?.longitude ??
          AppHelpers.getInitialLongitude(),
    );
    checkPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(viewMapProvider);

    return KeyboardDisable(
      child: Scaffold(
        backgroundColor: Style.mainBack,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SlidingUpPanel(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppConstants.radius.r),
                  topRight: Radius.circular(AppConstants.radius.r),
                ),
                minHeight: 240.h,
                maxHeight: 300.h,
                color: Style.white,
                body: Padding(
                  padding: REdgeInsets.only(bottom: 0),
                  child: Stack(
                    children: [_map(context), _marker(context), _myLocation()],
                  ),
                ),
                padding: REdgeInsets.symmetric(horizontal: 15),
                panel: _bottomSheet(context, state),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _marker(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.paddingOf(context).bottom +
          85.h +
          MediaQuery.sizeOf(context).height / 2,
      left: MediaQuery.sizeOf(context).width / 2 - 23.w,
      child: Image.asset(
        Assets.imageMarker,
        width: 46.w,
        height: 46.h,
      ),
    );
  }

  Widget _myLocation() {
    return Positioned(
      bottom: 260.h,
      right: 16.w,
      child: InkWell(
        onTap: () async {
          await getMyLocation();
        },
        child: Container(
          width: 50.r,
          height: 50.r,
          decoration: BoxDecoration(
              color: Style.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [
                BoxShadow(
                    color: Style.shimmerBase,
                    blurRadius: 2,
                    offset: Offset(0, 2))
              ]),
          child: const Center(child: Icon(Remix.navigation_line)),
        ),
      ),
    );
  }

  Widget _map(BuildContext context) {
    return GoogleMap(
      padding: REdgeInsets.only(bottom: 240.h),
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        bearing: 0,
        target: latLng,
        tilt: 0,
        zoom: 17,
      ),
      mapToolbarEnabled: false,
      zoomControlsEnabled: true,
      onTap: (position) {
        notifier.updateActive();
        Delayed(milliseconds: 700).run(() async {
          try {
            final List<Placemark> placemarks = await placemarkFromCoordinates(
              cameraPosition?.target.latitude ?? latLng.latitude,
              cameraPosition?.target.longitude ?? latLng.longitude,
            );

            if (placemarks.isNotEmpty) {
              final Placemark pos = placemarks[0];
              final List<String> addressData = [];
              addressData.add(pos.locality!);
              if (pos.subLocality != null && pos.subLocality!.isNotEmpty) {
                addressData.add(pos.subLocality!);
              }
              if (pos.thoroughfare != null && pos.thoroughfare!.isNotEmpty) {
                addressData.add(pos.thoroughfare!);
              }
              addressData.add(pos.name!);
              final String placeName = addressData.join(', ');
              controller.text = placeName;
            }
          } catch (e) {
            controller.text = '';
          }
          notifier.changePlace(
            AddressData(
              title: controller.text,
              address: controller.text,
              location: LocationData(
                latitude: cameraPosition?.target.latitude ?? latLng.latitude,
                longitude: cameraPosition?.target.longitude ?? latLng.longitude,
              ),
            ),
          );
        });
        googleMapController!
            .animateCamera(CameraUpdate.newLatLngZoom(position, 15));
      },
      onCameraIdle: () {
        notifier.updateActive();
        Delayed(milliseconds: 700).run(() async {
          try {
            final List<Placemark> placemarks = await placemarkFromCoordinates(
              cameraPosition?.target.latitude ?? latLng.latitude,
              cameraPosition?.target.longitude ?? latLng.longitude,
            );

            if (placemarks.isNotEmpty) {
              final Placemark pos = placemarks[0];
              final List<String> addressData = [];
              addressData.add(pos.locality!);
              if (pos.subLocality != null && pos.subLocality!.isNotEmpty) {
                addressData.add(pos.subLocality!);
              }
              if (pos.thoroughfare != null && pos.thoroughfare!.isNotEmpty) {
                addressData.add(pos.thoroughfare!);
              }
              addressData.add(pos.name!);
              final String placeName = addressData.join(', ');
              controller.text = placeName;
            }
          } catch (e) {
            controller.text = '';
          }

          notifier.changePlace(
            AddressData(
              title: controller.text,
              address: controller.text,
              location: LocationData(
                latitude: cameraPosition?.target.latitude ?? latLng.latitude,
                longitude: cameraPosition?.target.longitude ?? latLng.longitude,
              ),
            ),
          );
        });
      },
      onCameraMove: (position) {
        cameraPosition = position;
      },
      onMapCreated: (controller) {
        googleMapController = controller;
      },
    );
  }

  Widget _bottomSheet(BuildContext context, ViewMapState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        8.verticalSpace,
        Container(
          width: 49.w,
          height: 3.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: Style.dragElement,
          ),
        ),
        16.verticalSpace,
        TitleAndIcon(
            title: AppHelpers.getTranslation(TrKeys.enterADeliveryAddress)),
        24.verticalSpace,
        SearchTextField(
          isRead: true,
          isBorder: true,
          textEditingController: controller,
          onTap: () async {
            final placeId = await context.pushRoute(const MapSearchRoute());
            if (placeId != null) {
              final res = await googlePlace.details.get(placeId.toString());
              try {
                final List<Placemark> placemarks =
                    await placemarkFromCoordinates(
                  res?.result?.geometry?.location?.lat ?? latLng.latitude,
                  res?.result?.geometry?.location?.lng ?? latLng.longitude,
                );

                if (placemarks.isNotEmpty) {
                  final Placemark pos = placemarks[0];
                  final List<String> addressData = [];
                  addressData.add(pos.locality!);
                  if (pos.subLocality != null && pos.subLocality!.isNotEmpty) {
                    addressData.add(pos.subLocality!);
                  }
                  if (pos.thoroughfare != null &&
                      pos.thoroughfare!.isNotEmpty) {
                    addressData.add(pos.thoroughfare!);
                  }
                  addressData.add(pos.name!);
                  final String placeName = addressData.join(', ');
                  controller.text = placeName;
                }
              } catch (e) {
                controller.text = '';
              }

              googleMapController!.animateCamera(CameraUpdate.newLatLngZoom(
                  LatLng(
                      res?.result?.geometry?.location?.lat ?? latLng.latitude,
                      res?.result?.geometry?.location?.lng ?? latLng.longitude),
                  15));
              notifier.changePlace(
                AddressData(
                  title: controller.text,
                  address: controller.text,
                  location: LocationData(
                    latitude:
                        res?.result?.geometry?.location?.lat ?? latLng.latitude,
                    longitude: res?.result?.geometry?.location?.lng ??
                        latLng.longitude,
                  ),
                ),
              );
            }
          },
        ),
        24.verticalSpace,
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BlackPopButton(),
              8.horizontalSpace,
              Expanded(
                child: Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final event = ref.watch(shopProvider.notifier);
                    return CustomButton(
                      isLoading: false,
                      background: Style.primary,
                      title: TrKeys.apply,
                      onPressed: () {
                        if (cameraPosition != null &&
                            cameraPosition?.target != null) {
                          event.setLocation(cameraPosition!.target.latitude,
                              cameraPosition!.target.longitude);
                        }
                        Navigator.pop(context, state.place);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
