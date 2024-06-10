import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    /// main colors
    primaryColor: ColorManager.baseColor3,
    primaryColorLight: Colors.grey,
    disabledColor: Colors.grey,
    splashColor: Colors.grey,
    scaffoldBackgroundColor: ColorManager.white,

    /// card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.white,
      elevation: AppSize.s4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s13.spa),
      ),
    ),

    // /// divider theme
    // dividerTheme: const DividerThemeData(
    //     endIndent: AppSize.s16,
    //     indent: AppSize.s16,
    //     space: AppSize.s16),

    /// app bar theme
    appBarTheme: AppBarTheme(
       centerTitle: true,
      //color: ColorManager.transparent,
      //shadowColor: Colors.transparent,
      backgroundColor: ColorManager.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(AppSize.s32),
          // Adjust the radius as needed
          bottomLeft:
              Radius.circular(AppSize.s32), // Adjust the radius as needed
        ),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
      titleTextStyle: getBoldLexendStyle(
        fontSize: FontSize.s18.sp,
        color: ColorManager.baseColor3,
      ),
    ),

    /// button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: Colors.grey,
      buttonColor: ColorManager.baseColor3,
      splashColor: Colors.blue,
    ),

    /// elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularLexendStyle(
          color: ColorManager.white,
          fontSize: FontSize.s10.sp,
        ),
        backgroundColor: ColorManager.baseColor3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s02.dp),
        ),
      ),
    ),

    /// text theme
    textTheme: TextTheme(
      displayLarge: getSemiBoldLexendStyle(
        color: Colors.black,
        fontSize: FontSize.s16.sp,
      ),
      displayMedium: getSemiBoldLexendStyle(
        color: Colors.black,
        fontSize: FontSize.s22.sp,
      ),
      displaySmall: getSemiBoldLexendStyle(
        color: Colors.black,
        fontSize: FontSize.s24.sp,
      ),
      headlineMedium: getMediumInterStyle(
        color: ColorManager.warmGrey2,
        fontSize: FontSize.s18.sp,
      ),
      titleMedium: getRegularLexendStyle(
        color: ColorManager.warmGrey2,
        fontSize: FontSize.s12.sp,
      ),
      titleSmall: getRegularLexendStyle(
        color: Colors.black,
        fontSize: FontSize.s15.sp,
      ),
      bodySmall: getRegularInterStyle(color: Colors.grey),
    ),

    /// input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      fillColor: ColorManager.white,
      filled: true,

      prefixIconColor: ColorManager.baseColor3,
      suffixIconColor: ColorManager.baseColor3,

      /// content padding
      contentPadding: EdgeInsets.symmetric(
          vertical: AppSize.s1_5.h, horizontal: AppSize.s3.w),
      hintStyle: getRegularInterStyle(
          color: ColorManager.warmGrey2, fontSize: AppSize.s16.sp),
      labelStyle: getRegularInterStyle(
          color: ColorManager.baseColor3, fontSize: AppSize.s16.sp),
      errorStyle: getRegularLexendStyle(color: ColorManager.red),

      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white2, width: AppSize.s1),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10))),
      focusedBorder:  const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white2, width: AppSize.s1),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10))),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.red, width: AppSize.s1),
          borderRadius:  const BorderRadius.all(Radius.circular(AppSize.s10))),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white2, width: AppSize.s1),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10))),
      disabledBorder:  const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white2, width: AppSize.s1),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s10))),
    ),
  );
}
