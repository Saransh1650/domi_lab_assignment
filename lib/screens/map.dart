import 'package:domi_lab_assignment/ViewModel/invite_box_controller.dart';
import 'package:domi_lab_assignment/ViewModel/map_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MapController controller = Get.put(MapController());
    InviteBox boxVisibility = Get.put(InviteBox());
    return Obx(() {
      return SizedBox(
        child: GoogleMap(
          buildingsEnabled: true,
          fortyFiveDegreeImageryEnabled: true,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          markers: <Marker>{
            Marker(
              icon: controller.mapCurrentIcon.value,
              markerId: const MarkerId('marker_2'),
              position: LatLng(
                  controller.currentLat.value, controller.currentLong.value),
            ),
            Marker(
              onTap: () {
                controller.iconPosition.value = const LatLng(0, 0);
                boxVisibility.isVisible.value = false;
                controller.currentAddress.value = "Tap on a location";
                controller.image.value = "";
              },
              icon: controller.mapIcon.value,
              markerId: const MarkerId('marker_1'),
              position: LatLng(controller.iconPosition.value.latitude,
                  controller.iconPosition.value.longitude),
            ),
          },
          myLocationEnabled: true,
          onTap: controller.onMapTapped,
          onCameraMove: controller.onCameraMove,
          scrollGesturesEnabled: true,
          padding: const EdgeInsets.all(10),
          mapType: MapType.normal,
          onMapCreated: controller.onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(
                controller.currentLat.value, controller.currentLong.value),
            zoom: 18.0,
          ),
        ),
      );
    });
  }
}
