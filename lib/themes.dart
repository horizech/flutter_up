import 'package:flutter/material.dart';

class FlutterUpThemes {
  static Color themeRedPrimaryColor = const Color.fromARGB(255, 172, 14, 40);
  static Color themeRedAccentColor = const Color.fromARGB(255, 188, 69, 89);
  static Color themeRedLightColor = const Color.fromARGB(255, 255, 237, 240);
  static Color themeRedBGColor = const Color.fromARGB(255, 255, 252, 253);
  static Color themeRedContrastColor = const Color.fromARGB(255, 1, 55, 103);

  static ThemeData themeYellow = ThemeData(
    primaryColor: Colors.yellow[700],
    secondaryHeaderColor: Colors.green,
    scaffoldBackgroundColor: Colors.grey[100],
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.yellow[700],
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.yellow[900]),
      caption: TextStyle(color: Colors.yellow[900]),

      // headline:  TextStyle(color: Colors.blueAccent),
      // title: TextStyle(color: Colors.yellow),
      // button: TextStyle(color: Colors.lightGreen),
      // body1: TextStyle(color: Colors.lightGreen),
      // display1: TextStyle(color: Colors.lightGreen),
      // subtitle: TextStyle(color: Colors.lightGreen),
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.grey[600],
      labelColor: Colors.yellow[800],
    ),
    cardColor: Colors.white,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow[800]),
  );

  static ThemeData themeRed = ThemeData(
    primaryColor: themeRedPrimaryColor,
    secondaryHeaderColor: Colors.green,
    scaffoldBackgroundColor: Colors.grey[100],
    buttonTheme: ButtonThemeData(
      buttonColor: themeRedContrastColor,
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(color: themeRedPrimaryColor),
      caption: TextStyle(color: themeRedAccentColor),
      subtitle2: const TextStyle(color: Colors.green),

      // headline:  TextStyle(color: Colors.blueAccent),
      // title: TextStyle(color: Colors.yellow),
      // button: TextStyle(color: Colors.lightGreen),
      // body1: TextStyle(color: Colors.lightGreen),
      // display1: TextStyle(color: Colors.lightGreen),
      // subtitle: TextStyle(color: Colors.lightGreen),
    ),
    cardTheme:
        CardTheme(color: themeRedBGColor, shadowColor: themeRedContrastColor),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.grey[600],
      labelColor: themeRedPrimaryColor,
    ),
    cardColor: themeRedLightColor,
    inputDecorationTheme: InputDecorationTheme(
        // border: OutlineInputBorder(),
        // contentPadding: EdgeInsets.symmetric(
        //   vertical: 22,
        //   horizontal: 26,
        // ),
        labelStyle: TextStyle(
            // fontSize: 35,
            decorationColor: themeRedPrimaryColor,
            color: themeRedContrastColor)),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: themeRedAccentColor),
  );
}
