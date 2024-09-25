import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
   MapScreen({super.key});
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(26.521563, 75.677433);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: GoogleMap(
        scrollGesturesEnabled: true,
      padding: EdgeInsets.all(10),
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 10.0,
      ),
    ),
    );
  }
}
