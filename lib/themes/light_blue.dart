import 'package:flutter/material.dart';

ThemeData lightBlueTheme = ThemeData(
  primarySwatch: Colors.blue,

  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
    // hintStyle: TextStyle(),
    // labelStyle: TextStyle(),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.solid,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      primary: Colors.blue,
      onPrimary: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.blue, width: 1)),
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
    headline3: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
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
    headline6: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 18,
    ),
  ),
  // fixedSize: const Size(120, 40)),
);
