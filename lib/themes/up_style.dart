import 'package:flutter/material.dart';
import 'package:flutter_up/config/up_config.dart';
import 'package:flutter_up/contants.dart';
import 'package:flutter_up/enums/text_style.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_input_type.dart';

/// The base of FlutterUp style.
///
/// Contains styles for each specific widget and also general style
/// that is used when specific one is not available.
class UpStyle {
  // General
  // Styles that are mostly used when specific ones are not provided
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

  // Table
  final Color? tableHeaderTextColor;
  final Color? tableHeaderColor;
  final Color? tableRowColor;
  final Color? tableRowPressedColor;
  final Color? tableBorderColor;
  final Color? tableRowFocusedColor;
  final Color? tableRowHoverColor;
  final Color? tableFooterColor;
  final Color? tableFooterTextColor;

  // Toast
  final Color? toastBackgroundColor;
  final Gradient? toastBackgroundGradient;
  final Color? toastForegroundColor;
  final Icon? toastIcon;
  final Color? toastTextColor;

  // Button
  final Color? buttonDisbaledBackgroundColor;
  final Color? buttonDisabledTextColor;
  final Color? buttonDisabledBorderColor;
  final Color? buttonBackgroundColor;
  final Color? buttonTextColor;
  final double? buttonTextSize;
  final double? textStrokeWidth;
  final Color? textStrokeColor;
  final Color? buttonBorderColor;
  final double? buttonBorderWidth;
  final double? buttonBorderRadius;
  final Color? buttonHoverBackgroundColor;
  final Color? buttonHoverTextColor;
  final Color? buttonHoverBorderColor;
  final Image? buttonBackgroundImage;
  final Gradient? buttonBackgroundGradient;
  final UpStyle? buttonBorderTopStyle;
  final UpStyle? buttonBorderBottomStyle;
  final UpStyle? buttonBorderLeftStyle;
  final UpStyle? buttonBorderRightStyle;
  final BorderStyle? buttonBorderStyle;
  final double? buttonWidth;
  final double? buttonHeight;
  final BoxFit? buttonTextFit;

  // Appbar
  final Color? appBarColor;
  final Color? appBarTitleColor;
  final double? appBarTitleSize;

  // Expansion Tile

  final Color? expansionTileCollapsedIconColor;
  final Color? expansionTileCollapsedTextColor;
  final Color? expansionTileIconColor;
  final Color? expansionTileTextColor;
  final Color? expansionTileBackgroundColor;
  final Color? expansionTileCollapsedBackgroundColor;

  // Checkbox
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

  // Radio button
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

  // Text field
  final double? textfieldBorderWidth;
  final double? textfieldBorderRadius;
  final Color? textfieldFocusedBorderColor;
  final Color? textfieldBorderColor;
  final Color? textfieldErrorBorderColor;
  final Color? textfieldLabelColor;
  final double? textfieldLabelSize;
  final Color? textfieldCursorColor;

  // Dropdown
  final Color? dropdownFocusedBorderColor;
  final Color? dropdownBorderColor;
  final Color? dropdownErrorBorderColor;
  final Color? dropdownLabelColor;
  final double? dropdownLabelSize;
  final double? dropdownBorderWidth;
  final double? dropdownBorderRadius;

  // Date picker
  final Color? datePickerPrimaryColor;
  final Color? datePickerOnPrimaryColor;
  final Color? datePickerSurfaceColor;
  final Color? datePickerOnSurfaceColor;
  final Color? datePickerDialogBackgroundColor;

  // Time picker
  final Color? timePickerPrimaryColor;
  final Color? timePickerOnPrimaryColor;
  final Color? timePickerSurfaceColor;
  final Color? timePickerOnSurfaceColor;
  final Color? timePickerDialogBackgroundColor;

  // Text
  final Color? textColor;
  final Color? textBackgroundColor;
  final double? textSize;
  final Color? circularProgressBarColor;
  final FontWeight? textWeight;
  final FontStyle? textFontStyle;
  final double? heading1Size;
  final double? heading2Size;
  final double? heading3Size;
  final double? heading4Size;
  final double? heading5Size;
  final double? heading6Size;
  final double? paragraphSize;
  final FontWeight? heading1Weight;
  final FontWeight? heading2Weight;
  final FontWeight? heading3Weight;
  final FontWeight? heading4Weight;
  final FontWeight? heading5Weight;
  final FontWeight? heading6Weight;
  final FontWeight? paragraphWeight;

  UpStyle({
    // General
    this.backgroundColor,
    this.circularProgressBarColor,
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

    // Toast
    this.toastBackgroundGradient,
    this.toastBackgroundColor,
    this.toastForegroundColor,
    this.toastIcon,
    this.toastTextColor,

    // Text
    this.heading1Size,
    this.heading2Size,
    this.heading3Size,
    this.heading4Size,
    this.heading5Size,
    this.heading6Size,
    this.paragraphSize,
    this.textBackgroundColor,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.textFontStyle,
    this.heading1Weight,
    this.heading2Weight,
    this.heading3Weight,
    this.heading4Weight,
    this.heading5Weight,
    this.heading6Weight,
    this.paragraphWeight,

    // Table
    this.tableBorderColor,
    this.tableRowColor,
    this.tableRowFocusedColor,
    this.tableRowHoverColor,
    this.tableRowPressedColor,
    this.tableHeaderColor,
    this.tableFooterColor,
    this.tableHeaderTextColor,
    this.tableFooterTextColor,

    // Appbar
    this.appBarColor,
    this.appBarTitleColor,
    this.appBarTitleSize,

    // Button
    this.buttonTextSize,
    this.textStrokeWidth,
    this.textStrokeColor,
    this.buttonBackgroundColor,
    this.buttonBorderColor,
    this.buttonBorderRadius,
    this.buttonBorderWidth,
    this.buttonHoverBackgroundColor,
    this.buttonHoverBorderColor,
    this.buttonHoverTextColor,
    this.buttonTextFit,
    this.buttonTextColor,
    this.buttonDisabledBorderColor,
    this.buttonDisabledTextColor,
    this.buttonDisbaledBackgroundColor,
    this.buttonBackgroundImage,
    this.buttonBackgroundGradient,
    this.buttonBorderBottomStyle,
    this.buttonBorderLeftStyle,
    this.buttonBorderRightStyle,
    this.buttonBorderTopStyle,
    this.buttonBorderStyle,
    this.buttonHeight,
    this.buttonWidth,

    // Checkbox
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

    // Radio button
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

    // Text field
    this.textfieldBorderColor,
    this.textfieldErrorBorderColor,
    this.textfieldFocusedBorderColor,
    this.textfieldLabelColor,
    this.textfieldBorderRadius,
    this.textfieldBorderWidth,
    this.textfieldCursorColor,
    this.textfieldLabelSize,

    // Drodown
    this.dropdownBorderWidth,
    this.dropdownBorderColor,
    this.dropdownBorderRadius,
    this.dropdownErrorBorderColor,
    this.dropdownFocusedBorderColor,
    this.dropdownLabelColor,
    this.dropdownLabelSize,

    // Datepicker
    this.datePickerDialogBackgroundColor,
    this.datePickerOnPrimaryColor,
    this.datePickerOnSurfaceColor,
    this.datePickerPrimaryColor,
    this.datePickerSurfaceColor,

    // Time picker
    this.timePickerDialogBackgroundColor,
    this.timePickerOnPrimaryColor,
    this.timePickerOnSurfaceColor,
    this.timePickerPrimaryColor,
    this.timePickerSurfaceColor,

    //expansion tile
    this.expansionTileBackgroundColor,
    this.expansionTileCollapsedBackgroundColor,
    this.expansionTileCollapsedIconColor,
    this.expansionTileCollapsedTextColor,
    this.expansionTileIconColor,
    this.expansionTileTextColor,
  });

  UpStyle copyWith(UpStyle override) {
    return UpStyle(
      // General
      backgroundColor: override.backgroundColor ?? backgroundColor,
      circularProgressBarColor:
          override.circularProgressBarColor ?? circularProgressBarColor,
      borderColor: override.borderColor ?? borderColor,
      iconColor: override.iconColor ?? iconColor,
      borderWidth: override.borderWidth ?? borderWidth,
      foregroundColor: override.foregroundColor ?? foregroundColor,
      hoverBackgroundColor:
          override.hoverBackgroundColor ?? hoverBackgroundColor,
      hoveredBorderColor: override.hoveredBorderColor ?? hoveredBorderColor,
      hoveredForegroundColor:
          override.hoveredForegroundColor ?? hoveredForegroundColor,
      isDisabled: override.isDisabled ?? isDisabled,
      focusedBorderColor: override.focusedBorderColor ?? focusedBorderColor,
      errorBorderColor: override.errorBorderColor ?? errorBorderColor,
      isRounded: override.isRounded ?? isRounded,
      iconSize: override.iconSize ?? iconSize,
      borderRadius: override.borderRadius ?? borderRadius,
      disabledBorderColor: override.disabledBorderColor ?? disabledBorderColor,
      disabledBackgroundColor:
          override.disabledBackgroundColor ?? disabledBackgroundColor,
      disabledForgroundColor:
          override.disabledForgroundColor ?? disabledForgroundColor,

      // Toast
      toastBackgroundGradient:
          override.toastBackgroundGradient ?? toastBackgroundGradient,
      toastBackgroundColor:
          override.toastBackgroundColor ?? toastBackgroundColor,
      toastForegroundColor:
          override.toastForegroundColor ?? toastForegroundColor,
      toastIcon: override.toastIcon ?? toastIcon,
      toastTextColor: override.toastTextColor ?? toastTextColor,

      // Text
      textBackgroundColor: override.textBackgroundColor ?? textBackgroundColor,
      textColor: override.textColor ?? textColor,
      textSize: override.textSize ?? textSize,
      textWeight: override.textWeight ?? textWeight,
      textFontStyle: override.textFontStyle ?? textFontStyle,

      // Table
      tableBorderColor: override.tableBorderColor ?? tableBorderColor,
      tableRowColor: override.tableRowColor ?? tableRowColor,
      tableRowFocusedColor:
          override.tableRowFocusedColor ?? tableRowFocusedColor,
      tableRowHoverColor: override.tableRowHoverColor ?? tableRowHoverColor,
      tableRowPressedColor:
          override.tableRowPressedColor ?? tableRowPressedColor,
      tableHeaderColor: override.tableHeaderColor ?? tableHeaderColor,
      tableFooterColor: override.tableFooterColor ?? tableFooterColor,
      tableHeaderTextColor:
          override.tableHeaderTextColor ?? tableHeaderTextColor,
      tableFooterTextColor:
          override.tableFooterTextColor ?? tableFooterTextColor,

      // Appbar
      appBarColor: override.appBarColor ?? appBarColor,
      appBarTitleColor: override.appBarTitleColor ?? appBarTitleColor,
      appBarTitleSize: override.appBarTitleSize ?? appBarTitleSize,

      // Button
      buttonTextSize: override.buttonTextSize ?? buttonTextSize,
      textStrokeWidth: override.textStrokeWidth ?? textStrokeWidth,
      textStrokeColor: override.textStrokeColor ?? textStrokeColor,
      buttonBackgroundColor:
          override.buttonBackgroundColor ?? buttonBackgroundColor,
      buttonBorderColor: override.buttonBorderColor ?? buttonBorderColor,
      buttonBorderRadius: override.buttonBorderRadius ?? buttonBorderRadius,
      buttonBorderWidth: override.buttonBorderWidth ?? buttonBorderWidth,
      buttonHoverBackgroundColor:
          override.buttonHoverBackgroundColor ?? buttonHoverBackgroundColor,
      buttonHoverBorderColor:
          override.buttonHoverBorderColor ?? buttonHoverBorderColor,
      buttonHoverTextColor:
          override.buttonHoverTextColor ?? buttonHoverTextColor,
      buttonTextFit: override.buttonTextFit ?? buttonTextFit,
      buttonTextColor: override.buttonTextColor ?? buttonTextColor,
      buttonDisabledBorderColor:
          override.buttonDisabledBorderColor ?? buttonDisabledBorderColor,
      buttonDisabledTextColor:
          override.buttonDisabledTextColor ?? buttonDisabledTextColor,
      buttonDisbaledBackgroundColor: override.buttonDisbaledBackgroundColor ??
          buttonDisbaledBackgroundColor,
      buttonBackgroundImage:
          override.buttonBackgroundImage ?? buttonBackgroundImage,
      buttonBackgroundGradient:
          override.buttonBackgroundGradient ?? buttonBackgroundGradient,
      buttonBorderBottomStyle:
          override.buttonBorderBottomStyle ?? buttonBorderBottomStyle,
      buttonBorderLeftStyle:
          override.buttonBorderLeftStyle ?? buttonBorderLeftStyle,
      buttonBorderRightStyle:
          override.buttonBorderRightStyle ?? buttonBorderRightStyle,
      buttonBorderTopStyle:
          override.buttonBorderTopStyle ?? buttonBorderTopStyle,
      buttonBorderStyle: override.buttonBorderStyle ?? buttonBorderStyle,
      buttonHeight: override.buttonHeight ?? buttonHeight,
      buttonWidth: override.buttonWidth ?? buttonWidth,

      // Checkbox
      checkboxBackgroundColor:
          override.checkboxBackgroundColor ?? checkboxBackgroundColor,
      checkboxBorderColor: override.checkboxBorderColor ?? checkboxBorderColor,
      checkboxBorderRadius:
          override.checkboxBorderRadius ?? checkboxBorderRadius,
      checkboxBorderWidth: override.checkboxBorderWidth ?? checkboxBorderWidth,
      checkboxHoverBorderColor:
          override.checkboxHoverBorderColor ?? checkboxHoverBorderColor,
      checkboxRippleColor: override.checkboxRippleColor ?? checkboxRippleColor,
      checkboxLabelColor: override.checkboxLabelColor ?? checkboxLabelColor,
      checkboxLabelSize: override.checkboxLabelSize ?? checkboxLabelSize,
      checkboxCheckedColor:
          override.checkboxCheckedColor ?? checkboxCheckedColor,
      checkboxDisabledBackgroundColor:
          override.checkboxDisabledBackgroundColor ??
              checkboxDisabledBackgroundColor,
      checkboxDisabledLabelColor:
          override.checkboxDisabledLabelColor ?? checkboxDisabledLabelColor,
      checkboxCheckedDisabledColor:
          override.checkboxCheckedDisabledColor ?? checkboxCheckedDisabledColor,

      // Radio button
      radioButtonBorderColor:
          override.radioButtonBorderColor ?? radioButtonBorderColor,
      radioButtonDisabledBorderColor: override.radioButtonDisabledBorderColor ??
          radioButtonDisabledBorderColor,
      radioButtonDisabledFilledColor: override.radioButtonDisabledFilledColor ??
          radioButtonDisabledFilledColor,
      radioButtonBorderRadius:
          override.radioButtonBorderRadius ?? radioButtonBorderRadius,
      radioButtonBorderWidth:
          override.radioButtonBorderWidth ?? radioButtonBorderWidth,
      radioButtonFilledColor:
          override.radioButtonFilledColor ?? radioButtonFilledColor,
      radioButtonHoverBorderColor:
          override.radioButtonHoverBorderColor ?? radioButtonHoverBorderColor,
      radioButtonLabelColor:
          override.radioButtonLabelColor ?? radioButtonLabelColor,
      radioButtonLabelSize:
          override.radioButtonLabelSize ?? radioButtonLabelSize,
      radioButtonRippleColor:
          override.radioButtonRippleColor ?? radioButtonRippleColor,
      radioButtonDisabledLabelColor: override.radioButtonDisabledLabelColor ??
          radioButtonDisabledLabelColor,

      // Text field
      textfieldBorderColor:
          override.textfieldBorderColor ?? textfieldBorderColor,
      textfieldErrorBorderColor:
          override.textfieldErrorBorderColor ?? textfieldErrorBorderColor,
      textfieldFocusedBorderColor:
          override.textfieldFocusedBorderColor ?? textfieldFocusedBorderColor,
      textfieldLabelColor: override.textfieldLabelColor ?? textfieldLabelColor,
      textfieldBorderRadius:
          override.textfieldBorderRadius ?? textfieldBorderRadius,
      textfieldBorderWidth:
          override.textfieldBorderWidth ?? textfieldBorderWidth,
      textfieldCursorColor:
          override.textfieldCursorColor ?? textfieldCursorColor,
      textfieldLabelSize: override.textfieldLabelSize ?? textfieldLabelSize,

      // Drodown
      dropdownBorderWidth: override.dropdownBorderWidth ?? dropdownBorderWidth,
      dropdownBorderColor: override.dropdownBorderColor ?? dropdownBorderColor,
      dropdownBorderRadius:
          override.dropdownBorderRadius ?? dropdownBorderRadius,
      dropdownErrorBorderColor:
          override.dropdownErrorBorderColor ?? dropdownErrorBorderColor,
      dropdownFocusedBorderColor:
          override.dropdownFocusedBorderColor ?? dropdownFocusedBorderColor,
      dropdownLabelColor: override.dropdownLabelColor ?? dropdownLabelColor,
      dropdownLabelSize: override.dropdownLabelSize ?? dropdownLabelSize,

      // Datepicker
      datePickerDialogBackgroundColor:
          override.datePickerDialogBackgroundColor ??
              datePickerDialogBackgroundColor,
      datePickerOnPrimaryColor:
          override.datePickerOnPrimaryColor ?? datePickerOnPrimaryColor,
      datePickerOnSurfaceColor:
          override.datePickerOnSurfaceColor ?? datePickerOnSurfaceColor,
      datePickerPrimaryColor:
          override.datePickerPrimaryColor ?? datePickerPrimaryColor,
      datePickerSurfaceColor:
          override.datePickerSurfaceColor ?? datePickerSurfaceColor,

      // Time picker
      timePickerDialogBackgroundColor:
          override.timePickerDialogBackgroundColor ??
              timePickerDialogBackgroundColor,
      timePickerOnPrimaryColor:
          override.timePickerOnPrimaryColor ?? timePickerOnPrimaryColor,
      timePickerOnSurfaceColor:
          override.timePickerOnSurfaceColor ?? timePickerOnSurfaceColor,
      timePickerPrimaryColor:
          override.timePickerPrimaryColor ?? timePickerPrimaryColor,
      timePickerSurfaceColor:
          override.timePickerSurfaceColor ?? timePickerSurfaceColor,
    );
  }

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
              UpConfig.of(context).theme,
              colorType,
            ).disabledForgroundColor ??
            UpConstants.kDefaultStyleDisabledForegroundColor
        : override?.focusedBorderColor ??
            style?.focusedBorderColor ??
            getStyleByType(
              UpConfig.of(context).theme,
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
              UpConfig.of(context).theme,
              colorType,
            ).disabledBackgroundColor ??
            UpConstants.kDefaultStyleDisabledBackgroundColor
        : override?.backgroundColor ??
            style?.backgroundColor ??
            getStyleByType(UpConfig.of(context).theme, colorType)
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
  //             (FlutterUpConfig.of(context).themeData ??
  //                 UpConstants.kDefaultTheme),
  //             colorType,
  //           ).disabledForgroundColor ??
  //           UpConstants.kDefaultStyleDisabledForegroundColor
  //       : override?.radioButtonColor ??
  //           style?.radioButtonColor ??
  //           getStyleByType(
  //                   (FlutterUpConfig.of(context).themeData ??
  //                       UpConstants.kDefaultTheme),
  //                   colorType)
  //               .radioButtonColor ??
  //           style?.foregroundColor ??
  //           Theme.of(context).primaryColor;
  // }

  static Color getTableRowFocusedColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.tableRowFocusedColor ??
        style?.tableRowFocusedColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .tableRowFocusedColor ??
        Colors.grey;
  }

  static Color getTableRowPressedColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.tableRowPressedColor ??
        style?.tableRowPressedColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .tableRowPressedColor ??
        Colors.grey;
  }

  static Color getTableHeaderTextColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.tableHeaderTextColor ??
        style?.tableHeaderTextColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .tableHeaderTextColor ??
        Colors.white;
  }

  static Color getTableFooterTextColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.tableFooterTextColor ??
        style?.tableFooterTextColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .tableFooterTextColor ??
        Colors.white;
  }

  static Color getTableRowHoverColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.tableRowHoverColor ??
        style?.tableRowHoverColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .tableRowHoverColor ??
        Colors.grey;
  }

  static Color getTableHeaderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.tableHeaderColor ??
        style?.tableHeaderColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .tableHeaderColor ??
        style?.foregroundColor ??
        Theme.of(context).primaryColor;
  }

  static Color getTableFooterColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.tableFooterColor ??
        style?.tableFooterColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .tableFooterColor ??
        style?.foregroundColor ??
        Theme.of(context).primaryColor;
  }

  static Color getTableRowColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.tableRowColor ??
        style?.tableRowColor ??
        getStyleByType(UpConfig.of(context).theme, colorType).tableRowColor ??
        Colors.transparent;
  }

  static Color getTableBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.tableBorderColor ??
        style?.tableBorderColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .tableBorderColor ??
        Colors.grey;
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
              UpConfig.of(context).theme,
              colorType,
            ).disabledForgroundColor ??
            UpConstants.kDefaultStyleDisabledForegroundColor
        : override?.foregroundColor ??
            style?.foregroundColor ??
            getStyleByType(
              UpConfig.of(context).theme,
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
              UpConfig.of(context).theme,
              colorType,
            ).disabledBorderColor ??
            UpConstants.kDefaultStyleDisabledBorderColor
        : override?.borderColor ??
            style?.borderColor ??
            getStyleByType(
              UpConfig.of(context).theme,
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
          UpConfig.of(context).theme,
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
          UpConfig.of(context).theme,
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
        getStyleByType(UpConfig.of(context).theme, colorType).borderWidth ??
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
        getStyleByType(UpConfig.of(context).theme, colorType).borderRadius ??
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
        getStyleByType(UpConfig.of(context).theme, colorType).iconSize ??
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
              getStyleByType(UpConfig.of(context).theme, colorType).isRounded ??
              UpConstants.kDefaultStyleIsRounded
          ? BorderRadius.circular(override?.borderRadius ??
              style?.borderRadius ??
              getStyleByType(UpConfig.of(context).theme, colorType)
                  .borderRadius ??
              UpConstants.kDefaultStyleBorderRadius)
          : BorderRadius.zero,
      side: BorderSide(
        color: override?.borderColor ??
            style?.borderColor ??
            getStyleByType(UpConfig.of(context).theme, colorType).borderColor ??
            UpConstants.kDefaultStyleBorderColor,
        width: override?.borderWidth ??
            style?.borderWidth ??
            getStyleByType(UpConfig.of(context).theme, colorType).borderWidth ??
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

  static BoxFit getButtonTextFit(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.buttonTextFit ??
        style?.buttonTextFit ??
        getStyleByType(UpConfig.of(context).theme, colorType).buttonTextFit ??
        BoxFit.none;
  }

  static Gradient? getButtonBackgroundGradient(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.buttonBackgroundGradient ??
        style?.buttonBackgroundGradient ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .buttonBackgroundGradient;
  }

  static BorderSide getTopStyleButtonBorder(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return BorderSide(
      style: style?.buttonBorderTopStyle?.buttonBorderStyle ??
          getButtonBorderStyle(context, style: style, colorType: colorType),
      width: style?.buttonBorderTopStyle?.buttonBorderWidth ??
          getButtonBorderWidth(context, style: style, colorType: colorType),
      color: style?.buttonBorderTopStyle?.buttonBorderColor ??
          getButtonBorderColor(context, style: style, colorType: colorType),
    );
  }

  static BorderSide getLeftStyleButtonBorder(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return BorderSide(
      style: style?.buttonBorderLeftStyle?.buttonBorderStyle ??
          getButtonBorderStyle(context, style: style, colorType: colorType),
      width: style?.buttonBorderLeftStyle?.buttonBorderWidth ??
          getButtonBorderWidth(context, style: style, colorType: colorType),
      color: style?.buttonBorderLeftStyle?.buttonBorderColor ??
          getButtonBorderColor(context, style: style, colorType: colorType),
    );
  }

  static BorderSide getLeftStyleButtonBorderOnHover(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return BorderSide(
      style: style?.buttonBorderLeftStyle?.buttonBorderStyle ??
          getButtonBorderStyle(context, style: style, colorType: colorType),
      width: style?.buttonBorderLeftStyle?.buttonBorderWidth ??
          getButtonBorderWidth(context, style: style, colorType: colorType),
      color: style?.buttonBorderLeftStyle?.buttonHoverBorderColor ??
          getButtonHoverBorderColor(context,
              style: style, colorType: colorType),
    );
  }

  static BorderSide getRightStyleButtonBorder(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return BorderSide(
      style: style?.buttonBorderRightStyle?.buttonBorderStyle ??
          getButtonBorderStyle(context, style: style, colorType: colorType),
      width: style?.buttonBorderRightStyle?.buttonBorderWidth ??
          getButtonBorderWidth(context, style: style, colorType: colorType),
      color: style?.buttonBorderRightStyle?.buttonBorderColor ??
          getButtonBorderColor(context, style: style, colorType: colorType),
    );
  }

  static BorderSide getRightStyleButtonBorderOnHover(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return BorderSide(
      style: style?.buttonBorderRightStyle?.buttonBorderStyle ??
          getButtonBorderStyle(context, style: style, colorType: colorType),
      width: style?.buttonBorderRightStyle?.buttonBorderWidth ??
          getButtonBorderWidth(context, style: style, colorType: colorType),
      color: style?.buttonBorderRightStyle?.buttonHoverBorderColor ??
          getButtonHoverBorderColor(context,
              style: style, colorType: colorType),
    );
  }

  static BorderSide getBottomStyleButtonBorder(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return BorderSide(
      style: style?.buttonBorderBottomStyle?.buttonBorderStyle ??
          getButtonBorderStyle(context, style: style, colorType: colorType),
      width: style?.buttonBorderBottomStyle?.buttonBorderWidth ??
          getButtonBorderWidth(context, style: style, colorType: colorType),
      color: style?.buttonBorderBottomStyle?.buttonBorderColor ??
          getButtonBorderColor(context, style: style, colorType: colorType),
    );
  }

  static BorderSide getBottomStyleButtonBorderOnHover(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return BorderSide(
      style: style?.buttonBorderBottomStyle?.buttonBorderStyle ??
          getButtonBorderStyle(context, style: style, colorType: colorType),
      width: style?.buttonBorderBottomStyle?.buttonBorderWidth ??
          getButtonBorderWidth(context, style: style, colorType: colorType),
      color: style?.buttonBorderBottomStyle?.buttonHoverBorderColor ??
          getButtonHoverBorderColor(context,
              style: style, colorType: colorType),
    );
  }

  static BorderSide getTopStyleButtonBorderOnHover(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return BorderSide(
      style: style?.buttonBorderTopStyle?.buttonBorderStyle ??
          getButtonBorderStyle(context, style: style, colorType: colorType),
      width: style?.buttonBorderTopStyle?.buttonBorderWidth ??
          getButtonBorderWidth(context, style: style, colorType: colorType),
      color: style?.buttonBorderTopStyle?.buttonHoverBorderColor ??
          getButtonHoverBorderColor(context,
              style: style, colorType: colorType),
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType).backgroundColor ??
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
              UpConfig.of(context).theme,
              colorType,
            ).buttonDisbaledBackgroundColor ??
            UpConstants.kDefaultStyleDisabledBackgroundColor
        : override?.buttonBackgroundColor ??
            style?.buttonBackgroundColor ??
            getStyleByType(UpConfig.of(context).theme, colorType)
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
              UpConfig.of(context).theme,
              colorType,
            ).buttonDisabledTextColor ??
            UpConstants.kDefaultStyleDisabledForegroundColor
        : override?.buttonTextColor ??
            style?.buttonTextColor ??
            getStyleByType(
              UpConfig.of(context).theme,
              colorType,
            ).buttonTextColor ??
            Theme.of(context).colorScheme.secondary;
  }

  static BorderStyle getButtonBorderStyle(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.buttonBorderStyle ??
        style?.buttonBorderStyle ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).buttonBorderStyle ??
        BorderStyle.none;
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
              UpConfig.of(context).theme,
              colorType,
            ).buttonDisabledBorderColor ??
            UpConstants.kDefaultStyleDisabledBorderColor
        : override?.buttonBorderColor ??
            style?.buttonBorderColor ??
            getStyleByType(
              UpConfig.of(context).theme,
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
        getStyleByType(UpConfig.of(context).theme, colorType)
            .buttonBorderWidth ??
        UpConstants.kDefaultStyleBorderWidth;
  }

  static double getButtonWidth(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.buttonWidth ??
        style?.buttonWidth ??
        getStyleByType(UpConfig.of(context).theme, colorType).buttonWidth ??
        UpConstants.kDefaultStyleButtonWidth;
  }

  static double getButtonHeight(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.buttonHeight ??
        style?.buttonHeight ??
        getStyleByType(UpConfig.of(context).theme, colorType).buttonHeight ??
        UpConstants.kDefaultStyleButtonHeight;
  }

  static double getButtonBorderRadius(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.buttonBorderRadius ??
        style?.buttonBorderRadius ??
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType).buttonTextSize ??
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
  //             (FlutterUpConfig.of(context).themeData ??
  //                 UpConstants.kDefaultTheme),
  //             colorType,
  //           ).buttonDisabledTextColor ??
  //           UpConstants.kDefaultStyleDisabledForegroundColor
  //       : override?.buttonTextColor ??
  //           style?.buttonTextColor ??
  //           getStyleByType(
  //             (FlutterUpConfig.of(context).themeData ??
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
              UpConfig.of(context).theme,
              colorType,
            ).checkboxCheckedDisabledColor ??
            UpConstants.kDefaultStyleDisabledBackgroundColor
        : override?.checkboxCheckedColor ??
            style?.checkboxCheckedColor ??
            getStyleByType(UpConfig.of(context).theme, colorType)
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
              UpConfig.of(context).theme,
              colorType,
            ).checkboxDisabledLabelColor ??
            UpConstants.kDefaultStyleDisabledForegroundColor
        : override?.checkboxLabelColor ??
            style?.checkboxLabelColor ??
            getStyleByType(
              UpConfig.of(context).theme,
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
              UpConfig.of(context).theme,
              colorType,
            ).checkboxDisabledBackgroundColor ??
            UpConstants.kDefaultStyleDisabledBorderColor
        : override?.checkboxBorderColor ??
            style?.checkboxBorderColor ??
            getStyleByType(
              UpConfig.of(context).theme,
              colorType,
            ).checkboxBorderColor ??
            Theme.of(context).primaryColor.withAlpha(64);
  }

  static Image? getbuttonBackgroundImage(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.buttonBackgroundImage ?? style?.buttonBackgroundImage;
  }

  static double getcheckboxBorderWidth(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.checkboxBorderWidth ??
        style?.checkboxBorderWidth ??
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
            getStyleByType(UpConfig.of(context).theme, colorType)
                .checkboxDisabledBackgroundColor ??
            UpConstants.kDefaultStyleDisabledBackgroundColor
        : override?.checkboxBackgroundColor ??
            style?.checkboxBackgroundColor ??
            getStyleByType(UpConfig.of(context).theme, colorType)
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
              UpConfig.of(context).theme,
              colorType,
            ).radioButtonDisabledFilledColor ??
            UpConstants.kDefaultStyleDisabledBackgroundColor
        : override?.radioButtonFilledColor ??
            style?.radioButtonFilledColor ??
            getStyleByType(UpConfig.of(context).theme, colorType)
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
              UpConfig.of(context).theme,
              colorType,
            ).radioButtonDisabledLabelColor ??
            UpConstants.kDefaultStyleDisabledForegroundColor
        : override?.radioButtonBorderColor ??
            style?.radioButtonBorderColor ??
            getStyleByType(
              UpConfig.of(context).theme,
              colorType,
            ).radioButtonBorderColor ??
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
              UpConfig.of(context).theme,
              colorType,
            ).radioButtonDisabledBorderColor ??
            UpConstants.kDefaultStyleDisabledBorderColor
        : override?.radioButtonBorderColor ??
            style?.radioButtonBorderColor ??
            getStyleByType(
              UpConfig.of(context).theme,
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
          UpConfig.of(context).theme,
          colorType,
        ).textfieldBorderColor ??
        Theme.of(context).primaryColor.withAlpha(64);
  }

  static Color getTextfieldCursorColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.textfieldCursorColor ??
        style?.textfieldCursorColor ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).textfieldCursorColor ??
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
          UpConfig.of(context).theme,
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
          UpConfig.of(context).theme,
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
          UpConfig.of(context).theme,
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
          UpConfig.of(context).theme,
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
          UpConfig.of(context).theme,
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
          UpConfig.of(context).theme,
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
          UpConfig.of(context).theme,
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
        getStyleByType(UpConfig.of(context).theme, colorType)
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
          UpConfig.of(context).theme,
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
          UpConfig.of(context).theme,
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
        getStyleByType(UpConfig.of(context).theme, colorType).appBarTitleSize ??
        UpConstants.kDefaultStyleTextSize;
  }

  // date picker
  static ThemeData getDatePickerThemeData(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return ThemeData(
      colorScheme: ColorScheme(
        onBackground: Colors.transparent,
        background: Colors.transparent,
        onError: Colors.pink,
        error: Colors.red,
        onSecondary: Colors.transparent,
        secondary: Colors.transparent,
        brightness: Brightness.dark,
        primary: getDatePickerPrimaryColor(
          context,
          style: style,
          colorType: colorType,
        ),
        onPrimary: getDatePickerOnPrimaryColor(
          context,
          style: style,
          colorType: colorType,
        ),
        surface: getDatePickerSurfaceColor(
          context,
          style: style,
          colorType: colorType,
        ),
        onSurface: getDatePickerOnSurfaceColor(
          context,
          style: style,
          colorType: colorType,
        ),
      ),
      dialogBackgroundColor: getDatePickerDialogBackgroundColor(
        context,
        style: style,
        colorType: colorType,
      ),
    );
  }

  static Color getDatePickerPrimaryColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.datePickerPrimaryColor ??
        style?.datePickerPrimaryColor ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).datePickerPrimaryColor ??
        Theme.of(context).colorScheme.primary;
  }

  static Color getDatePickerOnPrimaryColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.datePickerOnPrimaryColor ??
        style?.datePickerOnPrimaryColor ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).datePickerOnPrimaryColor ??
        Theme.of(context).colorScheme.primary;
  }

  static Color getDatePickerSurfaceColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.datePickerSurfaceColor ??
        style?.datePickerSurfaceColor ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).datePickerSurfaceColor ??
        Theme.of(context).colorScheme.primary;
  }

  static Color getDatePickerOnSurfaceColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.datePickerOnSurfaceColor ??
        style?.datePickerOnSurfaceColor ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).datePickerOnSurfaceColor ??
        Theme.of(context).colorScheme.primary;
  }

  static Color getDatePickerDialogBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.datePickerDialogBackgroundColor ??
        style?.datePickerDialogBackgroundColor ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).datePickerDialogBackgroundColor ??
        Theme.of(context).colorScheme.primary;
  }

  // time picker
  static ThemeData getTimePickerThemeData(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return ThemeData(
        colorScheme: ColorScheme(
          onBackground: Colors.transparent,
          background: Colors.transparent,
          onError: Colors.pink,
          error: Colors.red,
          onSecondary: Colors.transparent,
          secondary: Colors.transparent,
          brightness: Brightness.dark,
          primary: getTimePickerPrimaryColor(
            context,
            style: style,
            colorType: colorType,
          ),
          onPrimary: getTimePickerOnPrimaryColor(
            context,
            style: style,
            colorType: colorType,
          ),
          surface: getTimePickerSurfaceColor(
            context,
            style: style,
            colorType: colorType,
          ),
          onSurface: getTimePickerOnSurfaceColor(
            context,
            style: style,
            colorType: colorType,
          ),
        ),
        dialogBackgroundColor: getTimePickerDialogBackgroundColor(
          context,
          style: style,
          colorType: colorType,
        ));
  }

  static Color getTimePickerPrimaryColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.timePickerPrimaryColor ??
        style?.timePickerPrimaryColor ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).timePickerPrimaryColor ??
        Theme.of(context).colorScheme.primary;
  }

  static Color getTimePickerOnPrimaryColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.timePickerOnPrimaryColor ??
        style?.timePickerOnPrimaryColor ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).timePickerOnPrimaryColor ??
        Theme.of(context).colorScheme.primary;
  }

  static Color getTimePickerSurfaceColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.timePickerSurfaceColor ??
        style?.timePickerSurfaceColor ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).timePickerSurfaceColor ??
        Theme.of(context).colorScheme.primary;
  }

  static Color getTimePickerOnSurfaceColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.timePickerOnSurfaceColor ??
        style?.timePickerOnSurfaceColor ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).timePickerOnSurfaceColor ??
        Theme.of(context).colorScheme.primary;
  }

  static Color getTimePickerDialogBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.timePickerDialogBackgroundColor ??
        style?.timePickerDialogBackgroundColor ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).timePickerDialogBackgroundColor ??
        Theme.of(context).colorScheme.primary;
  }

  static Color getCircularProgressBarColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.circularProgressBarColor ??
        style?.circularProgressBarColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .circularProgressBarColor ??
        UpConfig.of(context).theme.primaryColor;
  }

  static Gradient getToastBackgroundGradient(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.toastBackgroundGradient ??
        style?.toastBackgroundGradient ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .toastBackgroundGradient ??
        const LinearGradient(colors: [Colors.red, Colors.blue]);
  }

  static Color getToastBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.toastBackgroundColor ??
        style?.toastBackgroundColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .toastBackgroundColor ??
        Theme.of(context).primaryColor;
  }

  static Color getToastTextColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.toastTextColor ??
        style?.toastTextColor ??
        getStyleByType(UpConfig.of(context).theme, colorType).toastTextColor ??
        Theme.of(context).colorScheme.secondary;
  }

  //text styles
  static double getTextSize(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
    UpTextType? textType,
  }) {
    switch (textType) {
      case UpTextType.heading1:
        return override?.heading1Size ??
            style?.heading1Size ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .heading1Size ??
            UpConstants.kDefaultStyleHeading1Size;
      case UpTextType.heading2:
        return override?.heading2Size ??
            style?.heading2Size ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .heading2Size ??
            UpConstants.kDefaultStyleHeading2Size;
      case UpTextType.heading3:
        return override?.heading3Size ??
            style?.heading3Size ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .heading3Size ??
            UpConstants.kDefaultStyleHeading3Size;
      case UpTextType.heading4:
        return override?.heading4Size ??
            style?.heading4Size ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .heading4Size ??
            UpConstants.kDefaultStyleHeading4Size;
      case UpTextType.heading5:
        return override?.heading5Size ??
            style?.heading5Size ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .heading5Size ??
            UpConstants.kDefaultStyleHeading5Size;
      case UpTextType.heading6:
        return override?.heading6Size ??
            style?.heading6Size ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .heading6Size ??
            UpConstants.kDefaultStyleHeading6Size;
      case UpTextType.paragraph:
        return override?.paragraphSize ??
            style?.paragraphSize ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .paragraphSize ??
            UpConstants.kDefaultStyleParagrahSize;

      default:
        return override?.textSize ??
            style?.textSize ??
            getStyleByType(UpConfig.of(context).theme, colorType).textSize ??
            UpConstants.kDefaultStyleDefaultTextSize;
    }
  }

  // text

  static double getTextStrokeWidth(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.textStrokeWidth ??
        style?.textStrokeWidth ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).textStrokeWidth ??
        UpConstants.kDefaultStyleTextStrokeWidth;
  }

  static Color getTextStrokeColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.textStrokeColor ??
        style?.textStrokeColor ??
        getStyleByType(
          UpConfig.of(context).theme,
          colorType,
        ).textStrokeColor ??
        Colors.transparent;
  }

  static Color getTextColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.textColor ??
        style?.textColor ??
        getStyleByType(UpConfig.of(context).theme, colorType).textColor ??
        Theme.of(context).primaryColor;
  }

  static Color getTextBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.textBackgroundColor ??
        style?.textBackgroundColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .textBackgroundColor ??
        Colors.transparent;
  }

  static FontStyle? getTextFontStyle(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.textFontStyle ??
        style?.textFontStyle ??
        getStyleByType(UpConfig.of(context).theme, colorType).textFontStyle;
  }

  static FontWeight? getTextFontWeight(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
    UpTextType? textType,
  }) {
    switch (textType) {
      case UpTextType.heading1:
        return override?.heading1Weight ??
            style?.heading1Weight ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .heading1Weight ??
            UpConstants.kDefaultStyleHeading1Weight;
      case UpTextType.heading2:
        return override?.heading2Weight ??
            style?.heading2Weight ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .heading2Weight ??
            UpConstants.kDefaultStyleHeading2Weight;
      case UpTextType.heading3:
        return override?.heading3Weight ??
            style?.heading3Weight ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .heading3Weight ??
            UpConstants.kDefaultStyleHeading3Weight;
      case UpTextType.heading4:
        return override?.heading4Weight ??
            style?.heading4Weight ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .heading4Weight ??
            UpConstants.kDefaultStyleHeading4Weight;
      case UpTextType.heading5:
        return override?.heading5Weight ??
            style?.heading5Weight ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .heading5Weight ??
            UpConstants.kDefaultStyleHeading5Weight;
      case UpTextType.heading6:
        return override?.heading6Weight ??
            style?.heading6Weight ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .heading6Weight ??
            UpConstants.kDefaultStyleHeading6Weight;
      case UpTextType.paragraph:
        return override?.paragraphWeight ??
            style?.paragraphWeight ??
            getStyleByType(UpConfig.of(context).theme, colorType)
                .paragraphWeight ??
            UpConstants.kDefaultStyleParagraphWeight;

      default:
        return override?.textWeight ??
            style?.textWeight ??
            getStyleByType(UpConfig.of(context).theme, colorType).textWeight ??
            UpConstants.kDefaultStyleDefaultTextWeight;
    }
  }

  static double getImageButtonWidth(BuildContext context,
      {UpStyle? override,
      UpStyle? style,
      UpColorType? colorType,
      double? imageWidth}) {
    return override?.buttonWidth ??
        style?.buttonWidth ??
        imageWidth ??
        getStyleByType(UpConfig.of(context).theme, colorType).buttonWidth ??
        UpConstants.kDefaultStyleButtonWidth;
  }

  static double getImageButtonHeight(BuildContext context,
      {UpStyle? override,
      UpStyle? style,
      UpColorType? colorType,
      double? imageHeight}) {
    return override?.buttonHeight ??
        style?.buttonHeight ??
        imageHeight ??
        getStyleByType(UpConfig.of(context).theme, colorType).buttonHeight ??
        UpConstants.kDefaultStyleButtonHeight;
  }

  static Color getExpansionTileBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.expansionTileBackgroundColor ??
        style?.expansionTileBackgroundColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .expansionTileBackgroundColor ??
        Colors.transparent;
  }

  static Color getExpansionTileCollapsedBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.expansionTileCollapsedBackgroundColor ??
        style?.expansionTileCollapsedBackgroundColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .expansionTileCollapsedBackgroundColor ??
        Colors.transparent;
  }

  static Color getExpansionTileCollapsedIconColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.expansionTileCollapsedIconColor ??
        style?.expansionTileCollapsedIconColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .expansionTileCollapsedIconColor ??
        Theme.of(context).primaryColor;
  }

  static Color getExpansionTileIconColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.expansionTileIconColor ??
        style?.expansionTileIconColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .expansionTileIconColor ??
        Theme.of(context).primaryColor;
  }

  static Color getExpansionTileTextColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.expansionTileTextColor ??
        style?.expansionTileTextColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .expansionTileTextColor ??
        Theme.of(context).primaryColor;
  }

  static Color getExpansionTileCollapsedTextColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.expansionTileCollapsedTextColor ??
        style?.expansionTileCollapsedTextColor ??
        getStyleByType(UpConfig.of(context).theme, colorType)
            .expansionTileCollapsedTextColor ??
        Theme.of(context).primaryColor;
  }

  static bool isButtonBorderUniform(
    UpStyle? style,
  ) {
    return style?.buttonBorderLeftStyle != null ||
            style?.buttonBorderRightStyle != null ||
            style?.buttonBorderTopStyle != null ||
            style?.buttonBorderBottomStyle != null
        ? false
        : true;
  }

  static BoxBorder getButtonBorder(BuildContext context,
      {UpStyle? override,
      UpStyle? style,
      UpColorType? colorType,
      bool isHovered = false}) {
    return UpStyle.isButtonBorderUniform(style)
        ? Border.all(
            color: isHovered
                ? UpStyle.getButtonHoverBorderColor(context,
                    colorType: colorType, style: style)
                : UpStyle.getButtonBorderColor(context,
                    colorType: colorType, style: style),
            width: getButtonBorderWidth(context,
                style: style, colorType: colorType),
            style: getButtonBorderStyle(context,
                colorType: colorType, style: style))
        : Border(
            top: isHovered
                ? UpStyle.getTopStyleButtonBorderOnHover(context,
                    colorType: colorType, style: style)
                : UpStyle.getTopStyleButtonBorder(context,
                    colorType: colorType, style: style),
            bottom: isHovered
                ? UpStyle.getBottomStyleButtonBorderOnHover(context,
                    colorType: colorType, style: style)
                : UpStyle.getBottomStyleButtonBorder(context,
                    colorType: colorType, style: style),
            left: isHovered
                ? UpStyle.getLeftStyleButtonBorderOnHover(context,
                    colorType: colorType, style: style)
                : UpStyle.getLeftStyleButtonBorder(context,
                    colorType: colorType, style: style),
            right: isHovered
                ? UpStyle.getRightStyleButtonBorderOnHover(context,
                    colorType: colorType, style: style)
                : UpStyle.getRightStyleButtonBorder(context,
                    colorType: colorType, style: style),
          );
  }
}
