import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_button_type.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/helpers/up_image_helper.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/widgets/up_text.dart';

class UpButton extends StatelessWidget {
  final Function onPressed;
  final Widget? child;
  final UpColorType? colorType;
  final UpButtonType type;
  final UpStyle? style;
  final String? text;
  final Image? image;
  final IconData? icon;
  final Widget? widget;
  final FocusNode? focusNode;
  final Function(bool)? onFocusChange;

  const UpButton({
    Key? key,
    this.text,
    this.focusNode,
    required this.onPressed,
    this.child,
    this.onFocusChange,
    this.colorType,
    this.type = UpButtonType.elevated,
    this.style,
    this.image,
    this.icon,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case UpButtonType.text:
        return TextButton(
          onFocusChange: onFocusChange,
          focusNode: focusNode,
          onPressed: () {
            if (!(style?.isDisabled ?? false)) onPressed();
          },
          style: UpStyle.getButtonStyle(context,
              style: style, colorType: colorType),
          child: child ?? UpText(text ?? ""),
        );
      case UpButtonType.icon:
        return IconButton(
          focusNode: focusNode,
          onPressed: () {
            if (!(style?.isDisabled ?? false)) onPressed();
          },
          icon: child ?? UpText(text ?? ""),
          style: UpStyle.getButtonStyle(context,
              style: style, colorType: colorType),
        );
      case UpButtonType.outlined:
        return OutlinedButton(
          onFocusChange: onFocusChange,
          focusNode: focusNode,
          onPressed: () {
            if (!(style?.isDisabled ?? false)) onPressed();
          },
          style: UpStyle.getButtonStyle(context,
              style: style, colorType: colorType),
          child: child ?? UpText(text ?? ""),
        );
      case UpButtonType.floating:
        return FloatingActionButton(
          focusNode: focusNode,
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
          image: image,
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
          icon: icon,
          colorType: colorType,
          style: style,
          text: text,
          isDisabled: style?.isDisabled ?? false,
          onPressed: onPressed,
          image: image,
          widget: widget,
          focusNode: focusNode,
          onFocusChange: onFocusChange,
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
    this.icon,
    this.focusNode,
    this.image,
    this.widget,
    this.onFocusChange,
  });

  final bool isDisabled;
  final UpStyle? style;
  final UpColorType? colorType;
  final String? text;
  final Function? onPressed;
  final IconData? icon;
  final Widget? widget;
  final FocusNode? focusNode;
  final Function(bool)? onFocusChange;

  final Image? image;

  @override
  State<_upButton> createState() => __upButtonState();
}

class __upButtonState extends State<_upButton> {
  double x = 0.0;
  double y = 0.0;
  double? imageWidth;
  double? imageHeight;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    getImageSize();
  }

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

  getImageSize() async {
    if (widget.style != null && widget.style?.buttonBackgroundImage != null) {
      await _getImageSize();
    }
  }

  _getImageSize() async {
    Size imageSize = await UpImageHelper.calculateImageDimension(
        widget.style!.buttonBackgroundImage!);

    imageWidth = imageSize.width;
    imageHeight = imageSize.height;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: widget.focusNode,
      onFocusChange: widget.onFocusChange,
      child: SizedBox(
        width: widget.style != null && widget.style?.buttonWidth != null
            ? UpStyle.getButtonWidth(
                context,
                style: widget.style,
                colorType: widget.colorType,
              )
            : null,
        height: UpStyle.getButtonHeight(
          context,
          style: widget.style,
          colorType: widget.colorType,
        ),
        child: MouseRegion(
          cursor: widget.style?.isDisabled == true
              ? SystemMouseCursors.basic
              : SystemMouseCursors.click,
          onEnter: widget.style?.isDisabled == true ? null : _incrementEnter,
          onExit: widget.style?.isDisabled == true ? null : _incrementExit,
          child: GestureDetector(
            onTap: () {
              if (!widget.isDisabled && widget.onPressed != null) {
                widget.onPressed!();
              }
            },
            child: ClipPath(
              clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      UpStyle.getButtonBorderRadius(
                        context,
                        style: widget.style,
                        colorType: widget.colorType,
                      ),
                    ),
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: UpStyle.getButtonBackgroundGradient(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  ),
                  borderRadius: UpStyle.isButtonBorderUniform(widget.style)
                      ? BorderRadius.circular(
                          UpStyle.getButtonBorderRadius(context,
                              style: widget.style, colorType: widget.colorType),
                        )
                      : null,
                  shape: BoxShape.rectangle,
                  color: isHovered
                      ? UpStyle.getButtonHoverBackgroundColor(context,
                          style: widget.style, colorType: widget.colorType)
                      : UpStyle.getButtonBackgroundColor(context,
                          style: widget.style, colorType: widget.colorType),
                  border: UpStyle.getButtonBorder(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                    isHovered: isHovered,
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
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Visibility(
                          visible: widget.icon != null,
                          child: Icon(
                            widget.icon,
                            color: UpStyle.getButtonTextColor(
                              context,
                              style: widget.style,
                              colorType: widget.colorType,
                            ),
                          ),
                        ),
                        Visibility(
                            visible: widget.widget != null,
                            child: widget.widget ?? const SizedBox()),
                        Visibility(
                          visible: widget.image != null,
                          child: widget.image ?? Container(),
                        ),
                        Text(
                          widget.text ?? " ",
                          style: TextStyle(
                            fontWeight: UpStyle.getButtonTextWeight(
                              context,
                              style: widget.style,
                              colorType: widget.colorType,
                            ),
                            color: isHovered
                                ? UpStyle.getButtonHoverTextColor(context,
                                    style: widget.style,
                                    colorType: widget.colorType)
                                : UpStyle.getButtonTextColor(
                                    context,
                                    style: widget.style,
                                    colorType: widget.colorType,
                                  ),
                            fontSize: UpStyle.getButtonTextSize(
                              context,
                              style: widget.style,
                              colorType: widget.colorType,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ],
                // ),
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
              UpText(
                widget.text ?? "",
                style: widget.style,
              ),
              // SizedBox(
              //   child: Stack(
              //     children: [
              //       // Implement the stroke
              //       UpText(
              //         widget.text ?? "",
              //         // style: TextStyle(
              //         //   fontStyle: UpStyle.getTextFontStyle(context,
              //         //       style: widget.style, colorType: widget.colorType),
              //         //   fontWeight: UpStyle.getTextFontWeight(context,
              //         //       style: widget.style, colorType: widget.colorType),
              //         //   fontSize: UpStyle.getButtonTextSize(
              //         //     context,
              //         //     style: widget.style,
              //         //     colorType: widget.colorType,
              //         //   ),
              //         //   foreground: Paint()
              //         //     ..color = UpStyle.getTextStrokeColor(context,
              //         //         style: widget.style, colorType: widget.colorType)
              //         //     ..style = PaintingStyle.stroke
              //         //     ..strokeWidth = UpStyle.getTextStrokeWidth(context,
              //         //         style: widget.style, colorType: widget.colorType),
              //         // ),
              //       ),
              //       UpText(
              //         widget.text ?? "",
              //         // style: TextStyle(
              //         //   fontStyle: UpStyle.getTextFontStyle(context,
              //         //       style: widget.style, colorType: widget.colorType),
              //         //   fontSize: UpStyle.getButtonTextSize(
              //         //     context,
              //         //     style: widget.style,
              //         //     colorType: widget.colorType,
              //         //   ),
              //         //   color: UpStyle.getButtonTextColor(context,
              //         //       style: widget.style, colorType: widget.colorType),
              //         //   fontWeight: UpStyle.getTextFontWeight(context,
              //         //       style: widget.style, colorType: widget.colorType),
              //         // ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
