import 'package:flutter/material.dart';

import '../core/presentation/resources/color_manager.dart';
import '../core/presentation/resources/styles_manager.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorManager.,
      appBar: AppBar(
        //backgroundColor: ColorManager.baseColor2,
        iconTheme: IconThemeData(
          color: ColorManager.baseColor,
        ),
        title: Text("CHAT!",
            style:
                getBoldInterStyle(color: ColorManager.baseColor, fontSize: 24)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemBuilder: (context,index)=>Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    color: ColorManager.baseColor2,
                    shape: const CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.record_voice_over_rounded,
                        color: ColorManager.black,
                      ),
                    )),
                Expanded(
                  child: Card(
                    color: ColorManager.baseColor2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "In this example, the shape property is set to a RoundedRectangleBorder with a border radius of 15.0. You can customize the shape property as needed.",
                        style: getRegularInterStyle(color: ColorManager.black,fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Card(
                    color: ColorManager.baseColor2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "In this example, the shape property is set to a RoundedRectangleBorder with a border radius of 15.0. You can customize the shape property as needed.",
                        style: getRegularInterStyle(color: ColorManager.black,fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Card(
                    color: ColorManager.baseColor2,
                    shape: const CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.person,
                        color: ColorManager.black,
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 16,),
          ],
        ),itemCount: 5,),
      ),
    );
  }
}
