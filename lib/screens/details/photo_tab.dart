
import 'package:domi_lab_assignment/ViewModel/pdf_files.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridGallery extends StatelessWidget {
  const GridGallery({super.key});

  @override
  Widget build(BuildContext context) {
    MediaFiles controller = Get.put(MediaFiles());
    return  SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.picsList.length,
        itemBuilder: (context, index) {
        return Container(
          margin:const EdgeInsets.fromLTRB(0,0,10,0),
          height: 70,
          width: 70,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(controller.picsList[index], fit: BoxFit.fill,)),
        );
      },),
    );
  }
}

