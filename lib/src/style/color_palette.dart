import 'package:flutter/material.dart';

class ColorPalette {
  static const int _lightGreyValue = 0xffb3b3b3;
  static const int _darkGreyValue = 0xff505050;
  static const int _orangeValue = 0xffff9100;
  static const int _blackValue = 0xff000000;
  static const int _whiteValue = 0xffffffff;

  static Color get lightGrey => const Color(_lightGreyValue);
  static Color get darkGrey => const Color(_darkGreyValue);
  static Color get orange => const Color(_orangeValue);
  static Color get black => const Color(_blackValue);
  static Color get white => const Color(_whiteValue);

  static MaterialColor lightGreyMaterialColor = createMaterialColor(lightGrey);
  static MaterialColor darkGreyMaterialColor = createMaterialColor(darkGrey);
  static MaterialColor orangeMaterialColor = createMaterialColor(orange);
  static MaterialColor blackMaterialColor = createMaterialColor(black);
  static MaterialColor whiteMaterialColor = createMaterialColor(white);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red,
        g = color.green,
        b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}