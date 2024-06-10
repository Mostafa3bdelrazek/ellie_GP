import 'package:chart/core/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.iconSize,
      required this.textSize});
  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.baseColor3,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Icon(
            icon,
            size: iconSize,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            title,
            style: TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
