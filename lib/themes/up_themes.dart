import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_theme_data.dart';

const Color _themeRedPrimaryColor = Color.fromARGB(255, 172, 14, 40);
const Color _themeRedAccentColor = Color.fromARGB(255, 188, 69, 89);
const Color _themeRedLightColor = Color.fromARGB(255, 255, 237, 240);
const Color _themeRedBGColor = Color.fromARGB(255, 255, 252, 253);
const Color _themeRedContrastColor = Color.fromARGB(255, 1, 55, 103);

const MaterialColor _themeVintagePrimaryBlack = MaterialColor(
  _themeVintagePrimaryBlackValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_themeVintagePrimaryBlackValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _themeVintagePrimaryBlackValue = 0xFF000000;

const MaterialColor _themeVintagePrimaryWhite = MaterialColor(
  _themeVintagePrimaryWhiteValue,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(_themeVintagePrimaryWhiteValue),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
const int _themeVintagePrimaryWhiteValue = 0xFFFFFFFF;

class UpThemes {
  static final UpThemeData light = UpThemeData(
    id: 0,
    themeData: ThemeData.light(),
  );

  static final UpThemeData dark = UpThemeData(
    id: 1,
    themeData: ThemeData.dark(),
  );

  static final UpThemeData lightBlue = UpThemeData(
    id: 2,
    themeData: ThemeData(
      primaryColor: Colors.blue[500],
      scaffoldBackgroundColor: Colors.blue[50],
      appBarTheme: AppBarTheme(
        color: Colors.blue[500],
      ),
      expansionTileTheme: ExpansionTileThemeData(
        collapsedIconColor: Colors.blue[500],
        collapsedTextColor: Colors.blue[500],
        iconColor: Colors.blue[500],
        textColor: Colors.blue[500],
      ),
      // buttonTheme: const ButtonThemeData(
      //   buttonColor: _themeRedContrastColor,
      //   textTheme: ButtonTextTheme.primary,
      // ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
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
          foregroundColor: Colors.blue[100],
          backgroundColor: Colors.blue,
          // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          // textStyle: const TextStyle(
          //   fontSize: 14,
          //   fontWeight: FontWeight.w500,
          // ),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(3),
          //   side: const BorderSide(color: Colors.transparent, width: 1),
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
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
          .copyWith(secondary: Colors.blue[100]),
    ),
  );

  static final UpThemeData lightRed = UpThemeData(
    id: 3,
    themeData: ThemeData(
      primaryColor: _themeRedPrimaryColor,
      scaffoldBackgroundColor: _themeRedLightColor,
      appBarTheme: const AppBarTheme(
        color: _themeRedPrimaryColor,
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        collapsedIconColor: _themeRedPrimaryColor,
        collapsedTextColor: _themeRedPrimaryColor,
        iconColor: _themeRedPrimaryColor,
        textColor: _themeRedPrimaryColor,
      ),
      // buttonTheme: const ButtonThemeData(
      //   buttonColor: _themeRedBGColor,
      //   textTheme: ButtonTextTheme.primary,
      // ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: _themeRedPrimaryColor),
        caption: TextStyle(color: _themeRedAccentColor),
        subtitle2: TextStyle(color: Colors.green),
        headline1: TextStyle(
            color: _themeRedPrimaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        headline2: TextStyle(color: _themeRedPrimaryColor, fontSize: 18),
        headline3: TextStyle(color: _themeRedAccentColor, fontSize: 12),
      ),
      cardTheme: const CardTheme(
          color: _themeRedBGColor, shadowColor: _themeRedContrastColor),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.grey[600],
        labelColor: _themeRedPrimaryColor,
      ),
      cardColor: _themeRedLightColor,
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
            decorationColor: _themeRedPrimaryColor,
            color: _themeRedContrastColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: _themeRedLightColor,
          backgroundColor: _themeRedPrimaryColor,
        ),
      ),
      listTileTheme: const ListTileThemeData(
        selectedColor: Colors.amber,
      ),
      iconTheme: const IconThemeData(
        color: _themeRedPrimaryColor,
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: _themeRedBGColor),
    ),
  );

  static final UpThemeData lightYellow = UpThemeData(
    id: 4,
    themeData: ThemeData(
      primaryColor: Colors.yellow[700],
      appBarTheme: AppBarTheme(
        color: Colors.yellow[700],
      ),
      expansionTileTheme: ExpansionTileThemeData(
        collapsedIconColor: Colors.yellow[700],
        collapsedTextColor: Colors.yellow[700],
        iconColor: Colors.yellow[700],
        textColor: Colors.yellow[700],
      ),
      secondaryHeaderColor: Colors.green,
      scaffoldBackgroundColor: Colors.yellow[100],
      textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.yellow[900]),
        caption: TextStyle(color: Colors.yellow[900]),
        headline5: const TextStyle(color: Colors.blueAccent),
        headline6: const TextStyle(color: Colors.yellow),
        button: const TextStyle(color: Colors.lightGreen),
        bodyText2: const TextStyle(color: Colors.lightGreen),
        headline4: const TextStyle(color: Colors.lightGreen),
        subtitle2: const TextStyle(color: Colors.lightGreen),
      ),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: Colors.grey[600],
        labelColor: Colors.yellow[800],
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.yellow[700],
        ),
      ),
      listTileTheme: const ListTileThemeData(
        selectedColor: Colors.amber,
      ),
      iconTheme: IconThemeData(
        color: Colors.yellow[700],
      ),
      cardColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
    ),
  );

  static final UpThemeData vintage = UpThemeData(
    id: 5,
    themeData: ThemeData(
      primaryColor: _themeVintagePrimaryBlack,
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

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          // textStyle: const TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.w400,
          // ),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          // shape: const RoundedRectangleBorder(
          //   side: BorderSide(
          //     color: Colors.transparent,
          //   ),
          // ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          // padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          backgroundColor: Colors.white,
          // textStyle: const TextStyle(
          //   fontSize: 20,
          //   fontWeight: FontWeight.w500,
          // ),
          // shape: const RoundedRectangleBorder(
          //   side: BorderSide(
          //     color: Colors.transparent,
          //   ),
          // ),
        ),
      ),
      textTheme: TextTheme(
        headline1: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
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
          color: _themeVintagePrimaryBlack,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
        headline6: const TextStyle(
          color: _themeVintagePrimaryWhite,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
      ),
      colorScheme:
          ColorScheme.fromSwatch(primarySwatch: _themeVintagePrimaryBlack)
              .copyWith(secondary: _themeVintagePrimaryWhite),
      // fixedSize: const Size(120, 40)),
    ),
  );

  static final predefinedThemesCollection = generateThemeCollection(themes: [
    lightBlue,
    lightRed,
    lightYellow,
    dark,
    light,
    vintage,
  ]);

  static void setTheme(BuildContext context, int id) {
    DynamicTheme.of(context)!.setTheme(id);
  }

  static ThemeCollection generateThemeCollection({
    required List<UpThemeData> themes,
    ThemeData? fallbackTheme,
  }) {
    Map<int, ThemeData> themesMap = {};

    for (var theme in themes) {
      themesMap[theme.id] = theme.themeData;
    }

    ThemeCollection collection = ThemeCollection(
        themes: themesMap, fallbackTheme: fallbackTheme ?? ThemeData.light());
    return collection;
  }
}
