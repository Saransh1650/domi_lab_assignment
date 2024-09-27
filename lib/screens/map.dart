import 'package:domi_lab_assignment/ViewModel/map_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MapController controller = Get.put(MapController());

    return Obx(() {
      return SizedBox(

        child: GoogleMap(
          markers: <Marker>{
            Marker(
              onTap: (){
               controller.iconPosition.value=const LatLng(0, 0);
              },
              icon: controller.mapIcon.value,
              markerId: const MarkerId('marker_1'),
              position: LatLng(controller.iconPosition.value.latitude,
                  controller.iconPosition.value.longitude),
            ),
          },
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          onTap: controller.onMapTapped,
          onCameraMove: controller.onCameraMove,
          scrollGesturesEnabled: true,
          padding: const EdgeInsets.all(10),
          mapType: MapType.normal,
          onMapCreated: controller.onMapCreated,
          initialCameraPosition: CameraPosition(
            target: controller.currentPosition.value,
            zoom: 10.0,
          ),
        ),
      );
    });
  }
}
