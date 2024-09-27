import 'package:domi_lab_assignment/screens/pdf.dart';
import 'package:domi_lab_assignment/screens/photo_tab.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      DraggableScrollableSheet(

        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
                  color: Colors.black
            ),
            child:

            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 5, width: 40, decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50)
                      
                ),),
                Container(
                  decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text("domi in", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                          const Spacer(),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,))
                        ],
                      )
                      ,
                      const SizedBox(

                        height: 100,
                        child: GridGallery(),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: PdfListScreen(),
                ),
              ],
            ),
          );
        },
      );

  }
}
