import 'package:flutter/material.dart';

class AppTheme {
  final colorList = <Color>[
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.indigo,
    Colors.amber,
    Colors.lime,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];

  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'selectedColor must be less than 0');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch:
            MaterialColor(colorList[selectedColor].value, <int, Color>{
          50: colorList[selectedColor].withOpacity(0.1),
          100: colorList[selectedColor].withOpacity(0.2),
          200: colorList[selectedColor].withOpacity(0.3),
          300: colorList[selectedColor].withOpacity(0.4),
          400: colorList[selectedColor].withOpacity(0.5),
          500: colorList[selectedColor].withOpacity(0.6),
          600: colorList[selectedColor].withOpacity(0.7),
          700: colorList[selectedColor].withOpacity(0.8),
          800: colorList[selectedColor].withOpacity(0.9),
          900: colorList[selectedColor].withOpacity(1),
        }),
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(centerTitle: false));
}
