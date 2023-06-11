import 'package:flutter/material.dart';
import 'package:lingkar_budaya/common/resources/colors.dart';

class Poppins {
  static TextStyle regular(double fontSize,
      {Color color = BaseColors.black1,
      bool underline = false,
      bool italic = false}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontSize: fontSize,
        fontWeight: FontWeight.w100,
        color: color,
        decoration: underline ? TextDecoration.underline : null,
        fontStyle: italic ? FontStyle.italic : null);
  }

  static TextStyle medium(double fontSize,
      {Color color = BaseColors.black1,
      bool underline = false,
      bool italic = false}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
        decoration: underline ? TextDecoration.underline : null,
        fontStyle: italic ? FontStyle.italic : null);
  }

  static TextStyle bold(double fontSize,
      {Color color = BaseColors.black1,
      bool underline = false,
      bool italic = false}) {
    return TextStyle(
        fontFamily: 'Poppins',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
        decoration: underline ? TextDecoration.underline : null,
        fontStyle: italic ? FontStyle.italic : null);
  }
}
