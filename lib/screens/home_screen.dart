import 'package:domi_lab_assignment/screens/detail_screen.dart';
import 'package:domi_lab_assignment/screens/map.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Center(
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
            color: Colors.black),
          ),
        ),
        backgroundColor: Colors.transparent,
        leadingWidth: 65,
        leading: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
          height: 50,
          width: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.black),
          child: IconButton(onPressed: (){

            }, icon: Icon(Icons.person_3_rounded,color: Colors.white,)),

        ),
        actions: [Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          height: 50,
          width: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.black),
          child: IconButton(onPressed: (){
            Scaffold.of(context).showBottomSheet(



              elevation: 20,
                  backgroundColor: Colors.transparent,
                  (BuildContext context) {
              return DetailScreen();
            },);
          }, icon: Icon(Icons.message_outlined,color: Colors.white,)),
        )],

      ),
      body: MapScreen(),
    );
  }
}
