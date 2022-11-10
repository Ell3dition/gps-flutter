import 'package:google_maps_flutter/google_maps_flutter.dart';

class UbicationController {
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();
}
