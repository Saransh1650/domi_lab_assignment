import 'package:domi_lab_assignment/ViewModel/invite_box_controller.dart';
import 'package:domi_lab_assignment/ViewModel/map_controller.dart';
import 'package:domi_lab_assignment/screens/Invite/invite.dart';
import 'package:domi_lab_assignment/screens/details/detail_screen.dart';
import 'package:domi_lab_assignment/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    MapController controller = Get.put(MapController());
    InviteBox boxVisibility = Get.put(InviteBox());
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 1/2,
            height: isPortrait ?  MediaQuery.of(context).size.width * 1/9 : MediaQuery.of(context).size.width * 1/20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: Colors.black),
            child: Center(child: Obx(() {
              return Row(
                children: [
                  Container(
                       margin: const EdgeInsets.all(2),
                      height:MediaQuery.of(context).size.width * 1/9,
                      width:isPortrait ?  MediaQuery.of(context).size.width * 1/9 : MediaQuery.of(context).size.width * 1/20,
                      child: controller.image.value == ""
                          ? Image.asset("assets/pin.png")
                          : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            controller.image.value,
                            fit: BoxFit.fill,
                          ))),
                  const Spacer(
                    flex: 1,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    width:  MediaQuery.of(context).size.width * 1/3,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        controller.currentAddress.value,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  )
                ],
              );
            })),
          ),
        ),
        backgroundColor: Colors.transparent,
        leadingWidth: isPortrait ?  MediaQuery.of(context).size.width * 2/13 : MediaQuery.of(context).size.width * 1/15,

        leading: Container(

          margin: const EdgeInsets.fromLTRB(10, 7, 7, 7),

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.black),
          child: IconButton(

              onPressed: () {
                Get.snackbar("No function", "The button does not do any functions for now");
              },
              icon: const Icon(
                size: 25,
                Icons.account_circle_outlined,
                color: Colors.white,
              )),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            height: isPortrait ?  MediaQuery.of(context).size.width * 1/9 : MediaQuery.of(context).size.width * 1/20,
            width: isPortrait ?  MediaQuery.of(context).size.width * 1/9 : MediaQuery.of(context).size.width * 1/20,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.black),
            child: IconButton(
                onPressed: () {
                  Get.bottomSheet(
                      enableDrag: true,
                      isScrollControlled: true,
                      const DetailScreen());
                },
                icon: const Icon(
                  Icons.message_outlined,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: Obx(() {
        return Stack(children: [const MapScreen(),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            // Animation duration
            bottom: boxVisibility.isVisible.value ? 20 : -200,
            // Change bottom to animate slide
            left: 0,
            right: 0,
            child: const Invite()
          ),

        ]);
      }),
    );
  }
}
