import 'package:chart/core/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../core/presentation/resources/font_manager.dart';
import '../core/presentation/resources/styles_manager.dart';


class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorManager.baseColor2 ,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.baseColor,
              ),
                child: Icon(
              Icons.person,
              color: ColorManager.baseColor2,
              size: 120,
            )),
            const SizedBox(height: 16,),
            Text(
              'Mostafa abdelrazek',
              style: getMediumInterStyle(
                color: ColorManager.black,
                fontSize: FontSize.s24,
              ),
            ),
            //const SizedBox(height: 8,),
            Text(
              'mostafaabdelrazek@gmail.com',
              style: getMediumInterStyle(
                color: ColorManager.greLight,
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(height: 8,),
            Divider(color: ColorManager.baseColor,),
            const SizedBox(height: 16,),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: ColorManager.baseColor,
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Icon(
                    Icons.person,
                    color: ColorManager.baseColor2,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16,),
                Text(
                  'Profile',
                  style: getMediumInterStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: ColorManager.baseColor,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Icon(
                    Icons.chat,
                    color: ColorManager.baseColor2,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16,),
                Text(
                  'Conversations',
                  style: getMediumInterStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
