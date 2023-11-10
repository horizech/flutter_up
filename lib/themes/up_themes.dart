import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/themes/up_theme_data.dart';

class UpThemes {
  static Color getDarkerColor(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var f = 1 - percent / 100;
    Color color = Color.fromARGB(c.alpha, (c.red * f).round(),
        (c.green * f).round(), (c.blue * f).round());
    return color;
  }

  static Color getLighterColor(Color c, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    var p = percent / 100;
    Color color = Color.fromARGB(
        c.alpha,
        c.red + ((255 - c.red) * p).round(),
        c.green + ((255 - c.green) * p).round(),
        c.blue + ((255 - c.blue) * p).round());
    return color;
  }

  static MaterialColor generateDarkerMaterialColor(Color color) {
    return MaterialColor(
      color.value,
      {
        0: color,
        50: getDarkerColor(color, 5),
        100: getDarkerColor(color, 10),
        200: getDarkerColor(color, 15),
        300: getDarkerColor(color, 20),
        400: getDarkerColor(color, 25),
        500: getDarkerColor(color, 35),
        600: getDarkerColor(color, 50),
        700: getDarkerColor(color, 65),
        800: getDarkerColor(color, 80),
        900: getDarkerColor(color, 100),
      },
    );
  }

  static MaterialColor generateLighterMaterialColor(Color color) {
    return MaterialColor(
      color.value,
      <int, Color>{
        0: color,
        50: getLighterColor(color, 5),
        100: getLighterColor(color, 10),
        200: getLighterColor(color, 15),
        300: getLighterColor(color, 20),
        400: getLighterColor(color, 25),
        500: getLighterColor(color, 35),
        600: getLighterColor(color, 50),
        700: getLighterColor(color, 65),
        800: getLighterColor(color, 80),
        900: getLighterColor(color, 100),
      },
    );
  }

  static getContrastColor(Color color) {
    double sum =
        (color.red * 0.299) + (color.green * 0.587) + (color.blue * 0.114);
    if (sum > 150) {
      return Colors.black;
    }
    return Colors.white;
  }

  // static MaterialColor generateMaterialFromSingleColor(Color color) {
  //   return MaterialColor(color.value, <int, Color>{
  //     50: Color.fromRGBO(color.red, color.green, color.blue, 1),
  //     100: Color.fromRGBO(color.red, color.green, color.blue, 1),
  //     200: Color.fromRGBO(color.red, color.green, color.blue, 1),
  //     300: Color.fromRGBO(color.red, color.green, color.blue, 1),
  //     400: Color.fromRGBO(color.red, color.green, color.blue, 1),
  //     500: Color.fromRGBO(color.red, color.green, color.blue, .6),
  //     600: Color.fromRGBO(color.red, color.green, color.blue, .7),
  //     700: Color.fromRGBO(color.red, color.green, color.blue, .8),
  //     800: Color.fromRGBO(color.red, color.green, color.blue, .9),
  //     900: Color.fromRGBO(color.red, color.green, color.blue, 1),
  //   });
  // }

  static MaterialColor generateMaterialFromSingleColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

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

  static UpStyle generateStyleByMaterial({
    required MaterialColor inputColor,
    required MaterialColor contrastColor,
    required MaterialColor baseColor,
  }) {
    return UpStyle(
        // code
        codeBackgroundColor: baseColor.shade50,
        codeBorderColor: baseColor.shade100,
        codeTextColor: baseColor.shade900,
        appBackgroundColor: baseColor,

        // appbar
        appBarColor: inputColor[500]!,
        appBarTitleSize: 20,
        appBarTitleColor: contrastColor[500]!,

        // cusotm
        foregroundColor: inputColor[500]!,
        backgroundColor: baseColor.shade50,
        borderColor: inputColor[100],
        hoverBackgroundColor: inputColor[500]!,
        hoveredForegroundColor: contrastColor[500]!,
        hoveredBorderColor: inputColor[700]!,
        borderRadius: 8,
        borderWidth: 2,
        errorBorderColor: Colors.red,
        focusedBorderColor: inputColor[700]!,
        isRounded: true,
        iconColor: baseColor.shade900,
        iconSize: 16,
        toastBackgroundColor: inputColor[500],
        toastTextColor: contrastColor[500],

        //button
        buttonBackgroundColor: inputColor[500]!,
        buttonHoverBackgroundColor: inputColor[700]!,
        buttonTextColor: contrastColor,
        buttonHoverTextColor: contrastColor,
        buttonBorderColor: inputColor[500],
        buttonHoverBorderColor: inputColor[700]!,
        buttonBorderRadius: 8,
        buttonWidth: 130,
        buttonBorderWidth: 2,
        buttonTextSize: 16,
        buttonDisabledBorderColor: Colors.grey[300],
        buttonDisabledTextColor: Colors.grey,
        buttonDisbaledBackgroundColor: Colors.grey[300],
        buttonBorderStyle: BorderStyle.solid,
        buttonTextFit: BoxFit.none,
        buttonTextWeight: FontWeight.normal,
        //textfield
        textfieldTextColor: baseColor.shade900,
        textfieldBorderRadius: 8,
        textfieldFocusedLabelSize: 16,
        textfieldFilledColor: baseColor.shade100,
        textfieldFocusedFilledColor: Colors.transparent,
        textfieldLabelFocusedColor: inputColor[700]!,
        textfieldLabelColor: baseColor.shade600,
        textfieldBorderWidth: 2,
        textfieldHintColor: baseColor.shade400,
        textfieldBorderColor: Colors.transparent,
        textfieldLabelSize: 16,
        textfieldErrorBorderColor: Colors.red,
        textfieldFocusedBorderColor: inputColor,
        textfieldCursorColor: inputColor[700],

        //dropdown
        dropdownMenuColor: baseColor.shade50,
        dropdownMenuTextColor: baseColor.shade900,
        dropdownBorderRadius: 8,
        dropdownBorderWidth: 2,
        dropdownBorderColor: Colors.transparent,
        dropdownFilledColor: baseColor.shade100,
        dropdownFocusedFilledColor: Colors.transparent,
        dropdownLabelFocusedColor: inputColor[700]!,
        dropdownLabelColor: baseColor.shade600,
        dropdownLabelSize: 12,
        dropdownErrorBorderColor: Colors.red,
        dropdownFocusedBorderColor: inputColor[700]!,
        dropdownTextColor: baseColor.shade900,

        //check box
        checkboxCheckedColor: contrastColor,
        checkboxBorderColor: baseColor.shade600,
        checkboxBorderRadius: 8,
        checkboxLabelColor: baseColor.shade900,
        checkboxLabelSize: 12,
        checkboxBorderWidth: 2,
        checkboxBackgroundColor: inputColor[500],
        checkboxCheckedDisabledColor: contrastColor,
        checkboxDisabledLabelColor: baseColor.shade200,
        checkboxDisabledBackgroundColor: baseColor.shade200,
        checkboxHoverBorderColor: baseColor.shade900,
        checkboxRippleColor: baseColor.shade50,

        //radio button
        radioButtonFilledColor: inputColor[500]!,
        radioButtonBorderColor: baseColor.shade600,
        radioButtonBorderRadius: 100,
        radioButtonLabelColor: baseColor.shade900,
        radioButtonLabelSize: 12,
        radioButtonBorderWidth: 2,
        radioButtonDisabledFilledColor: baseColor.shade200,
        radioButtonDisabledLabelColor: baseColor.shade200,
        radioButtonDisabledBorderColor: baseColor.shade200,
        radioButtonHoverBorderColor: baseColor.shade900,
        radioButtonRippleColor: baseColor.shade50,

        //table
        tableHeaderColor: baseColor.shade100,
        tableRowColor: baseColor.shade50,
        tableRowHoverColor: baseColor.shade100,
        tableRowFocusedColor: inputColor[200]!,
        tableRowPressedColor: inputColor[400]!,
        tableBorderColor: baseColor.shade200,
        tableHeaderTextColor: baseColor.shade900,
        tableFooterColor: baseColor.shade100,

        //datepicker
        datePickerDialogBackgroundColor: baseColor.shade100,
        datePickerOnPrimaryColor: inputColor[900],
        datePickerOnSurfaceColor: baseColor.shade900,
        datePickerPrimaryColor: inputColor[500],
        datePickerSurfaceColor: baseColor.shade50,

        //
        dialogBackgroundColor: baseColor.shade50,

        //timepicker
        timePickerDialogBackgroundColor: baseColor,
        timePickerOnPrimaryColor: contrastColor[500],
        timePickerOnSurfaceColor: baseColor.shade900,
        timePickerPrimaryColor: inputColor[700],
        timePickerSurfaceColor: baseColor.shade50,

        //text
        textStrokeColor: Colors.transparent,
        textFontStyle: FontStyle.normal,
        textStrokeWidth: 0,
        textBackgroundColor: Colors.transparent,
        textColor: baseColor[900],
        textSize: 14,
        textWeight: FontWeight.normal,
        circularProgressBarColor: inputColor[700],
        heading1Size: 96.0,
        heading2Size: 60.0,
        heading3Size: 48.0,
        heading4Size: 34.0,
        heading5Size: 24.0,
        heading6Size: 20.0,
        paragraphSize: 16.0,
        heading1Weight: FontWeight.bold,
        heading2Weight: FontWeight.w700,
        heading3Weight: FontWeight.w600,
        heading4Weight: FontWeight.w400,
        heading5Weight: FontWeight.w300,
        heading6Weight: FontWeight.w200,
        paragraphWeight: FontWeight.normal,

        // expansion tile
        expansionTileBackgroundColor: baseColor.shade50,
        expansionTileCollapsedBackgroundColor: baseColor.shade50,
        expansionTileCollapsedIconColor: baseColor.shade800,
        expansionTileCollapsedTextColor: baseColor.shade800,
        expansionTileIconColor: baseColor.shade900,
        expansionTileTextColor: baseColor.shade900,

        // list tile
        listTileColor: baseColor.shade50,
        listTileFocusedColor: baseColor.shade200,
        listTileHoveredColor: baseColor.shade100,
        listTileIconColor: baseColor.shade900,
        listTileSelectedColor: inputColor[300],
        listTileSelectedTileColor: inputColor[100],
        listTileTextColor: baseColor.shade900,

        // card
        cardHeaderColor: baseColor.shade200,
        cardRadius: 3,
        cardWidth: 300,
        cardHeight: 300,
        cardBodyColor: baseColor.shade50,

        // drawer
        drawerBodyColor: baseColor.shade50,
        drawerHeaderColor: baseColor.shade100);
  }

  static UpThemeData generateThemeByIntColor({
    required int primaryColor,
    required int baseColor,
    bool isDark = false,
    int? secondaryColor,
    int? tertiaryColor,
    int? warnColor,
    int? linkColor,
    int? successColor,
  }) {
    return generateThemeByMaterial(
      baseColor: isDark
          ? generateLighterMaterialColor(Color(baseColor))
          : generateDarkerMaterialColor(Color(baseColor)),
      primaryColor: generateMaterialFromSingleColor(Color(primaryColor)),
      secondaryColor: secondaryColor != null
          ? generateMaterialFromSingleColor(Color(secondaryColor))
          : null,
      tertiaryColor: tertiaryColor != null
          ? generateMaterialFromSingleColor(Color(tertiaryColor))
          : null,
      warnColor: warnColor != null
          ? generateMaterialFromSingleColor(Color(warnColor))
          : null,
      linkColor: linkColor != null
          ? generateMaterialFromSingleColor(Color(linkColor))
          : null,
      successColor: successColor != null
          ? generateMaterialFromSingleColor(Color(successColor))
          : null,
    );
  }

  static UpThemeData generateThemeByColor({
    required Color primaryColor,
    required Color baseColor,
    bool isDark = false,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? warnColor,
    Color? linkColor,
    Color? successColor,
  }) {
    return generateThemeByMaterial(
      isDark: isDark ? true : false,
      baseColor: isDark
          ? generateLighterMaterialColor(baseColor)
          : generateDarkerMaterialColor(baseColor),
      primaryColor: generateMaterialFromSingleColor(primaryColor),
      secondaryColor: secondaryColor != null
          ? generateMaterialFromSingleColor(secondaryColor)
          : null,
      tertiaryColor: tertiaryColor != null
          ? generateMaterialFromSingleColor(tertiaryColor)
          : null,
      warnColor:
          warnColor != null ? generateMaterialFromSingleColor(warnColor) : null,
      linkColor:
          linkColor != null ? generateMaterialFromSingleColor(linkColor) : null,
      successColor: successColor != null
          ? generateMaterialFromSingleColor(successColor)
          : null,
    );
  }

  static UpThemeData generateThemeByMaterial({
    bool isDark = false,
    required MaterialColor primaryColor,
    required MaterialColor baseColor,
    MaterialColor? secondaryColor,
    MaterialColor? tertiaryColor,
    MaterialColor? warnColor,
    MaterialColor? linkColor,
    MaterialColor? successColor,
  }) {
    UpThemeData theme = UpThemeData(
      isDark: isDark,
      baseColor: baseColor,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      tertiaryColor: tertiaryColor,
      warnColor: warnColor,
      linkColor: linkColor,
      successColor: successColor,
      primaryStyle: generateStyleByMaterial(
        inputColor: primaryColor,
        contrastColor: generateMaterialFromSingleColor(
          getContrastColor(primaryColor),
        ),
        baseColor: baseColor,
      ),
      basicStyle: generateStyleByMaterial(
        inputColor: generateMaterialFromSingleColor(baseColor.shade100),
        contrastColor: generateMaterialFromSingleColor(
          getContrastColor(baseColor.shade100),
        ),
        baseColor: baseColor,
      ),
      secondaryStyle: generateStyleByMaterial(
        inputColor: secondaryColor ?? Colors.purple,
        contrastColor: generateMaterialFromSingleColor(
          getContrastColor(
            secondaryColor ?? Colors.purple,
          ),
        ),
        baseColor: baseColor,
      ),
      tertiaryStyle: generateStyleByMaterial(
        inputColor: tertiaryColor ?? Colors.cyan,
        contrastColor: generateMaterialFromSingleColor(
          getContrastColor(
            tertiaryColor ?? Colors.cyan,
          ),
        ),
        baseColor: baseColor,
      ),
      warnStyle: generateStyleByMaterial(
        inputColor: warnColor ?? Colors.orange,
        contrastColor: generateMaterialFromSingleColor(
          getContrastColor(
            warnColor ?? Colors.orange,
          ),
        ),
        baseColor: baseColor,
      ),
      linkStyle: generateStyleByMaterial(
        inputColor: linkColor ?? Colors.grey,
        contrastColor: generateMaterialFromSingleColor(
          getContrastColor(
            linkColor ?? Colors.grey,
          ),
        ),
        baseColor: baseColor,
      ),
      successStyle: generateStyleByMaterial(
        inputColor: successColor ?? Colors.green,
        contrastColor: generateMaterialFromSingleColor(
          getContrastColor(
            successColor ?? Colors.green,
          ),
        ),
        baseColor: baseColor,
      ),
    );
    return theme;
  }

  static calculateContrast(
      {required Color contrastColor, required Color color}) {
    var lum1 = UpThemes()
        ._luminance(contrastColor.red, contrastColor.green, contrastColor.blue);
    var lum2 = UpThemes()._luminance(color.red, color.green, color.blue);

    var brightest = max<num>(lum1, lum2);
    var darkest = min<num>(lum1, lum2);
    return (brightest + 0.05) / (darkest + 0.05);
  }

  _luminance(r, g, b) {
    List<dynamic> a = [r, g, b].map((v) {
      v /= 255;
      return v <= 0.03928 ? v / 12.92 : pow((v + 0.055) / 1.055, 2.4);
    }).toList();
    return a[0] * 0.2126 + a[1] * 0.7152 + a[2] * 0.0722;
  }
}
