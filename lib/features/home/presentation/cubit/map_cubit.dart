import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const MapState());

  final Location _location = Location();

  GoogleMapController? _mapController;

  bool _isRequestingPermission = false;
  StreamSubscription<LocationData>? _locationSubscription;

  Future<void> getLocation() async {
    try {
      // 1. Check Location Permission
      final permissionGranted = await _getLocationPermission();

      if (!permissionGranted) {
        emit(
          state.copyWith(
            status: MapStatus.error,
            locationMessage: 'Location Permission Denied',
          ),
        );
        return;
      }

      // 2. Check Location Service
      final serviceEnabled = await _locationServiceEnabled();

      if (!serviceEnabled) {
        emit(
          state.copyWith(
            status: MapStatus.error,
            locationMessage: 'Location Service Denied',
          ),
        );
        return;
      }

      // 3. Start Loading
      emit(
        state.copyWith(
          status: MapStatus.loading,
          locationMessage: 'Fetching Data',
        ),
      );

      // 4. Get Current Location
      final LocationData locationData = await _location.getLocation();

      final latitude = locationData.latitude;
      final longitude = locationData.longitude;


      // 5. Create New Camera Position
      final newCameraPosition = CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 14.4746,
      );

      // 6. Update State
      emit(
        state.copyWith(
          status: MapStatus.success,
          locationMessage: 'You are in $latitude, $longitude',
          cameraPosition: newCameraPosition,
          currentLocation: LatLng(latitude!, longitude!),
        ),
      );

      await _locationSubscription?.cancel();
      _locationSubscription = _location.onLocationChanged.listen((update) {
        final updatedLatitude = update.latitude;
        final updatedLongitude = update.longitude;
        if (updatedLatitude == null || updatedLongitude == null) return;

        emit(
          state.copyWith(
            currentLocation: LatLng(updatedLatitude, updatedLongitude),
          ),
        );
      });

      // 7. Move Camera
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(newCameraPosition),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MapStatus.error,
          locationMessage: 'Error getting location: $e',
        ),
      );
    }
  }

  Future<bool> _getLocationPermission() async {
    if (_isRequestingPermission) {
      while (_isRequestingPermission) {
        await Future.delayed(
          const Duration(milliseconds: 100),
        );
      }

      final status = await _location.hasPermission();

      return status == PermissionStatus.granted ||
          status == PermissionStatus.grantedLimited;
    }

    _isRequestingPermission = true;

    try {
      var permissionStatus = await _location.hasPermission();

      if (permissionStatus == PermissionStatus.denied) {
        permissionStatus = await _location.requestPermission();
      }

      return permissionStatus == PermissionStatus.granted ||
          permissionStatus == PermissionStatus.grantedLimited;
    } finally {
      _isRequestingPermission = false;
    }
  }

  Future<bool> _locationServiceEnabled() async {
    bool serviceEnabled = await _location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
    }

    return serviceEnabled;
  }

  // Called when Google Map is created
  void setMapController(GoogleMapController controller) {
    _mapController = controller;

    // Move camera if location was already fetched
    if (state.status == MapStatus.success) {
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(state.cameraPosition),
      );
    }
  }

  @override
  Future<void> close() async {
    await _locationSubscription?.cancel();
    _mapController?.dispose();
    return super.close();
  }
}
