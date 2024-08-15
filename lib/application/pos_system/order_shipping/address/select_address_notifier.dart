import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:location/location.dart' as location;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'select_address_state.dart';
import 'package:venderuzmart/infrastructure/models/models.dart';

class SelectAddressNotifier extends StateNotifier<SelectAddressState> {
  Timer? _timer;

  SelectAddressNotifier() : super(const SelectAddressState());

  void setLocation(LocationData? location) {
    state = state.copyWith(location: location);
  }

  void setQuery(BuildContext context, String title) {
    if (title.isNotEmpty) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          searchLocations(title);
        },
      );
    }
  }

  Future<void> searchLocations(String title) async {
    state = state.copyWith(isSearching: true, isSearchLoading: true);
    try {
      final result = await Nominatim.searchByName(
        query: title,
        limit: 5,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      state = state.copyWith(searchedPlaces: result, isSearchLoading: false);
    } catch (e) {
      debugPrint('===> search location error $e');
      state = state.copyWith(isSearchLoading: false);
    }
  }

  void clearSearchField() {
    state = state.copyWith(searchedPlaces: [], isSearching: false);
  }

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(mapController: controller);
  }

  void setChoosing(bool value) {
    state = state.copyWith(isChoosing: value, isSearching: false);
  }

  Future<void> goToMyLocation(location.LocationData locationData,
      ValueChanged<String> onSuccess) async {
    state = state.copyWith(searchedPlaces: [], isSearching: false);
    Place? place;
    try {
      place = await Nominatim.reverseSearch(
        lat: locationData.latitude,
        lon: locationData.longitude,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      onSuccess.call(place.displayName);
    } catch (e) {
      debugPrint('===> go to my location error: $e');
      onSuccess.call('');
    }
    if (place != null) {
      state.mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 0,
            target: LatLng(place.lat, place.lon),
            tilt: 0,
            zoom: 17,
          ),
        ),
      );
      state = state.copyWith(
        location: LocationData(latitude: place.lat, longitude: place.lon),
      );
    }
  }

  Future<void> findMyLocation(ValueChanged<String> onSuccess) async {
    location.LocationData? myLocationData;
    final locationInstance = location.Location();
    bool serviceEnabled;
    location.PermissionStatus permissionGranted;
    serviceEnabled = await locationInstance.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationInstance.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await locationInstance.hasPermission();
    if (permissionGranted == location.PermissionStatus.denied) {
      permissionGranted = await locationInstance.requestPermission();
      if (permissionGranted != location.PermissionStatus.granted) {
        return;
      }
    }
    try {
      myLocationData = await locationInstance.getLocation();
    } catch (e) {
      myLocationData = null;
    }
    if (myLocationData != null) {
      goToMyLocation(myLocationData, onSuccess);
    }
  }

  Future<void> saveLocalAddress(
    bool? hasBack, {
    VoidCallback? onBack,
    VoidCallback? onGoMain,
  }) async {
    clearSearchField();
    state.mapController?.dispose();
  }

  Future<void> fetchLocationName(
      LatLng? latLng, ValueChanged<String> onSuccess) async {
    state = state.copyWith(
      location: LocationData(
        latitude: latLng?.latitude,
        longitude: latLng?.longitude,
      ),
    );
    Place? place;
    try {
      place = await Nominatim.reverseSearch(
        lat: latLng?.latitude,
        lon: latLng?.longitude,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      onSuccess.call(place.displayName);
    } catch (e) {
      onSuccess.call('');
    }
  }
}
