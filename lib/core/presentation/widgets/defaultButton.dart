// ignore_for_file: file_names

import 'package:chart/core/presentation/resources/color_manager.dart';
import 'package:chart/core/presentation/resources/font_manager.dart';
import 'package:chart/core/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final bool isLoading;
  final double? textSize;
  const DefaultButton({
    required this.onPressed,
    this.text,
    super.key,
    this.isLoading = false,
    this.height,
    this.width,
    this.textSize,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.baseColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Text(
              text??'',
              textAlign: TextAlign.center,
              style: getBoldInterStyle(color: ColorManager.white,fontSize: FontSize.s20),
            ),
    );
  }
}

// Widget defaultButton({
//   double width = double.infinity,
//   Color background = Colors.white,
//   required Function function,
//   required String text,
//   double height = 40,
//   bool isUpperCase = true,
// }) =>
//     Container(
//       margin: const EdgeInsets.all(8),
//       height: height,
//       color: background,
//       width: width,
//       child: ElevatedButton(
//         onPressed: () {
//           function();
//         },
//         child: Text(
//           isUpperCase ? text.toUpperCase() : text,
//           style: const TextStyle(
//             fontSize: 20,
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
