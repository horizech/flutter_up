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
  final Color? checkedBackgroundColor;
  final Color? checkedForegroundColor;
  final Color? radioButtonColor;

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
    this.checkedBackgroundColor,
    this.checkedForegroundColor,
    this.radioButtonColor,
  });

  static Color getBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.backgroundColor ??
        style?.backgroundColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .backgroundColor ??
        Theme.of(context).primaryColor;
  }

  static Color getRadioButtonColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.radioButtonColor ??
        style?.radioButtonColor ??
        getStyleByType(
                (FlutterUpConfig.of(context)?.themeData ??
                    UpConstants.kDefaultTheme),
                colorType)
            .radioButtonColor ??
        style?.foregroundColor ??
        Theme.of(context).primaryColor;
  }

  static Color getForegroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.foregroundColor ??
        style?.foregroundColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
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
    return override?.borderColor ??
        style?.borderColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).borderColor ??
        Theme.of(context).primaryColor.withAlpha(64);
  }

  static Color getFocusedBorderColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.focusedBorderColor ??
        style?.focusedBorderColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).focusedBorderColor ??
        style?.borderColor ??
        style?.foregroundColor ??
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

  static Color getCheckBackgroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.checkedBackgroundColor ??
        style?.checkedBackgroundColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).checkedBackgroundColor ??
        style?.backgroundColor ??
        Theme.of(context).primaryColor;
  }

  static Color getCheckedForegroundColor(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return override?.checkedForegroundColor ??
        style?.checkedForegroundColor ??
        getStyleByType(
          (FlutterUpConfig.of(context)?.themeData ?? UpConstants.kDefaultTheme),
          colorType,
        ).checkedForegroundColor ??
        style?.foregroundColor ??
        Theme.of(context).colorScheme.secondary;
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
        getBackgroundColor(context, style: style, colorType: colorType),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        getForegroundColor(context, style: style, colorType: colorType),
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

  static InputBorder? getBorderStyle(
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
                ? getFocusedBorderColor(
                    context,
                    colorType: colorType,
                    style: style,
                  )
                : isError
                    ? getErrorBorderColor(
                        context,
                        colorType: colorType,
                        style: style,
                      )
                    : getBorderColor(
                        context,
                        colorType: colorType,
                        style: style,
                      ),
            width: getBorderWidth(
              context,
              colorType: colorType,
              style: style,
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              UpStyle.getBorderRadius(
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
                ? getFocusedBorderColor(
                    context,
                    colorType: colorType,
                    style: style,
                  )
                : isError
                    ? getErrorBorderColor(
                        context,
                        colorType: colorType,
                        style: style,
                      )
                    : getBorderColor(
                        context,
                        colorType: colorType,
                        style: style,
                      ),
            width: getBorderWidth(
              context,
              colorType: colorType,
              style: style,
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              UpStyle.getBorderRadius(
                context,
                style: style,
                colorType: colorType,
              ),
            ),
          ),
        );
    }
  }

  static InputDecoration getTextFieldStyle(
    BuildContext context, {
    UpStyle? override,
    UpStyle? style,
    UpColorType? colorType,
  }) {
    return const InputDecoration();
  }
}
