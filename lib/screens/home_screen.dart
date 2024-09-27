import 'package:domi_lab_assignment/ViewModel/map_controller.dart';
import 'package:domi_lab_assignment/screens/detail_screen.dart';
import 'package:domi_lab_assignment/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MapController controller = Get.put(MapController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Center(
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                color: Colors.black),
            child: Center(child: Obx(() {
              return Row(
                children: [
                  Container(
                    margin:const EdgeInsets.all(5),
                    height: 40,
                      width: 40,
                      child: controller.image.value == "" ? Image.asset("assets/pin.png") : ClipRRect(borderRadius: BorderRadius.circular(50),child: Image.network(controller.image.value, fit: BoxFit.fill,))),
                  const Spacer(flex: 1,),
                  Container(
                    margin:const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    width: 120,
                    child: FittedBox(


                      fit: BoxFit.scaleDown,
                      child: Text(controller.currentAddress.value, style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),

                      ),
                    ),
                  ),
                  const Spacer(flex: 2,)
                ],
              );
            })),
          ),
        ),
        backgroundColor: Colors.transparent,
        leadingWidth: 65,
        leading: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.black),
          child: IconButton(onPressed: () {

           }, icon: const Icon(Icons.person_outline, color: Colors.white,)),

        ),
        actions: [Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.black),
          child: IconButton(onPressed: () {
            Scaffold.of(context).showBottomSheet(


              elevation: 20,
              backgroundColor: Colors.transparent,
                  (BuildContext context) {
                return const DetailScreen();
              },);
          }, icon: const Icon(Icons.message_outlined, color: Colors.white,)),
        )
        ],

      ),
      body: const MapScreen(),
    );
  }
}
