import 'package:domi_lab_assignment/ViewModel/pdf_files.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDocs extends StatelessWidget {
  const SearchDocs({super.key});

  @override
  Widget build(BuildContext context) {
    MediaFiles controller = Get.put(MediaFiles(), permanent: true);
    return InkWell(
      onTap: (){
        controller.pickPdf();
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        padding:const  EdgeInsets.fromLTRB(15, 0, 0, 0),
        height: MediaQuery.of(context).size.height * 1 / 15,
        width: MediaQuery.of(context).size.width * 9 / 10,
        decoration: BoxDecoration(
            color: const Color.fromARGB(10, 255, 255, 255),
            borderRadius: BorderRadius.circular(30)),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Search Docs",
              style: TextStyle(
                  color: Colors.white38, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
