import 'package:flutter/material.dart';

class Handle extends StatelessWidget {
  const Handle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 5,
      width: 40,
      decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
