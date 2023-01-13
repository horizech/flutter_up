import 'package:flutter/material.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/themes/up_theme_data.dart';

const Color _themeRedPrimaryColor = Color.fromARGB(255, 172, 14, 40);
const Color _themeRedAccentColor = Color.fromARGB(255, 188, 69, 89);
const Color _themeRedLightColor = Color.fromARGB(255, 255, 237, 240);
const Color _themeRedBGColor = Color.fromARGB(255, 255, 252, 253);
const Color _themeRedcontrast = Color.fromARGB(255, 1, 55, 103);

class UpThemes {
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

  static UpStyle generateStyleByMaterial(
      MaterialColor inputColor, MaterialColor contrast) {
    return UpStyle(
        appBarColor: inputColor[500]!,
        appBarTitleSize: 20,
        appBarTitleColor: contrast[500]!,
        foregroundColor: inputColor[500]!,
        backgroundColor: contrast[500]!,
        borderColor: inputColor[100],
        hoverBackgroundColor: inputColor[500]!,
        hoveredForegroundColor: contrast[500]!,
        hoveredBorderColor: inputColor[700]!,
        borderRadius: 8,
        borderWidth: 2,
        errorBorderColor: Colors.red,
        focusedBorderColor: inputColor[700]!,
        isRounded: true,
        iconColor: inputColor[500]!,
        iconSize: 16,

        //button
        buttonHoverBackgroundColor: inputColor[500]!,
        buttonHoverTextColor: contrast[500]!,
        buttonBackgroundColor: contrast[500]!,
        buttonHoverBorderColor: inputColor[500]!,
        buttonTextColor: inputColor[500]!,
        buttonBorderColor: inputColor[100],
        buttonBorderRadius: 8,
        buttonBorderWidth: 2,
        buttonTextSize: 12,
        buttonDisabledBorderColor: Colors.grey[300],
        buttonDisabledTextColor: Colors.grey,
        buttonDisbaledBackgroundColor: Colors.grey[300],
        //textfield
        textfieldBorderRadius: 8,
        textfieldBorderWidth: 2,
        textfieldBorderColor: inputColor[100],
        textfieldLabelColor: inputColor[500]!,
        textfieldLabelSize: 12,
        textfieldErrorBorderColor: Colors.red,
        textfieldFocusedBorderColor: inputColor[700]!,
        //dropdown
        dropdownBorderRadius: 8,
        dropdownBorderWidth: 2,
        dropdownBorderColor: inputColor[100],
        dropdownLabelColor: inputColor[500]!,
        dropdownLabelSize: 12,
        dropdownErrorBorderColor: Colors.red,
        dropdownFocusedBorderColor: inputColor[700]!,

        //check box
        checkboxCheckedColor: contrast,
        checkboxBorderColor: inputColor[100],
        checkboxBorderRadius: 8,
        checkboxLabelColor: inputColor[500]!,
        checkboxLabelSize: 12,
        checkboxBorderWidth: 2,
        checkboxBackgroundColor: inputColor[500],
        checkboxCheckedDisabledColor: contrast,
        checkboxDisabledLabelColor: Colors.grey,
        checkboxDisabledBackgroundColor: Colors.grey[300],
        checkboxHoverBorderColor: inputColor[700]!,
        checkboxRippleColor: Colors.grey[200],

        //radio button
        radioButtonFilledColor: inputColor[500]!,
        radioButtonBorderColor: inputColor[100],
        radioButtonBorderRadius: 100,
        radioButtonLabelColor: inputColor[500]!,
        radioButtonLabelSize: 12,
        radioButtonBorderWidth: 2,
        radioButtonDisabledFilledColor: Colors.grey,
        radioButtonDisabledLabelColor: Colors.grey,
        radioButtonDisabledBorderColor: Colors.grey[300],
        radioButtonHoverBorderColor: inputColor[700]!,
        radioButtonRippleColor: Colors.grey[200],

        //table
        tableHeaderColor: inputColor[300],
        tableRowColor: inputColor[100]);
  }

  static UpThemeData generateThemeByIntColor({
    required int primaryColor,
    int? secondaryColor,
    int? tertiaryColor,
    int? warnColor,
    int? linkColor,
    int? successColor,
  }) {
    return generateThemeByMaterial(
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
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? warnColor,
    Color? linkColor,
    Color? successColor,
  }) {
    return generateThemeByMaterial(
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
    required MaterialColor primaryColor,
    MaterialColor? secondaryColor,
    MaterialColor? tertiaryColor,
    MaterialColor? warnColor,
    MaterialColor? linkColor,
    MaterialColor? successColor,
  }) {
    MaterialColor contrast = generateMaterialFromSingleColor(Colors.white);
    // ThemeData.estimateBrightnessForColor(inputColor[700]!) == Brightness.light
    //     ? generateMaterialFromSingleColor(Colors.white)
    //     : generateMaterialFromSingleColor(Colors.black);
    UpThemeData theme = UpThemeData(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      tertiaryColor: tertiaryColor,
      warnColor: warnColor,
      linkColor: linkColor,
      successColor: successColor,
      primaryStyle: generateStyleByMaterial(primaryColor, contrast),
      secondaryStyle:
          generateStyleByMaterial(secondaryColor ?? Colors.purple, contrast),
      tertiaryStyle:
          generateStyleByMaterial(tertiaryColor ?? Colors.cyan, contrast),
      warnStyle: generateStyleByMaterial(warnColor ?? Colors.orange, contrast),
      linkStyle: generateStyleByMaterial(linkColor ?? Colors.grey, contrast),
      successStyle:
          generateStyleByMaterial(successColor ?? Colors.green, contrast),
    );
    return theme;
  }
}
