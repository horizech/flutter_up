import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_button_type.dart';
import 'package:flutter_up/enums/up_color_type.dart';

class UpButton extends StatelessWidget {
  final Function onPress;
  final Widget child;
  final UpColorType? colorType;
  final bool? isButtonDisable;
  final bool isRounded;
  final double roundedBorderRadius;
  final UpButtonType buttonType;
  final Color borderColor;
  final double borderWidth;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const UpButton({
    Key? key,
    required this.onPress,
    required this.child,
    this.colorType,
    this.isButtonDisable = false,
    this.isRounded = false,
    this.buttonType = UpButtonType.elevated,
    this.roundedBorderRadius = 18,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttonType == UpButtonType.elevated
        ? _upElevatedButton(
            context,
            onPress,
            child,
            colorType,
            isButtonDisable,
            isRounded,
            roundedBorderRadius,
            borderColor,
            borderWidth,
            backgroundColor,
            foregroundColor,
          )
        : buttonType == UpButtonType.text
            ? _upTextButton(
                context,
                onPress,
                child,
                colorType,
                isButtonDisable,
                isRounded,
                roundedBorderRadius,
                borderColor,
                borderWidth,
                backgroundColor,
                foregroundColor,
              )
            : buttonType == UpButtonType.icon
                ? _upIconButton(
                    context,
                    onPress,
                    child,
                    colorType,
                    isButtonDisable,
                    isRounded,
                    roundedBorderRadius,
                    borderColor,
                    borderWidth,
                    backgroundColor,
                    foregroundColor,
                  )
                : buttonType == UpButtonType.outlined
                    ? _upOutlinedButton(
                        context,
                        onPress,
                        child,
                        colorType,
                        isButtonDisable,
                        isRounded,
                        roundedBorderRadius,
                        borderColor,
                        borderWidth,
                        backgroundColor,
                        foregroundColor,
                      )
                    : buttonType == UpButtonType.floating
                        ? _upFloatingButton(
                            context,
                            onPress,
                            child,
                            colorType,
                            isButtonDisable,
                            isRounded,
                            roundedBorderRadius,
                            borderColor,
                            borderWidth,
                            backgroundColor,
                            foregroundColor,
                          )
                        : _upElevatedButton(
                            context,
                            onPress,
                            child,
                            colorType,
                            isButtonDisable,
                            isRounded,
                            roundedBorderRadius,
                            borderColor,
                            borderWidth,
                            backgroundColor,
                            foregroundColor,
                          );
  }
}

Widget _upElevatedButton(
  BuildContext context,
  Function onPress,
  Widget child,
  UpColorType? colorType,
  bool? isButtonDisable,
  bool isRounded,
  double roundedBorderRadius,
  Color borderColor,
  double borderWidth,
  Color? backgroundColor,
  Color? foregroundColor,
) {
  return isButtonDisable == true
      ? ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: isRounded
                    ? BorderRadius.circular(roundedBorderRadius)
                    : BorderRadius.zero,
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
          child: child,
        )
      : ElevatedButton(
          style: ButtonStyle(
            backgroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).backgroundColor)
                : backgroundColor != null
                    ? MaterialStateProperty.all<Color>(backgroundColor)
                    : MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
                      ),
            foregroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).foregroundColor)
                : foregroundColor != null
                    ? MaterialStateProperty.all<Color>(foregroundColor)
                    : MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.secondary,
                      ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: isRounded
                    ? BorderRadius.circular(roundedBorderRadius)
                    : BorderRadius.zero,
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
          onPressed: () {
            onPress();
          },
          child: child,
        );
}

Widget _upTextButton(
  BuildContext context,
  Function onPress,
  Widget child,
  UpColorType? colorType,
  bool? isButtonDisable,
  bool isRounded,
  double roundedBorderRadius,
  Color borderColor,
  double borderWidth,
  Color? backgroundColor,
  Color? foregroundColor,
) {
  return isButtonDisable == true
      ? TextButton(
          onPressed: null,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: isRounded
                    ? BorderRadius.circular(roundedBorderRadius)
                    : BorderRadius.zero,
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
          child: child,
        )
      : TextButton(
          style: ButtonStyle(
            backgroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).backgroundColor)
                : backgroundColor != null
                    ? MaterialStateProperty.all<Color>(backgroundColor)
                    : MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
                      ),
            foregroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).foregroundColor)
                : foregroundColor != null
                    ? MaterialStateProperty.all<Color>(foregroundColor)
                    : MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.secondary,
                      ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: isRounded
                    ? BorderRadius.circular(roundedBorderRadius)
                    : BorderRadius.zero,
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
          onPressed: () {
            onPress();
          },
          child: child,
        );
}

Widget _upIconButton(
  BuildContext context,
  Function onPress,
  Widget child,
  UpColorType? colorType,
  bool? isButtonDisable,
  bool isRounded,
  double roundedBorderRadius,
  Color borderColor,
  double borderWidth,
  Color? backgroundColor,
  Color? foregroundColor,
) {
  return isButtonDisable == true
      ? IconButton(
          onPressed: null,
          icon: child,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: isRounded
                    ? BorderRadius.circular(roundedBorderRadius)
                    : BorderRadius.zero,
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
        )
      : IconButton(
          style: ButtonStyle(
            backgroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).backgroundColor)
                : backgroundColor != null
                    ? MaterialStateProperty.all<Color>(backgroundColor)
                    : MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
            foregroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).foregroundColor)
                : foregroundColor != null
                    ? MaterialStateProperty.all<Color>(foregroundColor)
                    : MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.secondary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: isRounded
                    ? BorderRadius.circular(roundedBorderRadius)
                    : BorderRadius.zero,
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
          onPressed: () {
            onPress();
          },
          icon: child,
        );
}

Widget _upOutlinedButton(
  BuildContext context,
  Function onPress,
  Widget child,
  UpColorType? colorType,
  bool? isButtonDisable,
  bool isRounded,
  double roundedBorderRadius,
  Color borderColor,
  double borderWidth,
  Color? backgroundColor,
  Color? foregroundColor,
) {
  return isButtonDisable == true
      ? OutlinedButton(
          onPressed: null,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: isRounded
                    ? BorderRadius.circular(roundedBorderRadius)
                    : BorderRadius.zero,
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
          child: child,
        )
      : OutlinedButton(
          style: ButtonStyle(
            backgroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).backgroundColor)
                : backgroundColor != null
                    ? MaterialStateProperty.all<Color>(backgroundColor)
                    : MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor,
                      ),
            foregroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).foregroundColor)
                : foregroundColor != null
                    ? MaterialStateProperty.all<Color>(foregroundColor)
                    : MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.secondary,
                      ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: isRounded
                    ? BorderRadius.circular(roundedBorderRadius)
                    : BorderRadius.zero,
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
            ),
          ),
          onPressed: () {
            onPress();
          },
          child: child,
        );
}

Widget _upFloatingButton(
  BuildContext context,
  Function onPress,
  Widget child,
  UpColorType? colorType,
  bool? isButtonDisable,
  bool isRounded,
  double roundedBorderRadius,
  Color borderColor,
  double borderWidth,
  Color? backgroundColor,
  Color? foregroundColor,
) {
  return isButtonDisable == true
      ? FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.grey[400],
          shape: RoundedRectangleBorder(
            borderRadius: isRounded
                ? BorderRadius.circular(roundedBorderRadius)
                : BorderRadius.zero,
            side: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          child: child,
        )
      : FloatingActionButton(
          backgroundColor: colorType != null
              ? getColorsFromType(colorType).backgroundColor
              : backgroundColor ?? Theme.of(context).primaryColor,
          foregroundColor: colorType != null
              ? getColorsFromType(colorType).foregroundColor
              : foregroundColor ?? Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: isRounded
                ? BorderRadius.circular(roundedBorderRadius)
                : BorderRadius.zero,
            side: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          onPressed: () {
            onPress();
          },
          child: child,
        );
}
