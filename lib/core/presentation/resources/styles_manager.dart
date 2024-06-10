import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle getRegularLexendStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    height: height,
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.lexend,
  );
}

TextStyle getBoldLexendStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    height: height,
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.lexend,
  );
}

TextStyle getMediumLexendStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.medium,
    fontFamily: FontConstants.lexend,
  );
}

TextStyle getSemiBoldLexendStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.lexend,
  );
}

TextStyle getRegularSFProDisplayStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    height: height,
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.regular,
    fontFamily: FontConstants.sFProDisplay,
  );
}

TextStyle getMediumSFProDisplayStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.medium,
    fontFamily: FontConstants.sFProDisplay,
  );
}

TextStyle getSemiBoldSFProDisplayStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.sFProDisplay,
  );
}

TextStyle getSemiBoldInterStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.semiBold,
      fontFamily: FontConstants.inter);
}

TextStyle getBoldInterStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.bold,
      fontFamily: FontConstants.inter);
}

TextStyle getSemiBoldOpenSansStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.semiBold,
      fontFamily: FontConstants.openSansFontFamily);
}

TextStyle getMediumInterStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.medium,
    fontFamily: FontConstants.inter,
    decoration: decoration,
  );
}

TextStyle getRegularInterStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.inter);
}

TextStyle getExtraBoldInterStyle({
  double fontSize = FontSize.s14,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.extraBold,
      fontFamily: FontConstants.inter);
}

TextStyle getBoldSFProDisplayStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.sFProDisplay,
    wordSpacing: wordSpacing,
    letterSpacing: letterSpacing,
    height: height,
  );
}

// Segoe Styles
TextStyle getBoldSegoeStyle({
  double fontSize = FontSize.s12,
  required Color color,
  double? wordSpacing,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.bold,
    fontFamily: FontConstants.segoeFontFamily,
  );
}

TextStyle getRegularSegoeStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.segoeFontFamily);
}

// Oxygen styles

TextStyle getBoldOxygenStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.bold,
      fontFamily: FontConstants.oxygenFontFamily);
}

TextStyle getRegularOxygenStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.regular,
      fontFamily: FontConstants.oxygenFontFamily);
}

TextStyle getLightOxygenStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeightManager.light,
      fontFamily: FontConstants.oxygenFontFamily);
}
