import 'package:flutter/material.dart';

import '../../../../core/presentation/resources/color_manager.dart';
import '../../../../core/presentation/resources/styles_manager.dart';

class CustomSignUpRow extends StatelessWidget {
  const CustomSignUpRow({Key? key, required this.onTap, required this.buttonDesc, required this.buttonName}) : super(key: key);
final VoidCallback onTap;
final String buttonDesc;
final String buttonName;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          buttonDesc,
          style: getMediumInterStyle(
            fontSize: 17.0,
            color: ColorManager.greyishBrown,
          ),
        ),
        const SizedBox(
          width: 1.5,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            buttonName,
            style: getMediumInterStyle(
              fontSize: 17.0,
              color: ColorManager.baseColor,
            ),
          ),
        )
      ],
    );
  }
}
