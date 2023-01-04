import 'package:flutter/material.dart';
import 'package:flutter_up/config/flutter_up_config.dart';
import 'package:flutter_up/contants.dart';
import 'package:flutter_up/enums/up_color_type.dart';

class UpStyle {
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final Color? foregroundColor;

  final Color? hoverBackgroundColor;
  final Color? hoverBorderColor;
  final Color? hoverForegroundColor;

  final bool? isDisabled;
  final bool? isRounded;

  UpStyle({
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.foregroundColor,
    this.hoverBackgroundColor,
    this.hoverBorderColor,
    this.hoverForegroundColor,
    this.isDisabled,
    this.isRounded,
    this.borderRadius,
  });

  static Color getBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? styles,
    UpColorType? colorType,
  }) {
    return override?.backgroundColor ??
        styles?.backgroundColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .backgroundColor ??
        Theme.of(context).primaryColor;
  }

  static Color getForegroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? styles,
    UpColorType? colorType,
  }) {
    return override?.foregroundColor ??
        styles?.foregroundColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .foregroundColor ??
        Theme.of(context).colorScheme.secondary;
  }

  static Color getBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? styles,
    UpColorType? colorType,
  }) {
    return override?.borderColor ??
        styles?.borderColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .borderColor ??
        Theme.of(context).primaryColor.withAlpha(64);
  }

  static double getBorderWidth(
    BuildContext context, {
    UpStyle? override,
    UpStyle? styles,
    UpColorType? colorType,
  }) {
    return override?.borderWidth ??
        styles?.borderWidth ??
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
    UpStyle? styles,
    UpColorType? colorType,
  }) {
    return override?.borderRadius ??
        styles?.borderRadius ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .borderRadius ??
        UpConstants.kDefaultStyleBorderRadius;
  }

  static RoundedRectangleBorder getRoundedRectangleBorder(
    BuildContext context, {
    UpStyle? override,
    UpStyle? styles,
    UpColorType? colorType,
  }) {
    return RoundedRectangleBorder(
      borderRadius: override?.isRounded ??
              styles?.isRounded ??
              getStyleByType(
                      (FlutterUpConfig.of(context)?.themeData ??
                          UpConstants.kDefaultTheme),
                      colorType)
                  .isRounded ??
              UpConstants.kDefaultStyleIsRounded
          ? BorderRadius.circular(override?.borderRadius ??
              styles?.borderRadius ??
              getStyleByType(
                      (FlutterUpConfig.of(context)?.themeData ??
                          UpConstants.kDefaultTheme),
                      colorType)
                  .borderRadius ??
              UpConstants.kDefaultStyleBorderRadius)
          : BorderRadius.zero,
      side: BorderSide(
        color: override?.borderColor ??
            styles?.borderColor ??
            getStyleByType(
                    (FlutterUpConfig.of(context)?.themeData ??
                        UpConstants.kDefaultTheme),
                    colorType)
                .borderColor ??
            UpConstants.kDefaultStyleBorderColor,
        width: override?.borderWidth ??
            styles?.borderWidth ??
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
    UpStyle? styles,
    UpColorType? colorType,
  }) {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            getBackgroundColor(context, styles: styles, colorType: colorType)),
        foregroundColor: MaterialStateProperty.all<Color>(
            getForegroundColor(context, styles: styles, colorType: colorType)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            getRoundedRectangleBorder(context,
                styles: styles, colorType: colorType)),
        elevation: MaterialStateProperty.all<double>(16));
  }

  static Color getHoverBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? styles,
    UpColorType? colorType,
  }) {
    return override?.hoverBackgroundColor ??
        styles?.hoverBackgroundColor ??
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
    UpStyle? styles,
    UpColorType? colorType,
  }) {
    return override?.hoverForegroundColor ??
        styles?.hoverForegroundColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .hoverForegroundColor ??
        Theme.of(context).primaryColor;
  }

  static Color getHoverBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? styles,
    UpColorType? colorType,
  }) {
    return override?.hoverBorderColor ??
        styles?.hoverBorderColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .backgroundColor ??
        Theme.of(context).primaryColor;
  }
}
