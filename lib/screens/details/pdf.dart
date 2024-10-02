import 'package:domi_lab_assignment/ViewModel/pdf_files.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfListScreen extends StatelessWidget {
  final ScrollController scrollController;

  const PdfListScreen({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    MediaFiles controller = Get.put(MediaFiles());
    print(controller.pdfList);
    return Obx(() {
      return ListView.builder(
        controller: scrollController,
        itemCount: controller.pdfList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(10, 255, 255, 255),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(5),
            child: ListTile(
              leading: const Image(

                image: AssetImage(
                  'assets/pdf.webp',
                ),
                height: 40,
              ),
              title: Text(
                controller.pdfList[index],
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: const Text("opened 21/2/12"),
              onTap: () {
                Get.to(() =>
                    SfPdfViewer.asset("assets/${controller.pdfList[index]}"));
              },
            ),
          );
        },
      );
    });
  }
}
