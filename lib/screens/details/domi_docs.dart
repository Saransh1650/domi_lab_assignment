import 'package:domi_lab_assignment/screens/details/pdf.dart';
import 'package:domi_lab_assignment/screens/details/search_docs.dart';
import 'package:flutter/material.dart';

class DomiDocs extends StatelessWidget {
  final ScrollController scrollableController;
  const DomiDocs({super.key, required this.scrollableController});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
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
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ))
              ],
            ),
            const SearchDocs(),
            Expanded(
                child: PdfListScreen(
                    scrollController: scrollableController)),
          ],
        ),
      ),
    );
  }
}
