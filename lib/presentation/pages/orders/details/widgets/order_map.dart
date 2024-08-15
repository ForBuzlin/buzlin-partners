import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venderuzmart/infrastructure/services/services.dart';
import 'order_map_buttons.dart';

class OrderMap extends StatefulWidget {
  final Set<Marker> markers;
  final LatLng latLng;
  final double height;

  const OrderMap({
    super.key,
    required this.markers,
    required this.latLng,
    this.height = 260,
  });

  @override
  State<OrderMap> createState() => _OrderMapState();
}

class _OrderMapState extends State<OrderMap> {
  GoogleMapController? googleMapController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.radius),
      child: SizedBox(
        height: widget.height.h,
        child: Stack(
          children: [
            GoogleMap(
              myLocationButtonEnabled: false,
              markers: widget.markers,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: widget.latLng,
                zoom: 14,
              ),
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
            ),
            Positioned(
              bottom: 12.r,
              right: 12.r,
              child: OrderMapButtons(
                zoomIn: () {
                  googleMapController?.animateCamera(CameraUpdate.zoomIn());
                },
                zoomOut: () {
                  googleMapController?.animateCamera(CameraUpdate.zoomOut());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
