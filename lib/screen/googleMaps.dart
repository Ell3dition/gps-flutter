import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({super.key, required this.latitud, required this.longitud});

  final double latitud;
  final double longitud;

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    print(widget.latitud);
    print(widget.longitud);
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(widget.latitud, widget.longitud),
        zoom: 15,
      ),
      // markers: _controller.markers,
    );
  }
}
