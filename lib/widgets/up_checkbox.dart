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

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
            color: widget.initialValue && isHovered
                ? UpStyle.getcheckboxBackgroundColor(
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
                if (widget.onChange != null) {
                  widget.onChange!(!widget.initialValue);
                }
                setState(() {
                  widget.initialValue = (!widget.initialValue);
                });
              }
            }),
            child: MouseRegion(
              cursor: widget.style?.isDisabled == true
                  ? SystemMouseCursors.basic
                  : SystemMouseCursors.click,
              onEnter:
                  widget.style?.isDisabled == true ? null : _incrementEnter,
              onExit: widget.style?.isDisabled == true ? null : _incrementExit,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: widget.initialValue
                          ? UpStyle.getcheckboxBackgroundColor(context,
                              style: widget.style, colorType: widget.colorType)
                          : Colors.transparent,
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: widget.initialValue
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
                      visible: widget.initialValue,
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.check,
                            color: UpStyle.getCheckboxCheckedColor(
                              context,
                              style: widget.style,
                              colorType: widget.colorType,
                            ),
                            size: 20),
                      ),
                    )),
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
    );
  }
}
