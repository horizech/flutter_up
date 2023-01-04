import 'package:flutter/material.dart';
import 'package:flutter_up/config/flutter_up_config.dart';
import 'package:flutter_up/contants.dart';
import 'package:flutter_up/enums/up_button_type.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/themes/up_themes.dart';

class UpButton extends StatelessWidget {
  final Function onPress;
  final Widget child;
  final UpColorType? colorType;
  final UpButtonType buttonType;
  final UpStyle? styles;
  final String? text;

  const UpButton(
      {Key? key,
      this.text,
      required this.onPress,
      required this.child,
      this.colorType,
      this.buttonType = UpButtonType.elevated,
      this.styles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case UpButtonType.text:
        return TextButton(
          onPressed: () {
            if (!(styles?.isDisabled ?? false)) onPress();
          },
          style: UpStyle.getButtonStyle(context,
              styles: styles, colorType: colorType),
          child: child,
        );
      case UpButtonType.icon:
        return IconButton(
          onPressed: () {
            if (!(styles?.isDisabled ?? false)) onPress();
          },
          icon: child,
          style: UpStyle.getButtonStyle(context,
              styles: styles, colorType: colorType),
        );
      case UpButtonType.outlined:
        return OutlinedButton(
          onPressed: () {
            if (!(styles?.isDisabled ?? false)) onPress();
          },
          style: UpStyle.getButtonStyle(context,
              styles: styles, colorType: colorType),
          child: child,
        );
      case UpButtonType.floating:
        return FloatingActionButton(
          onPressed: () {
            if (!(styles?.isDisabled ?? false)) onPress();
          },
          backgroundColor: UpStyle.getBackgroundColor(context,
              styles: styles, colorType: colorType),
          foregroundColor: UpStyle.getForegroundColor(context,
              styles: styles, colorType: colorType),
          shape: UpStyle.getRoundedRectangleBorder(context,
              styles: styles, colorType: colorType),
          child: child,
        );
      case UpButtonType.elevated:
      default:
        return _upButton(
          child: child,
          colorType: colorType,
          styles: styles,
          text: text,
          isDisabled: styles?.isDisabled ?? false,
          onPressed: onPress,
        );
        return ElevatedButton(
          onPressed: () {
            if (!(styles?.isDisabled ?? false)) onPress();
          },
          style: UpStyle.getButtonStyle(context,
              styles: styles, colorType: colorType),
          child: child,
        );
    }
  }
}

class _upButton extends StatefulWidget {
  const _upButton({
    required this.child,
    this.styles,
    this.colorType,
    this.text,
    this.isDisabled = false,
    this.onPressed,
  });
  final Widget child;
  final bool isDisabled;
  final UpStyle? styles;
  final UpColorType? colorType;
  final String? text;
  final Function? onPressed;

  @override
  State<_upButton> createState() => __upButtonState();
}

class __upButtonState extends State<_upButton> {
  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  bool isHovered = false;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      isHovered = true;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      isHovered = false;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      isHovered = true;
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(const Size(320.0, 48.0)),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: _incrementEnter,
        // onHover: _updateLocation,
        onExit: _incrementExit,
        child: GestureDetector(
          onTap: () {
            if (!widget.isDisabled && widget.onPressed != null) {
              widget.onPressed!();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: isHovered
                  ? UpStyle.getHoverBackgroundColor(context,
                      styles: widget.styles, colorType: widget.colorType)
                  : UpStyle.getBackgroundColor(context,
                      styles: widget.styles, colorType: widget.colorType),
              border: Border.all(
                style: BorderStyle.solid,
                color: isHovered
                    ? UpStyle.getHoverBorderColor(context,
                        styles: widget.styles, colorType: widget.colorType)
                    : UpStyle.getBorderColor(context,
                        styles: widget.styles, colorType: widget.colorType),
                width: UpStyle.getBorderWidth(context,
                    styles: widget.styles, colorType: widget.colorType),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  UpStyle.getBorderRadius(context,
                      styles: widget.styles, colorType: widget.colorType),
                ), //                 <--- border radius here
              ),
              boxShadow: isHovered
                  ? <BoxShadow>[
                      BoxShadow(
                        color: UpStyle.getBackgroundColor(context,
                                styles: widget.styles,
                                colorType: widget.colorType)
                            .withOpacity(0.2), // 0.1
                        blurRadius: 4, //1
                        offset: const Offset(0, 4), // 0,2
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.text ?? "",
                  style: TextStyle(
                    color: isHovered
                        ? UpStyle.getHoverForegroundColor(context,
                            styles: widget.styles, colorType: widget.colorType)
                        : UpStyle.getForegroundColor(
                            context,
                            styles: widget.styles,
                            colorType: widget.colorType,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
