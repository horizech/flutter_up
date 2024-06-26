import 'package:flutter/material.dart';
import 'package:flutter_up/controller/up_checkbox_controller.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_text_direction.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpCheckbox extends StatefulWidget {
  final UpColorType? colorType;
  final UpCheckboxController? controller;
  final UpStyle? style;
  final String? label;
  final Function? onChange;
  final UpTextDirection labelDirection;
  final bool? initialValue;

  const UpCheckbox({
    Key? key,
    this.initialValue,
    this.label,
    this.controller,
    this.colorType,
    this.style,
    this.onChange,
    this.labelDirection = UpTextDirection.right,
  }) : super(key: key);

  @override
  State<UpCheckbox> createState() => _UpCheckboxState();
}

class _UpCheckboxState extends State<UpCheckbox> {
  double x = 0.0;
  bool currentValue = false;
  double y = 0.0;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      currentValue = widget.initialValue!;
    } else if (widget.controller != null) {
      currentValue = widget.controller!.value;
      widget.controller!.addListener(() {
        setState(() {
          currentValue = widget.controller!.value;
        });
      });
    }
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

  _onTap() {
    if (!(widget.style?.isDisabled ?? false)) {
      currentValue = !currentValue;
      if (widget.controller != null) {
        widget.controller!.value = currentValue;
      }
      if (widget.onChange != null) {
        widget.onChange!(currentValue);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onTap();
      },
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Visibility(
            visible: widget.labelDirection == UpTextDirection.left,
            child: Text(
              widget.label ?? "",
              style: TextStyle(
                color: UpStyle.getCheckboxLabelColor(
                  context,
                  style: widget.style,
                  colorType: widget.colorType,
                ),
                fontSize: UpStyle.getCheckboxLabelSize(
                  context,
                  style: widget.style,
                  colorType: widget.colorType,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentValue && isHovered
                  ? UpStyle.getcheckboxBackgroundColor(
                      context,
                      style: widget.style,
                      colorType: widget.colorType,
                    ).withAlpha(50)
                  : isHovered
                      ? UpStyle.getCheckboxRippleColor(
                          context,
                          style: widget.style,
                          colorType: widget.colorType,
                        )
                      : Colors.transparent,
            ),
            height: 48.0,
            width: 48.0,
            child: GestureDetector(
              onTap: (() {
                _onTap();
              }),
              child: MouseRegion(
                cursor: widget.style?.isDisabled == true
                    ? SystemMouseCursors.basic
                    : SystemMouseCursors.click,
                onEnter:
                    widget.style?.isDisabled == true ? null : _incrementEnter,
                onExit:
                    widget.style?.isDisabled == true ? null : _incrementExit,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: currentValue
                          ? UpStyle.getcheckboxBackgroundColor(context,
                              style: widget.style, colorType: widget.colorType)
                          : Colors.transparent,
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: currentValue
                            ? Colors.transparent
                            : isHovered
                                ? UpStyle.getcheckboxHoverBorderColor(context,
                                    style: widget.style,
                                    colorType: widget.colorType)
                                : UpStyle.getCheckboxBorderColor(context,
                                    style: widget.style,
                                    colorType: widget.colorType),
                        width: UpStyle.getBorderWidth(context,
                            style: widget.style, colorType: widget.colorType),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          UpStyle.getCheckboxBorderRadius(
                            context,
                            style: widget.style,
                            colorType: widget.colorType,
                          ),
                        ),
                      ),
                    ),
                    child: Visibility(
                      visible: currentValue,
                      child: Align(
                        alignment: Alignment.center,
                        child: Center(
                          child: Icon(Icons.check,
                              color: UpStyle.getCheckboxCheckedColor(
                                context,
                                style: widget.style,
                                colorType: widget.colorType,
                              ),
                              size: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.labelDirection == UpTextDirection.right,
            child: Text(
              widget.label ?? "",
              style: TextStyle(
                color: UpStyle.getCheckboxLabelColor(
                  context,
                  style: widget.style,
                  colorType: widget.colorType,
                ),
                fontSize: UpStyle.getCheckboxLabelSize(
                  context,
                  style: widget.style,
                  colorType: widget.colorType,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
