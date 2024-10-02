import 'package:domi_lab_assignment/ViewModel/invite_box_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Invite extends StatelessWidget {
  const Invite({super.key});

  @override
  Widget build(BuildContext context) {
    InviteBox boxVisibility = Get.put(InviteBox());
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Invite and Earn",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                IconButton(
                    onPressed: () {
                      boxVisibility.isVisible.value = false;
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ))
              ],
            ),
            const Row(
              children: [
                Expanded(
                    child: Text(
                        "Invite your neighbour and you both recieve \$10 when they clain their address",
                        style: TextStyle(
                          color: Colors.white,
                        )))
              ],
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 40,
              width: double.infinity,
              child: Obx(() {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      boxVisibility.onTap.value = true;
                      Future.delayed(const Duration(seconds: 2), () {
                        boxVisibility.isVisible.value =
                            false; // Close the dialog after 2 seconds
                      });
                    },
                    child: boxVisibility.onTap.value
                        ? Image.asset('assets/done.gif')
                        : const Text("Send Invite",
                            style: TextStyle(
                              color: Colors.black,
                            )));
              }),
            )
          ],
        ));
  }
}
