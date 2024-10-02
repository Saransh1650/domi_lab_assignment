import 'package:domi_lab_assignment/screens/details/photo_tab.dart';
import 'package:flutter/material.dart';

class DomiIn extends StatelessWidget {
  const DomiIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(18, 255, 255, 255),
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      child:  Column(
        children: [
          Row(
            children: [
              const Text(
                "domi in",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
               const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                  ))
            ],
          ),
          const GridGallery(),
        ],
      ),
    );
  }
}
