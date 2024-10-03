import 'package:domi_lab_assignment/screens/details/domi_docs.dart';
import 'package:domi_lab_assignment/screens/details/domi_in.dart';
import 'package:domi_lab_assignment/screens/details/handle.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return DraggableScrollableSheet(
        initialChildSize: isPortrait ? 0.7 : 1,
        maxChildSize: 1,
        snap: true,
        expand: false,
        snapSizes: const [
          0.55,
          1,
        ],
        builder: (context, scrollController) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.black),
              child: Column(
                children: [
                  const Handle(),
                  const DomiIn(),
                  DomiDocs(
                    scrollableController: scrollController,
                  )
                ],
              ),
            ),
          );
        });
  }
}
