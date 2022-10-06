import 'package:flutter/material.dart';

ThemeData vintage = ThemeData(
  primaryColor: primaryBlack,
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
    // hintStyle: TextStyle(),
    // labelStyle: TextStyle(),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.solid,
      ),
    ),
  ),
  // unselectedWidgetColor: Colors.purpleAccent,
  // radioTheme: RadioThemeData(
  //   fillColor:
  //       MaterialStateColor.resolveWith((states) => Colors.black), //<-- SEE HERE
  // ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      backgroundColor: Colors.white,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
  ),
  textTheme: TextTheme(
    headline1: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
    headline2: TextStyle(
        color: Colors.black.withOpacity(1),
        fontWeight: FontWeight.w100,
        fontSize: 12),
    headline4: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
    headline5: const TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
    headline3: const TextStyle(
      color: primaryBlack,
      fontWeight: FontWeight.normal,
      fontSize: 18,
    ),
    headline6: const TextStyle(
      color: primaryWhite,
      fontWeight: FontWeight.normal,
      fontSize: 18,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryBlack)
      .copyWith(secondary: primaryWhite),
  // fixedSize: const Size(120, 40)),
);

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

const MaterialColor primaryWhite = MaterialColor(
  _whitePrimaryValue,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(_whitePrimaryValue),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
const int _whitePrimaryValue = 0xFFFFFFFF;
