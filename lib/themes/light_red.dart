import 'package:flutter/material.dart';

ThemeData lightRedTheme = ThemeData(
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
    headline1: TextStyle(
        color: themeRedPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
    headline2: TextStyle(color: themeRedPrimaryColor, fontSize: 18),
    headline3: TextStyle(color: themeRedAccentColor, fontSize: 12),
  ),
  cardTheme:
      CardTheme(color: themeRedBGColor, shadowColor: themeRedContrastColor),
  tabBarTheme: TabBarTheme(
    unselectedLabelColor: Colors.grey[600],
    labelColor: themeRedPrimaryColor,
  ),
  cardColor: themeRedLightColor,
  inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
          decorationColor: themeRedPrimaryColor, color: themeRedContrastColor)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: themeRedLightColor,
      backgroundColor: themeRedPrimaryColor,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: themeRedLightColor)
      .copyWith(secondary: themeRedLightColor),
);
Color themeRedPrimaryColor = const Color.fromARGB(255, 172, 14, 40);
Color themeRedAccentColor = const Color.fromARGB(255, 188, 69, 89);
Color themeRedLightColor = const Color.fromARGB(255, 255, 237, 240);
Color themeRedBGColor = const Color.fromARGB(255, 255, 252, 253);
Color themeRedContrastColor = const Color.fromARGB(255, 1, 55, 103);
