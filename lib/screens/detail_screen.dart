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
                  margin: EdgeInsets.all(10),
                  height: 5, width: 40, decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50)
                      
                ),),
                Expanded(
                  child: ListView. builder( controller: scrollController,
                      itemCount: 25,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(title: Text( 'Item $index'));}
                  ),
                ),
              ],
            ),
          );
        },
      );

  }
}
