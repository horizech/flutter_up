import 'package:flutter/material.dart';
import 'package:flutter_up/config/flutter_up_config.dart';
import 'package:flutter_up/contants.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_input_type.dart';

class UpStyle {
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final Color? foregroundColor;
  final Color? hoverBackgroundColor;
  final Color? hoveredBorderColor;
  final Color? hoveredForegroundColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? iconColor;
  final double? iconSize;
  final bool? isDisabled;
  final bool? isRounded;
  final Color? disabledBackgroundColor;
  final Color? disabledBorderColor;
  final Color? disabledForgroundColor;
  final Color? tableHeaderColor;
  //button
  final Color? buttonDisbaledBackgroundColor;
  final Color? buttonDisabledTextColor;
  final Color? buttonDisabledBorderColor;

  final Color? buttonBackgroundColor;
  final Color? buttonTextColor;
  final double? buttonTextSize;
  final Color? buttonBorderColor;
  final double? buttonBorderWidth;
  final double? buttonBorderRadius;
  final Color? buttonHoverBackgroundColor;
  final Color? buttonHoverTextColor;
  final Color? buttonHoverBorderColor;

//appbar
  final Color? appBarColor;
  final Color? appBarTitleColor;
  final double? appBarTitleSize;
  //checkbox
  final Color? checkboxBackgroundColor;
  final Color? checkboxCheckedColor;
  final Color? checkboxLabelColor;
  final Color? checkboxCheckedDisabledColor;

  final Color? checkboxDisabledLabelColor;
  final Color? checkboxDisabledBackgroundColor;
  final double? checkboxLabelSize;
  final Color? checkboxHoverBorderColor;
  final Color? checkboxBorderColor;
  final double? checkboxBorderWidth;
  final double? checkboxBorderRadius;
  final Color? checkboxRippleColor;

  //radio  button
  final Color? radioButtonFilledColor;
  final Color? radioButtonLabelColor;
  final double? radioButtonLabelSize;
  final Color? radioButtonHoverBorderColor;
  final Color? radioButtonBorderColor;
  final Color? radioButtonDisabledBorderColor;
  final Color? radioButtonDisabledFilledColor;
  final double? radioButtonBorderWidth;
  final double? radioButtonBorderRadius;
  final Color? radioButtonRippleColor;
  final Color? radioButtonDisabledLabelColor;

  //textdfield
  final double? textfieldBorderWidth;
  final double? textfieldBorderRadius;
  final Color? textfieldFocusedBorderColor;
  final Color? textfieldBorderColor;
  final Color? textfieldErrorBorderColor;
  final Color? textfieldLabelColor;
  final double? textfieldLabelSize;

  //dropdown
  final Color? dropdownFocusedBorderColor;
  final Color? dropdownBorderColor;
  final Color? dropdownErrorBorderColor;
  final Color? dropdownLabelColor;
  final double? dropdownLabelSize;
  final double? dropdownBorderWidth;
  final double? dropdownBorderRadius;

  UpStyle({
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
    this.borderWidth,
    this.foregroundColor,
    this.hoverBackgroundColor,
    this.hoveredBorderColor,
    this.hoveredForegroundColor,
    this.isDisabled,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.isRounded,
    this.iconSize,
    this.borderRadius,
    this.disabledBorderColor,
    this.disabledBackgroundColor,
    this.disabledForgroundColor,
    this.tableHeaderColor,

//appbar
    this.appBarColor,
    this.appBarTitleColor,
    this.appBarTitleSize,
    // button
    this.buttonTextSize,
    this.buttonBackgroundColor,
    this.buttonBorderColor,
    this.buttonBorderRadius,
    this.buttonBorderWidth,
    this.buttonHoverBackgroundColor,
    this.buttonHoverBorderColor,
    this.buttonHoverTextColor,
    this.buttonTextColor,
    this.buttonDisabledBorderColor,
    this.buttonDisabledTextColor,
    this.buttonDisbaledBackgroundColor,

    // checkbox
    this.checkboxBackgroundColor,
    this.checkboxBorderColor,
    this.checkboxBorderRadius,
    this.checkboxBorderWidth,
    this.checkboxHoverBorderColor,
    this.checkboxRippleColor,
    this.checkboxLabelColor,
    this.checkboxLabelSize,
    this.checkboxCheckedColor,
    this.checkboxDisabledBackgroundColor,
    this.checkboxDisabledLabelColor,
    this.checkboxCheckedDisabledColor,

    // radio button

    this.radioButtonBorderColor,
    this.radioButtonDisabledBorderColor,
    this.radioButtonDisabledFilledColor,
    this.radioButtonBorderRadius,
    this.radioButtonBorderWidth,
    this.radioButtonFilledColor,
    this.radioButtonHoverBorderColor,
    this.radioButtonLabelColor,
    this.radioButtonLabelSize,
    this.radioButtonRippleColor,
    this.radioButtonDisabledLabelColor,

    //textfield
    this.textfieldBorderColor,
    this.textfieldErrorBorderColor,
    this.textfieldFocusedBorderColor,
    this.textfieldLabelColor,
    this.textfieldBorderRadius,
    this.textfieldBorderWidth,
    this.textfieldLabelSize,

    //drodown
    this.dropdownBorderWidth,
    this.dropdownBorderColor,
    this.dropdownBorderRadius,
    this.dropdownErrorBorderColor,
    this.dropdownFocusedBorderColor,
    this.dropdownLabelColor,
    this.dropdownLabelSize,
  });
  static Color getFocusedBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.disabledForgroundColor ??
            style?.disabledForgroundColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).disabledForgroundColor ??
            UpConstants.kDefaultStyleDisabledForegroundColor
        : override?.focusedBorderColor ??
            style?.focusedBorderColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).focusedBorderColor ??
            style?.borderColor ??
            style?.foregroundColor ??
            Theme.of(context).primaryColor.withAlpha(64);
  }

  static Color getBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.disabledBackgroundColor ??
            style?.disabledBackgroundColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).disabledBackgroundColor ??
            UpConstants.kDefaultStyleDisabledBackgroundColor
        : override?.backgroundColor ??
            style?.backgroundColor ??
            getStyleByType(
                    (FlutterUpConfig.of(context)?.themeData ??
                        UpConstants.kDefaultTheme),
                    colorType)
                .backgroundColor ??
            Theme.of(context).primaryColor;
  }

  // static Color getRadioButtonColor(
  //   BuildContext context, {
  //   UpStyle? override,
  //   UpStyle? style,
  //   UpColorType? colorType,
  // }) {
  //   return style?.isDisabled == true
  //       ? override?.disabledForgroundColor ??
  //           style?.disabledForgroundColor ??
  //           getStyleByType(
  //             (FlutterUpConfig.of(context)?.themeData ??
  //                 UpConstants.kDefaultTheme),
  //             colorType,
  //           ).disabledForgroundColor ??
  //           UpConstants.kDefaultStyleDisabledForegroundColor
  //       : override?.radioButtonColor ??
  //           style?.radioButtonColor ??
  //           getStyleByType(
  //                   (FlutterUpConfig.of(context)?.themeData ??
  //                       UpConstants.kDefaultTheme),
  //                   colorType)
  //               .radioButtonColor ??
  //           style?.foregroundColor ??
  //           Theme.of(context).primaryColor;
  // }

  static Color getTableHeaderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.tableHeaderColor ??
        style?.tableHeaderColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .tableHeaderColor ??
        style?.foregroundColor ??
        Theme.of(context).primaryColor;
  }

  static Color getForegroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.disabledForgroundColor ??
            style?.disabledForgroundColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).disabledForgroundColor ??
            UpConstants.kDefaultStyleDisabledForegroundColor
        : override?.foregroundColor ??
            style?.foregroundColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).foregroundColor ??
            Theme.of(context).colorScheme.secondary;
  }

  static Color getBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.disabledBorderColor ??
            style?.disabledBorderColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).disabledBorderColor ??
            UpConstants.kDefaultStyleDisabledBorderColor
        : override?.borderColor ??
            style?.borderColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).borderColor ??
            Theme.of(context).primaryColor.withAlpha(64);
  }

  static Color getIconColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.iconColor ??
        style?.iconColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).iconColor ??
        style?.foregroundColor ??
        Theme.of(context).primaryColor;
  }

  static Color getErrorBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.errorBorderColor ??
        style?.errorBorderColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).errorBorderColor ??
        style?.borderColor ??
        style?.foregroundColor ??
        Theme.of(context).primaryColor.withAlpha(64);
  }

  static double getBorderWidth(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.borderWidth ??
        style?.borderWidth ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .borderWidth ??
        UpConstants.kDefaultStyleBorderWidth;
  }

  static double getBorderRadius(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.borderRadius ??
        style?.borderRadius ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .borderRadius ??
        UpConstants.kDefaultStyleBorderRadius;
  }

  static double getIconSize(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.iconSize ??
        style?.iconSize ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .iconSize ??
        UpConstants.kDefaultStyleIconSize;
  }

  static RoundedRectangleBorder getRoundedRectangleBorder(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return RoundedRectangleBorder(
      borderRadius: override?.isRounded ??
              style?.isRounded ??
              getStyleByType(
                      (FlutterUpConfig.of(context)?.themeData ??
                          UpConstants.kDefaultTheme),
                      colorType)
                  .isRounded ??
              UpConstants.kDefaultStyleIsRounded
          ? BorderRadius.circular(override?.borderRadius ??
              style?.borderRadius ??
              getStyleByType(
                      (FlutterUpConfig.of(context)?.themeData ??
                          UpConstants.kDefaultTheme),
                      colorType)
                  .borderRadius ??
              UpConstants.kDefaultStyleBorderRadius)
          : BorderRadius.zero,
      side: BorderSide(
        color: override?.borderColor ??
            style?.borderColor ??
            getStyleByType(
                    (FlutterUpConfig.of(context)?.themeData ??
                        UpConstants.kDefaultTheme),
                    colorType)
                .borderColor ??
            UpConstants.kDefaultStyleBorderColor,
        width: override?.borderWidth ??
            style?.borderWidth ??
            getStyleByType(
                    (FlutterUpConfig.of(context)?.themeData ??
                        UpConstants.kDefaultTheme),
                    colorType)
                .borderWidth ??
            UpConstants.kDefaultStyleBorderWidth,
      ),
    );
  }

  static ButtonStyle getButtonStyle(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        getButtonBackgroundColor(context, style: style, colorType: colorType),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        getButtonTextColor(context, style: style, colorType: colorType),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        getRoundedRectangleBorder(context, style: style, colorType: colorType),
      ),
      elevation: MaterialStateProperty.all<double>(16),
    );
  }

  static Color getHoverBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.hoverBackgroundColor ??
        style?.hoverBackgroundColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .hoverBackgroundColor ??
        Theme.of(context).primaryColor;
  }

  static Color getHoverForegroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.hoveredForegroundColor ??
        style?.hoveredForegroundColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .hoveredForegroundColor ??
        Theme.of(context).primaryColor;
  }

  static Color getHoverBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.hoveredBorderColor ??
        style?.hoveredBorderColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .backgroundColor ??
        Theme.of(context).primaryColor;
  }

  // button
  static Color getButtonBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.buttonDisbaledBackgroundColor ??
            style?.buttonDisbaledBackgroundColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).buttonDisbaledBackgroundColor ??
            UpConstants.kDefaultStyleDisabledBackgroundColor
        : override?.buttonBackgroundColor ??
            style?.buttonBackgroundColor ??
            getStyleByType(
                    (FlutterUpConfig.of(context)?.themeData ??
                        UpConstants.kDefaultTheme),
                    colorType)
                .buttonBackgroundColor ??
            Theme.of(context).primaryColor;
  }

  static Color getButtonTextColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.buttonDisabledTextColor ??
            style?.buttonDisabledTextColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).buttonDisabledTextColor ??
            UpConstants.kDefaultStyleDisabledForegroundColor
        : override?.buttonTextColor ??
            style?.buttonTextColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).buttonTextColor ??
            Theme.of(context).colorScheme.secondary;
  }

  static Color getButtonBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.buttonDisabledBorderColor ??
            style?.buttonDisabledBorderColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).buttonDisabledBorderColor ??
            UpConstants.kDefaultStyleDisabledBorderColor
        : override?.buttonBorderColor ??
            style?.buttonBorderColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).buttonBorderColor ??
            Theme.of(context).primaryColor.withAlpha(64);
  }

  static double getButtonBorderWidth(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.buttonBorderWidth ??
        style?.buttonBorderWidth ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .buttonBorderWidth ??
        UpConstants.kDefaultStyleBorderWidth;
  }

  static double getButtonBorderRadius(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.buttonBorderRadius ??
        style?.buttonBorderRadius ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .buttonBorderRadius ??
        UpConstants.kDefaultStyleBorderRadius;
  }

  static double getButtonTextSize(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.buttonTextSize ??
        style?.buttonTextSize ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .buttonTextSize ??
        UpConstants.kDefaultStyleTextSize;
  }

  static Color getButtonHoverBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.buttonHoverBackgroundColor ??
        style?.buttonHoverBackgroundColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .buttonHoverBackgroundColor ??
        Theme.of(context).primaryColor;
  }

  static Color getButtonHoverTextColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.buttonHoverTextColor ??
        style?.buttonHoverTextColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .buttonHoverTextColor ??
        Theme.of(context).primaryColor;
  }

  static Color getButtonHoverBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.buttonHoverBorderColor ??
        style?.buttonHoverBorderColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .buttonHoverBorderColor ??
        Theme.of(context).primaryColor;
  }

  //checkbox
  // static Color getCheckBoxLabelColor(
  //   BuildContext context, {
  //   UpStyle? override,
  //   UpStyle? style,
  //   UpColorType? colorType,
  // }) {
  //   return style?.isDisabled == true
  //       ? override?.chec ??
  //           style?.buttonDisabledTextColor ??
  //           getStyleByType(
  //             (FlutterUpConfig.of(context)?.themeData ??
  //                 UpConstants.kDefaultTheme),
  //             colorType,
  //           ).buttonDisabledTextColor ??
  //           UpConstants.kDefaultStyleDisabledForegroundColor
  //       : override?.buttonTextColor ??
  //           style?.buttonTextColor ??
  //           getStyleByType(
  //             (FlutterUpConfig.of(context)?.themeData ??
  //                 UpConstants.kDefaultTheme),
  //             colorType,
  //           ).buttonTextColor ??
  //           Theme.of(context).colorScheme.secondary;
  // }
  static Color getCheckboxCheckedColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.checkboxCheckedDisabledColor ??
            style?.checkboxCheckedDisabledColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).checkboxCheckedDisabledColor ??
            UpConstants.kDefaultStyleDisabledBackgroundColor
        : override?.checkboxCheckedColor ??
            style?.checkboxCheckedColor ??
            getStyleByType(
                    (FlutterUpConfig.of(context)?.themeData ??
                        UpConstants.kDefaultTheme),
                    colorType)
                .checkboxCheckedColor ??
            Theme.of(context).primaryColor;
  }

  static Color getCheckboxLabelColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.checkboxDisabledLabelColor ??
            style?.checkboxDisabledLabelColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).checkboxDisabledLabelColor ??
            UpConstants.kDefaultStyleDisabledForegroundColor
        : override?.checkboxLabelColor ??
            style?.checkboxLabelColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).checkboxLabelColor ??
            Theme.of(context).colorScheme.secondary;
  }

  static Color getCheckboxBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.checkboxDisabledBackgroundColor ??
            style?.checkboxDisabledBackgroundColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).checkboxDisabledBackgroundColor ??
            UpConstants.kDefaultStyleDisabledBorderColor
        : override?.checkboxBorderColor ??
            style?.checkboxBorderColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).checkboxBorderColor ??
            Theme.of(context).primaryColor.withAlpha(64);
  }

  static double getcheckboxBorderWidth(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.checkboxBorderWidth ??
        style?.checkboxBorderWidth ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .checkboxBorderWidth ??
        UpConstants.kDefaultStyleBorderWidth;
  }

  static double getCheckboxLabelSize(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.checkboxLabelSize ??
        style?.checkboxLabelSize ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .checkboxLabelSize ??
        UpConstants.kDefaultStyleTextSize;
  }

  static double getCheckboxBorderRadius(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.checkboxBorderRadius ??
        style?.checkboxBorderRadius ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .checkboxBorderRadius ??
        UpConstants.kDefaultStyleBorderRadius;
  }

  static Color getCheckboxRippleColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.checkboxRippleColor ??
        style?.checkboxRippleColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .checkboxRippleColor ??
        Theme.of(context).primaryColor.withAlpha(1);
  }

  static Color getcheckboxHoverBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.checkboxHoverBorderColor ??
        style?.checkboxHoverBorderColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .checkboxHoverBorderColor ??
        Theme.of(context).primaryColor;
  }

  static Color getcheckboxBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.checkboxDisabledBackgroundColor ??
            style?.checkboxDisabledBackgroundColor ??
            getStyleByType(
                    (FlutterUpConfig.of(context)?.themeData ??
                        UpConstants.kDefaultTheme),
                    colorType)
                .checkboxDisabledBackgroundColor ??
            UpConstants.kDefaultStyleDisabledBackgroundColor
        : override?.checkboxBackgroundColor ??
            style?.checkboxBackgroundColor ??
            getStyleByType(
                    (FlutterUpConfig.of(context)?.themeData ??
                        UpConstants.kDefaultTheme),
                    colorType)
                .checkboxBackgroundColor ??
            Theme.of(context).primaryColor;
  }

//radiobutton

  static Color getRadioButtonFilledColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.radioButtonDisabledFilledColor ??
            style?.radioButtonDisabledFilledColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).radioButtonDisabledFilledColor ??
            UpConstants.kDefaultStyleDisabledBackgroundColor
        : override?.radioButtonFilledColor ??
            style?.radioButtonFilledColor ??
            getStyleByType(
                    (FlutterUpConfig.of(context)?.themeData ??
                        UpConstants.kDefaultTheme),
                    colorType)
                .radioButtonFilledColor ??
            Theme.of(context).primaryColor;
  }

  static Color getRadioButtonLabelColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.radioButtonDisabledLabelColor ??
            style?.radioButtonDisabledLabelColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).radioButtonDisabledLabelColor ??
            UpConstants.kDefaultStyleDisabledForegroundColor
        : override?.buttonTextColor ??
            style?.buttonTextColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).buttonTextColor ??
            Theme.of(context).colorScheme.secondary;
  }

  static Color getRadioButtonBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return style?.isDisabled == true
        ? override?.radioButtonDisabledBorderColor ??
            style?.radioButtonDisabledBorderColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).radioButtonDisabledBorderColor ??
            UpConstants.kDefaultStyleDisabledBorderColor
        : override?.radioButtonBorderColor ??
            style?.radioButtonBorderColor ??
            getStyleByType(
              (FlutterUpConfig.of(context)?.themeData ??
                  UpConstants.kDefaultTheme),
              colorType,
            ).radioButtonBorderColor ??
            Theme.of(context).primaryColor.withAlpha(64);
  }

  static double getRadioButtonBorderWidth(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.radioButtonBorderWidth ??
        style?.radioButtonBorderWidth ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .radioButtonBorderWidth ??
        UpConstants.kDefaultStyleBorderWidth;
  }

  static double getRadioButtonLabelSize(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.radioButtonLabelSize ??
        style?.radioButtonLabelSize ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .radioButtonLabelSize ??
        UpConstants.kDefaultStyleTextSize;
  }

  static Color getRadioButtonRippleColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.radioButtonRippleColor ??
        style?.radioButtonRippleColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .radioButtonRippleColor ??
        Theme.of(context).primaryColor.withAlpha(1);
  }

  static Color getRadioButtonHoverBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.radioButtonHoverBorderColor ??
        style?.radioButtonHoverBorderColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .radioButtonHoverBorderColor ??
        Theme.of(context).primaryColor;
  }

  //textfields

  static Color getTextfieldBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.textfieldBorderColor ??
        style?.textfieldBorderColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).textfieldBorderColor ??
        Theme.of(context).primaryColor.withAlpha(64);
  }

  static Color getTextfieldFocusedBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.textfieldFocusedBorderColor ??
        style?.textfieldFocusedBorderColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).textfieldFocusedBorderColor ??
        style?.textfieldBorderColor ??
        style?.foregroundColor ??
        Theme.of(context).primaryColor.withAlpha(64);
  }

  static Color getTextfieldErrorBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.textfieldErrorBorderColor ??
        style?.textfieldErrorBorderColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).textfieldErrorBorderColor ??
        style?.textfieldErrorBorderColor ??
        style?.foregroundColor ??
        Theme.of(context).primaryColor.withAlpha(64);
  }

  static double getTextfieldBorderWidth(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.textfieldBorderWidth ??
        style?.textfieldBorderWidth ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .textfieldBorderWidth ??
        UpConstants.kDefaultStyleBorderWidth;
  }

  static double getTextfieldBorderRadius(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.textfieldBorderRadius ??
        style?.textfieldBorderRadius ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .textfieldBorderRadius ??
        UpConstants.kDefaultStyleBorderRadius;
  }

  static Color getTextfieldLabelColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.textfieldLabelColor ??
        style?.textfieldLabelColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).textfieldLabelColor ??
        Theme.of(context).colorScheme.secondary;
  }

  static double getTextfieldLabelSize(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.textfieldLabelSize ??
        style?.textfieldLabelSize ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .textfieldLabelSize ??
        UpConstants.kDefaultStyleTextSize;
  }

  static InputBorder? getTextfieldBorderStyle(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpInputType? type,
    UpColorType? colorType,
    bool isFocused = false,
    bool isError = false,
  }) {
    switch (type) {
      case UpInputType.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: isFocused
                ? UpStyle.getTextfieldFocusedBorderColor(
                    context,
                    colorType: colorType,
                    style: style,
                  )
                : isError
                    ? UpStyle.getTextfieldErrorBorderColor(
                        context,
                        colorType: colorType,
                        style: style,
                      )
                    : UpStyle.getTextfieldBorderColor(
                        context,
                        colorType: colorType,
                        style: style,
                      ),
            width: UpStyle.getTextfieldBorderWidth(
              context,
              colorType: colorType,
              style: style,
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              UpStyle.getTextfieldBorderRadius(
                context,
                style: style,
                colorType: colorType,
              ),
            ),
          ),
        );

      case UpInputType.outline:
      default:
        return OutlineInputBorder(
          borderSide: BorderSide(
            color: isFocused
                ? UpStyle.getTextfieldFocusedBorderColor(
                    context,
                    colorType: colorType,
                    style: style,
                  )
                : isError
                    ? UpStyle.getTextfieldErrorBorderColor(
                        context,
                        colorType: colorType,
                        style: style,
                      )
                    : UpStyle.getTextfieldBorderColor(
                        context,
                        colorType: colorType,
                        style: style,
                      ),
            width: UpStyle.getTextfieldBorderWidth(
              context,
              colorType: colorType,
              style: style,
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              UpStyle.getTextfieldBorderRadius(
                context,
                style: style,
                colorType: colorType,
              ),
            ),
          ),
        );
    }
  }

  //textfields

  static Color getDropdownBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.dropdownBorderColor ??
        style?.dropdownBorderColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).dropdownBorderColor ??
        Theme.of(context).primaryColor.withAlpha(64);
  }

  static Color getDropdownFocusedBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.dropdownFocusedBorderColor ??
        style?.dropdownFocusedBorderColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).dropdownFocusedBorderColor ??
        style?.dropdownBorderColor ??
        style?.foregroundColor ??
        Theme.of(context).primaryColor.withAlpha(64);
  }

  static Color getDropdownErrorBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.dropdownErrorBorderColor ??
        style?.dropdownErrorBorderColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).dropdownErrorBorderColor ??
        style?.dropdownBorderColor ??
        style?.foregroundColor ??
        Theme.of(context).primaryColor.withAlpha(64);
  }

  static double getDropdownBorderWidth(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.dropdownBorderWidth ??
        style?.dropdownBorderWidth ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .dropdownBorderWidth ??
        UpConstants.kDefaultStyleBorderWidth;
  }

  static double getDropdownBorderRadius(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.dropdownBorderRadius ??
        style?.dropdownBorderRadius ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .dropdownBorderRadius ??
        UpConstants.kDefaultStyleBorderRadius;
  }

  static Color getDropdownLabelColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.dropdownLabelColor ??
        style?.dropdownLabelColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).dropdownLabelColor ??
        Theme.of(context).colorScheme.secondary;
  }

  static double getDropdownLabelSize(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.dropdownLabelSize ??
        style?.dropdownLabelSize ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .dropdownLabelSize ??
        UpConstants.kDefaultStyleTextSize;
  }

  static InputBorder? getDropdownBorderStyle(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpInputType? type,
    UpColorType? colorType,
    bool isFocused = false,
    bool isError = false,
  }) {
    switch (type) {
      case UpInputType.underline:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: isFocused
                ? UpStyle.getDropdownFocusedBorderColor(
                    context,
                    colorType: colorType,
                    style: style,
                  )
                : isError
                    ? UpStyle.getDropdownErrorBorderColor(
                        context,
                        colorType: colorType,
                        style: style,
                      )
                    : UpStyle.getDropdownBorderColor(
                        context,
                        colorType: colorType,
                        style: style,
                      ),
            width: UpStyle.getDropdownBorderWidth(
              context,
              colorType: colorType,
              style: style,
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              UpStyle.getDropdownBorderRadius(
                context,
                style: style,
                colorType: colorType,
              ),
            ),
          ),
        );

      case UpInputType.outline:
      default:
        return OutlineInputBorder(
          borderSide: BorderSide(
            color: isFocused
                ? UpStyle.getDropdownFocusedBorderColor(
                    context,
                    colorType: colorType,
                    style: style,
                  )
                : isError
                    ? UpStyle.getDropdownErrorBorderColor(
                        context,
                        colorType: colorType,
                        style: style,
                      )
                    : UpStyle.getDropdownBorderColor(
                        context,
                        colorType: colorType,
                        style: style,
                      ),
            width: UpStyle.getDropdownBorderWidth(
              context,
              colorType: colorType,
              style: style,
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              UpStyle.getDropdownBorderRadius(
                context,
                style: style,
                colorType: colorType,
              ),
            ),
          ),
        );
    }
  }

  //app bar

  static Color getAppBarColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.appBarColor ??
        style?.appBarColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).appBarColor ??
        Theme.of(context).primaryColor;
  }

  static Color getAppBarTitleColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.appBarTitleColor ??
        style?.appBarTitleColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).appBarTitleColor ??
        Theme.of(context).colorScheme.secondary;
  }

  static double getAppBarTitleSize(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.appBarTitleSize ??
        style?.appBarTitleSize ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .appBarTitleSize ??
        UpConstants.kDefaultStyleTextSize;
  }
}
