import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_button_type.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpButton extends StatelessWidget {
  final Function onPressed;
  final Widget? child;
  final UpColorType? colorType;
  final UpButtonType type;
  final UpStyle? style;
  final String? text;

  const UpButton({
    Key? key,
    this.text,
    required this.onPressed,
    this.child,
    this.colorType,
    this.type = UpButtonType.elevated,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case UpButtonType.text:
        return TextButton(
          onPressed: () {
            if (!(style?.isDisabled ?? false)) onPressed();
          },
          style: UpStyle.getButtonStyle(context,
              style: style, colorType: colorType),
          child: child ?? Text(text ?? ""),
        );
      case UpButtonType.icon:
        return IconButton(
          onPressed: () {
            if (!(style?.isDisabled ?? false)) onPressed();
          },
          icon: child ?? Text(text ?? ""),
          style: UpStyle.getButtonStyle(context,
              style: style, colorType: colorType),
        );
      case UpButtonType.outlined:
        return OutlinedButton(
          onPressed: () {
            if (!(style?.isDisabled ?? false)) onPressed();
          },
          style: UpStyle.getButtonStyle(context,
              style: style, colorType: colorType),
          child: child ?? Text(text ?? ""),
        );
      case UpButtonType.floating:
        return FloatingActionButton(
          onPressed: () {
            if (!(style?.isDisabled ?? false)) onPressed();
          },
          backgroundColor: UpStyle.getBackgroundColor(context,
              style: style, colorType: colorType),
          foregroundColor: UpStyle.getForegroundColor(context,
              style: style, colorType: colorType),
          shape: UpStyle.getRoundedRectangleBorder(context,
              style: style, colorType: colorType),
          child: child,
        );
      case UpButtonType.image:
        return _upImageButton(
          style: style,
          text: text,
          colorType: colorType,
          isDisabled: style?.isDisabled ?? false,
          onPressed: () {
            if (!(style?.isDisabled ?? false)) onPressed();
          },
        );
      case UpButtonType.elevated:
      default:
        return _upButton(
          colorType: colorType,
          style: style,
          text: text,
          isDisabled: style?.isDisabled ?? false,
          onPressed: onPressed,
        );
    }
  }
}

class _upButton extends StatefulWidget {
  const _upButton({
    this.style,
    this.colorType,
    this.text,
    this.isDisabled = false,
    this.onPressed,
  });

  final bool isDisabled;
  final UpStyle? style;
  final UpColorType? colorType;
  final String? text;
  final Function? onPressed;

  @override
  State<_upButton> createState() => __upButtonState();
}

class __upButtonState extends State<_upButton> {
  final int _enterCounter = 0;
  final int _exitCounter = 0;
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
        cursor: widget.style?.isDisabled == true
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
        onEnter: widget.style?.isDisabled == true ? null : _incrementEnter,
        // onHover: _updateLocation,
        onExit: widget.style?.isDisabled == true ? null : _incrementExit,
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
                  ? UpStyle.getButtonHoverBackgroundColor(context,
                      style: widget.style, colorType: widget.colorType)
                  : UpStyle.getButtonBackgroundColor(context,
                      style: widget.style, colorType: widget.colorType),
              border: Border.all(
                style: BorderStyle.solid,
                color: isHovered
                    ? UpStyle.getButtonHoverBorderColor(context,
                        style: widget.style, colorType: widget.colorType)
                    : UpStyle.getButtonBorderColor(context,
                        style: widget.style, colorType: widget.colorType),
                width: UpStyle.getButtonBorderWidth(context,
                    style: widget.style, colorType: widget.colorType),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  UpStyle.getButtonBorderRadius(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  ),
                ), //                 <--- border radius here
              ),
              boxShadow: isHovered
                  ? <BoxShadow>[
                      BoxShadow(
                        color: UpStyle.getButtonBackgroundColor(context,
                                style: widget.style,
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
                          ? UpStyle.getButtonHoverTextColor(context,
                              style: widget.style, colorType: widget.colorType)
                          : UpStyle.getButtonTextColor(
                              context,
                              style: widget.style,
                              colorType: widget.colorType,
                            ),
                      fontSize: UpStyle.getButtonTextSize(
                        context,
                        style: widget.style,
                        colorType: widget.colorType,
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _upImageButton extends StatefulWidget {
  const _upImageButton({
    this.image,
    this.style,
    this.colorType,
    this.text,
    this.isDisabled = false,
    this.onPressed,
  });

  final Image? image;
  final bool isDisabled;
  final UpStyle? style;
  final UpColorType? colorType;
  final String? text;
  final Function? onPressed;

  @override
  State<_upImageButton> createState() => __upImageButtonState();
}

class __upImageButtonState extends State<_upImageButton> {
  final int _enterCounter = 0;
  final int _exitCounter = 0;
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
        cursor: widget.style?.isDisabled == true
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
        onEnter: widget.style?.isDisabled == true ? null : _incrementEnter,
        // onHover: _updateLocation,
        onExit: widget.style?.isDisabled == true ? null : _incrementExit,
        child: GestureDetector(
          onTap: () {
            if (!widget.isDisabled && widget.onPressed != null) {
              widget.onPressed!();
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: isHovered
                      ? UpStyle.getButtonHoverBackgroundColor(context,
                          style: widget.style, colorType: widget.colorType)
                      : UpStyle.getButtonBackgroundColor(context,
                          style: widget.style, colorType: widget.colorType),
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: isHovered
                        ? UpStyle.getButtonHoverBorderColor(context,
                            style: widget.style, colorType: widget.colorType)
                        : UpStyle.getButtonBorderColor(context,
                            style: widget.style, colorType: widget.colorType),
                    width: UpStyle.getButtonBorderWidth(context,
                        style: widget.style, colorType: widget.colorType),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      UpStyle.getButtonBorderRadius(
                        context,
                        style: widget.style,
                        colorType: widget.colorType,
                      ),
                    ), //                 <--- border radius here
                  ),
                  boxShadow: isHovered
                      ? <BoxShadow>[
                          BoxShadow(
                            color: UpStyle.getButtonBackgroundColor(context,
                                    style: widget.style,
                                    colorType: widget.colorType)
                                .withOpacity(0.2), // 0.1
                            blurRadius: 4, //1
                            offset: const Offset(0, 4), // 0,2
                          ),
                        ]
                      : null,
                ),
                child: UpStyle.getbuttonBackgroundImage(context,
                    style: widget.style, colorType: widget.colorType),
              ),
              Container(
                child: Stack(
                  children: [
                    // Implement the stroke
                    Text(
                      widget.text ?? "",
                      style: TextStyle(
                        fontStyle: UpStyle.getTextFontStyle(context,
                            style: widget.style, colorType: widget.colorType),
                        fontWeight: UpStyle.getTextFontWeight(context,
                            style: widget.style, colorType: widget.colorType),
                        fontSize: UpStyle.getButtonTextSize(
                          context,
                          style: widget.style,
                          colorType: widget.colorType,
                        ),
                        foreground: Paint()
                          ..color = UpStyle.getButtonTextStrokeColor(context,
                              style: widget.style, colorType: widget.colorType)
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = UpStyle.getButtonTextStrokeWidth(
                              context,
                              style: widget.style,
                              colorType: widget.colorType),
                      ),
                    ),
                    Text(
                      widget.text ?? "",
                      style: TextStyle(
                        fontStyle: UpStyle.getTextFontStyle(context,
                            style: widget.style, colorType: widget.colorType),
                        fontSize: UpStyle.getButtonTextSize(
                          context,
                          style: widget.style,
                          colorType: widget.colorType,
                        ),
                        color: UpStyle.getButtonTextColor(context,
                            style: widget.style, colorType: widget.colorType),
                        fontWeight: UpStyle.getTextFontWeight(context,
                            style: widget.style, colorType: widget.colorType),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
