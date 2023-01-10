import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_text_direction.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpCheckbox extends StatefulWidget {
  final UpColorType? colorType;
  final UpStyle? style;
  final String? label;
  final Function? onChange;
  final UpTextDirection labelDirection;
  bool initialValue;
  final bool isDisable;

  UpCheckbox({
    Key? key,
    this.initialValue = false,
    this.label,
    this.colorType,
    this.style,
    this.onChange,
    this.labelDirection = UpTextDirection.right,
    this.isDisable = false,
  }) : super(key: key);

  @override
  State<UpCheckbox> createState() => _UpCheckboxState();
}

class _UpCheckboxState extends State<UpCheckbox> {
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
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Visibility(
          visible: widget.labelDirection == UpTextDirection.left,
          child: Text(widget.label ?? ""),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.initialValue && isHovered
                ? UpStyle.getCheckBackgroundColor(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  ).withAlpha(50)
                : isHovered
                    ? Colors.grey[200]
                    : Colors.transparent,
          ),
          height: 48.0,
          width: 48.0,
          child: GestureDetector(
            onTap: (() {
              if (!(widget.style?.isDisabled ?? false)) {
                setState(() {
                  widget.initialValue = (!widget.initialValue);
                });

                if (widget.onChange != null) {
                  widget.onChange!(!widget.initialValue);
                }
              }
            }),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: _incrementEnter,
              onExit: _incrementExit,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: widget.initialValue
                          ? UpStyle.getCheckBackgroundColor(context,
                              style: widget.style, colorType: widget.colorType)
                          : Colors.transparent,
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: widget.initialValue
                            ? Colors.transparent
                            : isHovered
                                ? UpStyle.getFocusedBorderColor(context,
                                    style: widget.style,
                                    colorType: widget.colorType)
                                : UpStyle.getBorderColor(context,
                                    style: widget.style,
                                    colorType: widget.colorType),
                        width: UpStyle.getBorderWidth(context,
                            style: widget.style, colorType: widget.colorType),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          UpStyle.getBorderRadius(
                            context,
                            style: widget.style,
                            colorType: widget.colorType,
                          ),
                        ),
                      ),
                    ),
                    child: Visibility(
                      visible: widget.initialValue,
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.check,
                            color: UpStyle.getCheckedForegroundColor(
                              context,
                              style: widget.style,
                              colorType: widget.colorType,
                            ),
                            size: 25),
                      ),
                    )),
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.labelDirection == UpTextDirection.right,
          child: Text(widget.label ?? ""),
        )
      ],
    );
  }
}
