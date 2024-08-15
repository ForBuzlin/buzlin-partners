import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:venderuzmart/presentation/styles/style.dart';
import 'package:venderuzmart/presentation/component/components.dart';
import 'package:venderuzmart/application/providers.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';

@RoutePage()
class DeliveryZonePage extends ConsumerStatefulWidget {
  const DeliveryZonePage({super.key}) ;

  @override
  ConsumerState<DeliveryZonePage> createState() => _DeliveryZonePageState();
}

class _DeliveryZonePageState extends ConsumerState<DeliveryZonePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(deliveryZoneProvider.notifier).fetchDeliveryZone(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LocalStorage.getLangLtr(),
      child: Scaffold(
        backgroundColor: Style.greyColor,
        resizeToAvoidBottomInset: false,
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(deliveryZoneProvider);
            final event = ref.read(deliveryZoneProvider.notifier);
            return Stack(
              children: [
                state.isLoading
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Style.white,
                      )
                    : GoogleMap(
                        tiltGesturesEnabled: false,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        polygons: state.polygon,
                        onTap: event.addTappedPoint,
                        initialCameraPosition: CameraPosition(
                          bearing: 0,
                          target: LatLng(
                            state.polygon.isNotEmpty
                                ? state.polygon.first.points.first.latitude
                                : AppHelpers.getInitialLatitude(),
                            state.polygon.isNotEmpty
                                ? state.polygon.first.points.first.longitude
                                : AppHelpers.getInitialLongitude(),
                          ),
                          tilt: 0,
                          zoom: 11,
                        ),
                      ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 150),
                  bottom: 20.r,
                  left: 15.r,
                  right: 15.r,
                  child: Row(
                    children: [
                      const PopButton(),
                      8.horizontalSpace,
                      if (state.tappedPoints.length > 3)
                        Expanded(
                          child: CustomButton(
                            title: AppHelpers.getTranslation(TrKeys.save),
                            isLoading: state.isSaving,
                            onPressed: () => event.updateDeliveryZone(
                              updateSuccess: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
