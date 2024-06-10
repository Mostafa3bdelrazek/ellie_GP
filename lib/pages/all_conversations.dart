import 'package:chart/core/presentation/resources/routes_manager.dart';
import 'package:chart/core/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

import '../core/presentation/resources/color_manager.dart';
import '../core/presentation/resources/font_manager.dart';

class AllConversations extends StatelessWidget {
  const AllConversations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorManager.baseColor,
        ),
        title: Text(
          "All Conversations",
          style: getBoldInterStyle(color: ColorManager.baseColor,fontSize: 24)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemBuilder: (contest,index)=>InkWell(
            onTap: (){
              Navigator.pushNamed(context, Routes.chatScreen);
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorManager.baseColor2,
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Card(
                    child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/image.jpeg',
                        fit: BoxFit.fill,
                        height: 140,
                        width: 160,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8,),
                        Text(
                          'Conversations Conversations Conversations Conversations',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldInterStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s18,
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Text(
                          '21-11-2001 12:30 MP',
                          style: getBoldInterStyle(
                            color: ColorManager.greLight,
                            //fontSize: FontSize.s18,
                          ),
                        ),
                        const SizedBox(height: 8,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          separatorBuilder: (contest,index)=>const SizedBox(height: 16,),
          itemCount: 10,
        ),
      ),
    );
  }
}
