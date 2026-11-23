import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/features/home/presentation/cubit/map_cubit.dart';
import 'package:mkanak/features/home/presentation/cubit/map_state.dart';

const _mapStyle = '''[
  {"elementType":"geometry","stylers":[{"color":"#f2f2ff"}]},
  {"elementType":"labels.text.fill","stylers":[{"color":"#657078"}]},
  {"elementType":"labels.text.stroke","stylers":[{"color":"#f2f2ff"}]},
  {"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#dce2fa"}]},
  {"featureType":"landscape.man_made","elementType":"geometry","stylers":[{"color":"#f0f1ff"}]},
  {"featureType":"poi","elementType":"geometry","stylers":[{"color":"#e7eaff"}]},
  {"featureType":"poi","elementType":"labels.icon","stylers":[{"visibility":"off"}]},
  {"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e6f3ed"}]},
  {"featureType":"road","elementType":"geometry","stylers":[{"color":"#ffffff"}]},
  {"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#e8eaff"}]},
  {"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#ffffff"}]},
  {"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#ffffff"}]},
  {"featureType":"transit","stylers":[{"visibility":"off"}]},
  {"featureType":"water","elementType":"geometry","stylers":[{"color":"#d6e0ff"}]}
]''';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  BitmapDescriptor? _locationIcon;

  @override
  void initState() {
    super.initState();
    _loadLocationIcon();
  }

  Future<void> _loadLocationIcon() async {
    const size = 96.0;
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    const center = Offset(size / 2, size / 2);

    canvas.drawCircle(
      center,
      42,
      Paint()..color = AppColors.primary.withValues(alpha: 0.14),
    );
    canvas.drawCircle(
      center,
      25,
      Paint()..color = AppColors.primary.withValues(alpha: 0.22),
    );
    canvas.drawCircle(
      center,
      17,
      Paint()..color = AppColors.white,
    );
    canvas.drawCircle(
      center,
      13,
      Paint()..color = AppColors.primary,
    );

    final picture = recorder.endRecording();
    final image = await picture.toImage(size.toInt(), size.toInt());
    final data = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    picture.dispose();
    if (data == null || !mounted) return;

    setState(() {
      _locationIcon = BitmapDescriptor.bytes(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        imagePixelRatio: 3,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                style: _mapStyle,
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                initialCameraPosition: state.cameraPosition,
                markers: state.currentLocation == null || _locationIcon == null
                    ? const <Marker>{}
                    : {
                        Marker(
                          markerId: const MarkerId('my-location'),
                          position: state.currentLocation!,
                          icon: _locationIcon!,
                          anchor: const Offset(0.5, 0.5),
                        ),
                      },
                onMapCreated: (controller) {
                  context.read<MapCubit>().setMapController(controller);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
