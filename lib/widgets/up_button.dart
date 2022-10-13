import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_button_type.dart';
import 'package:flutter_up/enums/up_color_type.dart';

class UpButton extends StatelessWidget {
  final Function onPress;
  final Widget child;
  final ColorType? colorType;
  final bool? isButtonDisable;
  final bool isRounded;
  final double roundedBorderRadius;
  final UpButtonType buttonType;
  const UpButton({
    Key? key,
    required this.onPress,
    required this.child,
    this.colorType,
    this.isButtonDisable = false,
    this.isRounded = false,
    this.buttonType = UpButtonType.elevated,
    this.roundedBorderRadius = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttonType == UpButtonType.elevated
        ? _upElevatedButton(context, onPress, child, colorType, isButtonDisable,
            isRounded, roundedBorderRadius)
        : buttonType == UpButtonType.text
            ? _upTextButton(context, onPress, child, colorType, isButtonDisable,
                isRounded, roundedBorderRadius)
            : buttonType == UpButtonType.icon
                ? _upIconButton(context, onPress, child, colorType,
                    isButtonDisable, isRounded, roundedBorderRadius)
                : buttonType == UpButtonType.outlined
                    ? _upOutlinedButton(context, onPress, child, colorType,
                        isButtonDisable, isRounded, roundedBorderRadius)
                    : buttonType == UpButtonType.floating
                        ? _upFloatingButton(context, onPress, child, colorType,
                            isButtonDisable, isRounded, roundedBorderRadius)
                        : _upElevatedButton(context, onPress, child, colorType,
                            isButtonDisable, isRounded, roundedBorderRadius);
  }
}

Widget _upElevatedButton(
  BuildContext context,
  Function onPress,
  Widget child,
  ColorType? colorType,
  bool? isButtonDisable,
  bool isRounded,
  double roundedBorderRadius,
) {
  return isButtonDisable == true
      ? ElevatedButton(onPressed: null, child: child)
      : ElevatedButton(
          style: ButtonStyle(
            backgroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).backgroundColor)
                : MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
            foregroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).foregroundColor)
                : MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.secondary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: isRounded
                    ? BorderRadius.circular(roundedBorderRadius)
                    : BorderRadius.zero,
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
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
  ColorType? colorType,
  bool? isButtonDisable,
  bool isRounded,
  double roundedBorderRadius,
) {
  return isButtonDisable == true
      ? TextButton(onPressed: null, child: child)
      : TextButton(
          style: ButtonStyle(
            backgroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).backgroundColor)
                : MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
            foregroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).foregroundColor)
                : MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.secondary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: isRounded
                    ? BorderRadius.circular(roundedBorderRadius)
                    : BorderRadius.zero,
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
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
  ColorType? colorType,
  bool? isButtonDisable,
  bool isRounded,
  double roundedBorderRadius,
) {
  return isButtonDisable == true
      ? IconButton(onPressed: null, icon: child)
      : IconButton(
          style: ButtonStyle(
            backgroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).backgroundColor)
                : MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
            foregroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).foregroundColor)
                : MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.secondary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: isRounded
                    ? BorderRadius.circular(roundedBorderRadius)
                    : BorderRadius.zero,
                side: BorderSide(color: Theme.of(context).primaryColor),
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
  ColorType? colorType,
  bool? isButtonDisable,
  bool isRounded,
  double roundedBorderRadius,
) {
  return isButtonDisable == true
      ? OutlinedButton(onPressed: null, child: child)
      : OutlinedButton(
          style: ButtonStyle(
            backgroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).backgroundColor)
                : MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
            foregroundColor: colorType != null
                ? MaterialStateProperty.all<Color>(
                    getColorsFromType(colorType).foregroundColor)
                : MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.secondary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: isRounded
                    ? BorderRadius.circular(roundedBorderRadius)
                    : BorderRadius.zero,
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
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
  ColorType? colorType,
  bool? isButtonDisable,
  bool isRounded,
  double roundedBorderRadius,
) {
  return isButtonDisable == true
      ? FloatingActionButton(onPressed: null, child: child)
      : FloatingActionButton(
          backgroundColor: colorType != null
              ? getColorsFromType(colorType).backgroundColor
              : Theme.of(context).primaryColor,
          foregroundColor: colorType != null
              ? getColorsFromType(colorType).foregroundColor
              : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: isRounded
                ? BorderRadius.circular(roundedBorderRadius)
                : BorderRadius.zero,
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            onPress();
          },
          child: child,
        );
}
