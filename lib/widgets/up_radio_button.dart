import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_text_direction.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpRadioButton extends StatefulWidget {
  final UpColorType? colorType;
  final UpStyle? style;
  final String? label;
  final Function? onChange;
  final UpTextDirection labelDirection;
  final String value;
  String? groupValue;
  bool initialValue;

  final bool isDisable;

  UpRadioButton({
    Key? key,
    this.initialValue = true,
    this.label,
    this.colorType,
    this.style,
    this.onChange,
    this.labelDirection = UpTextDirection.right,
    this.isDisable = false,
    required this.value,
    this.groupValue,
  }) : super(key: key);

  @override
  State<UpRadioButton> createState() => _UpRadioButtonState();
}

class _UpRadioButtonState extends State<UpRadioButton> {
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
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Visibility(
          visible: widget.labelDirection == UpTextDirection.left,
          child: Text(widget.label ?? ""),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.initialValue && isHovered
                  ? UpStyle.getRadioButtonColor(context,
                          style: widget.style, colorType: widget.colorType)
                      .withAlpha(50)
                  : isHovered
                      ? Colors.grey[200]
                      : Colors.transparent),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: _incrementEnter,

            // onHover: _updateLocation,
            onExit: _incrementExit,
            child: GestureDetector(
              onTap: () {
                if (!(widget.style?.isDisabled ?? false)) {
                  setState(() {
                    widget.initialValue = !widget.initialValue;
                  });

                  if (widget.onChange != null) {
                    widget.onChange!(!widget.initialValue);
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: widget.initialValue
                          ? UpStyle.getRadioButtonColor(context,
                              style: widget.style, colorType: widget.colorType)
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
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        100,
                      ), //                 <--- border radius here
                    ),
                    boxShadow: isHovered
                        ? <BoxShadow>[
                            BoxShadow(
                              color: UpStyle.getBackgroundColor(context,
                                      style: widget.style,
                                      colorType: widget.colorType)
                                  .withOpacity(0.2), // 0.1
                              blurRadius: 4, //1
                              offset: const Offset(0, 4), // 0,2
                            ),
                          ]
                        : null,
                    shape: BoxShape.rectangle,
                  ),
                  child: widget.initialValue == true
                      ? Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.circle,
                              color: UpStyle.getRadioButtonColor(
                                context,
                                colorType: widget.colorType,
                                style: widget.style,
                              ),
                              size: 20))
                      : const Text(""),
                ),
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
