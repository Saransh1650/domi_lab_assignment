import 'package:domi_lab_assignment/screens/details/pdf.dart';
import 'package:domi_lab_assignment/screens/details/search_docs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ViewModel/pdf_files.dart';

class DomiDocs extends StatelessWidget {
  final ScrollController scrollableController;

  const DomiDocs({super.key, required this.scrollableController});

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    MediaFiles controller = Get.put(MediaFiles(), permanent: true);
    return Expanded(
      child: Container(
        padding: isPortrait
            ? const EdgeInsets.all(20)
            : const EdgeInsets.fromLTRB(10, 0, 10, 0),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(18, 255, 255, 255),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "domi docs",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                isPortrait
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ))
                    : IconButton(
                        onPressed: () {
                          controller.pickPdf();
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))
              ],
            ),
            isPortrait ? const SearchDocs() : const SizedBox(),
            Expanded(
                child: PdfListScreen(scrollController: scrollableController)),
          ],
        ),
      ),
    );
  }
}
