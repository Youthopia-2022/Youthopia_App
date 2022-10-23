import 'package:flutter/material.dart';

class ColourTheme{

  static Color secondary = const Color(0xFFfc0160);
  static Color pink = const Color(0xFFff6da0);
  static Color blue = const Color(0xFF1bbee9);
  static Color white = const Color(0xFFffffff);
  static Color grey = const Color(0xFF666666);
  static Color lightGrey = const Color(0xFF999999);
  static Color black = const Color(0xFF000000);


  static Color background = const Color(0xFF252525);

  static LinearGradient primaryGradient = LinearGradient(
      colors: <Color>[
        ColourTheme.pink,
        ColourTheme.blue
      ]);
}