import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/presentation/resources/color_manager.dart';
import '../../../../core/presentation/resources/styles_manager.dart';
import '../../../../core/presentation/resources/values_manager.dart';


class CustomForgetPassword extends StatelessWidget {
  const CustomForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: InkWell(
        onTap: () =>
        {},
        child: Text(
          'forgot password?',
          style: getMediumInterStyle(
            color: ColorManager.baseColor,
            fontSize: AppSize.s16.sp,
          ),
        ),
      ),
    );
  }
}
