import 'dart:convert';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:domi_lab_assignment/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart'; // For reverse geocoding
import 'package:http/http.dart' as http;

import 'invite_box_controller.dart';

class MapController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await handleLocationPermission();
    await getCurrentLocation();
  }

  late GoogleMapController mapController;
  Rx<LatLng> currentPosition = const LatLng(26.521563, 75.677433).obs;
  RxString image = RxString("");
  Rx<BitmapDescriptor> mapIcon = Rx(BitmapDescriptor.defaultMarker);
  Rx<BitmapDescriptor> mapCurrentIcon = Rx(BitmapDescriptor.defaultMarker);
  Rx<LatLng> iconPosition = const LatLng(0.0, 0.0).obs;
  RxString currentAddress = RxString('Tap on a location');
  RxDouble currentLat = RxDouble(0);
  RxDouble currentLong = RxDouble(0);
  InviteBox boxVisibility = Get.put(InviteBox());

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 18)));
    currentLat.value = position.latitude;
    currentLong.value = position.longitude;
    setMarker2(await getStreetView(position.latitude, position.longitude));
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Location services are disabled. Please enable the services",
          "Please enable location to use the app");

      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar(
            "Location services are disabled. Please enable the services",
            "Please enable location to use the app");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Location services are disabled. Please enable the services",
          "Please enable location to use the app");
      return false;
    }
    return true;
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    rootBundle.loadString('assets/json_assets.json').then((string) {
      controller.setMapStyle(string);
    });
  }

  void onCameraMove(CameraPosition position) {
    currentPosition.value = position.target;
    print(currentPosition);
  }

  Future<void> setMarker2(String url) async {
    // Fetch the network image
    // Fetch the network image
    const double size = 150.0; // Marker size
    const double tipHeight = 30.0; // Height of the tip

    // Create a picture recorder and canvas
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final ui.Canvas canvas = ui.Canvas(pictureRecorder);

    // Draw the circular background
    final paint = Paint()
      ..color = Colors.black // Set background color to white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(size / 2, size / 2), size / 2, paint);

    // Draw the circular border
    final borderPaint = Paint()
      ..color = Colors.black // Set border color to grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0; // Border thickness
    canvas.drawCircle(const Offset(size / 2, size / 2), size / 2, borderPaint);

    // Draw the pointer shape
    final pointerPath = Path();
    pointerPath.moveTo(size / 2, size); // Start at the bottom center of the circle
    pointerPath.lineTo(size / 2 + 5, size + 10); // Small right tip, extending outside the circle
    pointerPath.lineTo(size / 2 - 5, size + 10); // Small left tip, extending outside the circle
    pointerPath.close();
    canvas.drawPath(pointerPath, paint);
    // Fetch the network image
    final response = await http.get(Uri.parse(url));
    final Uint8List imageBytes = response.bodyBytes;

    // Decode the image
    final ui.Codec codec = await ui.instantiateImageCodec(imageBytes);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ui.Image image = frameInfo.image;

    // Calculate image size and position to fit within the marker
    const double imageSize =
        size - 20; // Adjust image size to fit within the marker
    const double imageOffset = (size - imageSize) / 2;

    // Create a circular clipping path for the image
    final circlePath = Path()
      ..addOval(Rect.fromCircle(
          center: const Offset(size / 2, size / 2), radius: size / 2 - 10));

    // Clip to the circular path
    canvas.clipPath(circlePath);

    // Draw the image within the clipped area
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      const Rect.fromLTWH(
        imageOffset,
        imageOffset,
        imageSize,
        imageSize,
      ),
      Paint(),
    );

    // Convert the canvas to an image
    final ui.Image finalImage = await pictureRecorder.endRecording().toImage(
          size.toInt(),
          (size + tipHeight).toInt(), // Height accommodates the tip
        );

    final ByteData? byteData =
        await finalImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Create BitmapDescriptor from bytes
    final BitmapDescriptor bitmapDescriptor =
        BitmapDescriptor.fromBytes(pngBytes);

    // Set the marker icon
    mapCurrentIcon.value = bitmapDescriptor;
  }

  Future<void> setMarker(String url) async {
    // Fetch the network image
    // Fetch the network image
    const double size = 150.0; // Marker size
    const double tipHeight = 30.0; // Height of the tip

    // Create a picture recorder and canvas
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final ui.Canvas canvas = ui.Canvas(pictureRecorder);

    // Draw the circular background
    final paint = Paint()
      ..color = Colors.black // Set background color to white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(size / 2, size / 2), size / 2, paint);

    // Draw the circular border
    final borderPaint = Paint()
      ..color = Colors.black // Set border color to grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0; // Border thickness
    canvas.drawCircle(const Offset(size / 2, size / 2), size / 2, borderPaint);


    // Draw the pointer shape
    final pointerPath = Path();
    pointerPath.moveTo(size / 2, size); // Start at the bottom center of the circle
    pointerPath.lineTo(size / 2 + 5, size + 10); // Small right tip, extending outside the circle
    pointerPath.lineTo(size / 2 - 5, size + 10); // Small left tip, extending outside the circle
    pointerPath.close();
    canvas.drawPath(pointerPath, paint);
    // Fetch the network image
    final response = await http.get(Uri.parse(url));
    final Uint8List imageBytes = response.bodyBytes;

    // Decode the image
    final ui.Codec codec = await ui.instantiateImageCodec(imageBytes);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ui.Image image = frameInfo.image;

    // Calculate image size and position to fit within the marker
    const double imageSize =
        size - 20; // Adjust image size to fit within the marker
    const double imageOffset = (size - imageSize) / 2;

    // Create a circular clipping path for the image
    final circlePath = Path()
      ..addOval(Rect.fromCircle(
          center: const Offset(size / 2, size / 2), radius: size / 2 - 10));

    // Clip to the circular path
    canvas.clipPath(circlePath);

    // Draw the image within the clipped area
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      const Rect.fromLTWH(
        imageOffset,
        imageOffset,
        imageSize,
        imageSize,
      ),
      Paint(),
    );

    // Convert the canvas to an image
    final ui.Image finalImage = await pictureRecorder.endRecording().toImage(
          size.toInt(),
          (size + tipHeight).toInt(), // Height accommodates the tip
        );

    final ByteData? byteData =
        await finalImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Create BitmapDescriptor from bytes
    final BitmapDescriptor bitmapDescriptor =
        BitmapDescriptor.fromBytes(pngBytes);

    // Set the marker icon
    mapIcon.value = bitmapDescriptor;
  }

  Future<void> onMapTapped(LatLng position) async {
    boxVisibility.isVisible.value = true;
    boxVisibility.onTap.value = false;

    iconPosition.value = position;
    currentPosition.value = position;
    getAddressFromLatLng(position);
    await setMarker(await getStreetView(position.latitude, position.longitude));

  }

  Future<void> getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        currentAddress.value = '${place.name}';
      } else {
        currentAddress.value = 'No address found.';
      }
    } catch (e) {
      print(e);
      currentAddress.value = 'Error.';
    }
  }

  Future<String> getStreetView(latitude, longitude) async {
    print("function called");
    try {
      String metaDataUrl =
          'https://maps.googleapis.com/maps/api/streetview/metadata?location=$latitude,$longitude&key=$api_key';

      final response = await http.get(Uri.parse(metaDataUrl));

      var jsonResponse = jsonDecode(response.body);

      var panoId = jsonResponse['pano_id']; // Return the pano ID
      String streetViewUrl =
          'https://maps.googleapis.com/maps/api/streetview?size=400x400&pano=$panoId&key=$api_key';
      print(streetViewUrl);
      image.value = streetViewUrl;
      return streetViewUrl;
      print("image ::${image.value}");
    } catch (e) {
      print("street view error :: $e");
      return "";
    }
  }
}
