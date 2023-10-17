import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = Color.fromRGBO(20, 44, 83, 1);
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");

  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black = HexColor.fromHex("#000000"); // red color

  static Color kDarkBlueColor = Color(0xFF053149);

  static const colorGreen = Color.fromRGBO(3, 213, 75, 1);
  static const colorDark = Color.fromRGBO(15, 38, 76, 1);
  static const colorOpen = Color.fromRGBO(20, 44, 83, 1);
  static const colorBorder = Color.fromRGBO(36, 62, 101, 1);
  static const googlePlayGreen = Color.fromRGBO(60, 136, 96, 1);

  static const colorIntro = Color.fromRGBO(17, 37, 77, 1);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
