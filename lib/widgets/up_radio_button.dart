import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_text_direction.dart';
import 'package:flutter_up/models/up_radio_button_items.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpRadioButton extends StatefulWidget {
  final UpColorType? colorType;
  final UpStyle? style;
  final Function? onChange;
  final UpTextDirection labelDirection;
  String value;
  List<UpRadioButtonItem> items;
  final bool isDisable;

  UpRadioButton({
    Key? key,
    this.colorType,
    this.style,
    this.onChange,
    this.labelDirection = UpTextDirection.left,
    this.isDisable = false,
    required this.value,
    required this.items,
  }) : super(key: key);

  @override
  State<UpRadioButton> createState() => _UpRadioButtonState();
}

class _UpRadioButtonState extends State<UpRadioButton> {
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
      children: widget.items
          .map((item) => Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Visibility(
                    visible: widget.labelDirection == UpTextDirection.left,
                    child: Text(
                      item.label,
                      style: TextStyle(
                        color: UpStyle.getRadioButtonLabelColor(
                          context,
                          style: widget.style,
                          colorType: widget.colorType,
                        ),
                        fontSize: UpStyle.getRadioButtonLabelSize(
                          context,
                          style: widget.style,
                          colorType: widget.colorType,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: item.value == widget.value && isHovered
                            ? UpStyle.getRadioButtonFilledColor(context,
                                    style: widget.style,
                                    colorType: widget.colorType)
                                .withAlpha(50)
                            : isHovered
                                ? UpStyle.getRadioButtonRippleColor(context,
                                    style: widget.style,
                                    colorType: widget.colorType)
                                : Colors.transparent),
                    child: MouseRegion(
                      cursor: widget.style?.isDisabled == true
                          ? SystemMouseCursors.basic
                          : SystemMouseCursors.click,
                      onEnter: widget.style?.isDisabled == true
                          ? null
                          : _incrementEnter,
                      onExit: widget.style?.isDisabled == true
                          ? null
                          : _incrementExit,
                      child: GestureDetector(
                        onTap: () {
                          if (!(widget.style?.isDisabled ?? false)) {
                            if (widget.onChange != null) {
                              widget.onChange!(item.value);
                            }
                            setState(() {
                              widget.value = item.value;
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                style: BorderStyle.solid,
                                color: item.value == widget.value
                                    ? UpStyle.getRadioButtonFilledColor(context,
                                        style: widget.style,
                                        colorType: widget.colorType)
                                    : isHovered
                                        ? UpStyle
                                            .getRadioButtonHoverBorderColor(
                                                context,
                                                style: widget.style,
                                                colorType: widget.colorType)
                                        : UpStyle.getRadioButtonBorderColor(
                                            context,
                                            style: widget.style,
                                            colorType: widget.colorType),
                                width: UpStyle.getRadioButtonBorderWidth(
                                    context,
                                    style: widget.style,
                                    colorType: widget.colorType),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  100,
                                ),
                              ),
                              shape: BoxShape.rectangle,
                            ),
                            child: item.value == widget.value
                                ? Align(
                                    alignment: Alignment.center,
                                    child: Icon(Icons.circle,
                                        color:
                                            UpStyle.getRadioButtonFilledColor(
                                          context,
                                          colorType: widget.colorType,
                                          style: widget.style,
                                        ),
                                        size: 20),
                                  )
                                : const Text(""),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.labelDirection == UpTextDirection.right,
                    child: Text(
                      item.label,
                      style: TextStyle(
                        color: UpStyle.getRadioButtonLabelColor(
                          context,
                          style: widget.style,
                          colorType: widget.colorType,
                        ),
                        fontSize: UpStyle.getRadioButtonLabelSize(
                          context,
                          style: widget.style,
                          colorType: widget.colorType,
                        ),
                      ),
                    ),
                  )
                ],
              ))
          .toList(),
    );
  }
}
