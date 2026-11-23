import 'package:google_maps_flutter/google_maps_flutter.dart';

enum MapStatus {
  initial,
  loading,
  success,
  error,
}

class MapState {
  final MapStatus status;
  final String locationMessage;
  final CameraPosition cameraPosition;
  final LatLng? currentLocation;

  const MapState({
    this.status = MapStatus.initial,
    this.locationMessage = '',
    this.cameraPosition = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    ),
    this.currentLocation,
  });

  MapState copyWith({
    MapStatus? status,
    String? locationMessage,
    CameraPosition? cameraPosition,
    LatLng? currentLocation,
  }) {
    return MapState(
      status: status ?? this.status,
      locationMessage: locationMessage ?? this.locationMessage,
      cameraPosition: cameraPosition ?? this.cameraPosition,
      currentLocation: currentLocation ?? this.currentLocation,
    );
  }
}
