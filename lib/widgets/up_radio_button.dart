import 'package:flutter/material.dart';
import 'package:flutter_up/enums/direction.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_text_direction.dart';
import 'package:flutter_up/models/up_radio_button_items.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpRadioButton extends StatefulWidget {
  final UpColorType? colorType;
  final UpDirection direction;
  final UpStyle? style;
  final Function? onChange;
  final UpTextDirection labelDirection;
  final dynamic initialValue;

  final List<UpRadioButtonItem> items;

  const UpRadioButton({
    Key? key,
    this.colorType,
    this.style,
    this.onChange,
    this.labelDirection = UpTextDirection.left,
    this.initialValue,
    this.direction = UpDirection.horizontal,
    required this.items,
  }) : super(key: key);

  @override
  State<UpRadioButton> createState() => _UpRadioButtonState();
}

class _UpRadioButtonState extends State<UpRadioButton> {
  double x = 0.0;
  double y = 0.0;
  dynamic radioValue;
  List<bool> isHovered = [];

  void _incrementEnter(int key) {
    setState(() {
      isHovered[key] = true;
    });
  }

  void _incrementExit(int key) {
    setState(() {
      isHovered[key] = false;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      radioValue = widget.initialValue;
    } else {
      radioValue = widget.items.first.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isHovered.isEmpty) {
      for (var element in widget.items) {
        isHovered.add(false);
      }
    }
    return widget.direction == UpDirection.horizontal
        ? Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: widget.items
                .asMap()
                .entries
                .map((item) => Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Visibility(
                          visible:
                              widget.labelDirection == UpTextDirection.left,
                          child: item.value.widget ??
                              Text(
                                item.value.label ?? "",
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
                            color: item.value.isDisabled
                                ? Colors.transparent
                                : item.value.value == radioValue &&
                                        isHovered[item.key]
                                    ? UpStyle.getRadioButtonFilledColor(context,
                                            style: widget.style,
                                            colorType: widget.colorType)
                                        .withAlpha(50)
                                    : isHovered[item.key]
                                        ? UpStyle.getRadioButtonRippleColor(
                                            context,
                                            style: widget.style,
                                            colorType: widget.colorType)
                                        : Colors.transparent,
                          ),
                          child: MouseRegion(
                            cursor: widget.style?.isDisabled == true
                                ? SystemMouseCursors.basic
                                : item.value.isDisabled
                                    ? SystemMouseCursors.basic
                                    : SystemMouseCursors.click,
                            onEnter: widget.style?.isDisabled == true
                                ? null
                                : item.value.isDisabled
                                    ? null
                                    : (PointerEvent detail) =>
                                        _incrementEnter(item.key),
                            onExit: widget.style?.isDisabled == true
                                ? null
                                : item.value.isDisabled
                                    ? null
                                    : (PointerEvent detail) =>
                                        _incrementExit(item.key),
                            child: GestureDetector(
                              onTap: () {
                                if (!(widget.style?.isDisabled ?? false)) {
                                  if (item.value.isDisabled) {
                                  } else {
                                    if (widget.onChange != null) {
                                      widget.onChange!(item.value.value);
                                    }
                                    setState(() {
                                      radioValue = item.value.value;
                                    });
                                  }
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      style: BorderStyle.solid,
                                      color: item.value.value == radioValue
                                          ? UpStyle.getRadioButtonFilledColor(
                                              context,
                                              style: widget.style,
                                              colorType: widget.colorType)
                                          : isHovered[item.key]
                                              ? UpStyle
                                                  .getRadioButtonHoverBorderColor(
                                                      context,
                                                      style: widget.style,
                                                      colorType:
                                                          widget.colorType)
                                              : UpStyle
                                                  .getRadioButtonBorderColor(
                                                      context,
                                                      style: widget.style,
                                                      colorType:
                                                          widget.colorType),
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
                                  child: item.value.value == radioValue
                                      ? Align(
                                          alignment: Alignment.center,
                                          child: Icon(Icons.circle,
                                              color: UpStyle
                                                  .getRadioButtonFilledColor(
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
                          visible:
                              widget.labelDirection == UpTextDirection.right,
                          child: item.value.widget ??
                              Text(
                                item.value.label ?? "",
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
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.items
                .asMap()
                .entries
                .map((item) => SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widget.labelDirection == UpTextDirection.left
                              ? Expanded(
                                  child: Visibility(
                                    visible: widget.labelDirection ==
                                        UpTextDirection.left,
                                    child: item.value.widget ??
                                        Text(
                                          item.value.label ?? "",
                                          style: TextStyle(
                                            color: UpStyle
                                                .getRadioButtonLabelColor(
                                              context,
                                              style: widget.style,
                                              colorType: widget.colorType,
                                            ),
                                            fontSize:
                                                UpStyle.getRadioButtonLabelSize(
                                              context,
                                              style: widget.style,
                                              colorType: widget.colorType,
                                            ),
                                          ),
                                        ),
                                  ),
                                )
                              : const SizedBox(),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: item.value.isDisabled
                                  ? Colors.transparent
                                  : item.value.value == radioValue &&
                                          isHovered[item.key]
                                      ? UpStyle.getRadioButtonFilledColor(
                                              context,
                                              style: widget.style,
                                              colorType: widget.colorType)
                                          .withAlpha(50)
                                      : isHovered[item.key]
                                          ? UpStyle.getRadioButtonRippleColor(
                                              context,
                                              style: widget.style,
                                              colorType: widget.colorType)
                                          : Colors.transparent,
                            ),
                            child: MouseRegion(
                              cursor: widget.style?.isDisabled == true
                                  ? SystemMouseCursors.basic
                                  : item.value.isDisabled
                                      ? SystemMouseCursors.basic
                                      : SystemMouseCursors.click,
                              onEnter: widget.style?.isDisabled == true
                                  ? null
                                  : item.value.isDisabled
                                      ? null
                                      : (PointerEvent detail) =>
                                          _incrementEnter(item.key),
                              onExit: widget.style?.isDisabled == true
                                  ? null
                                  : item.value.isDisabled
                                      ? null
                                      : (PointerEvent detail) =>
                                          _incrementExit(item.key),
                              child: GestureDetector(
                                onTap: () {
                                  if (!(widget.style?.isDisabled ?? false)) {
                                    if (item.value.isDisabled) {
                                    } else {
                                      if (widget.onChange != null) {
                                        widget.onChange!(item.value.value);
                                      }
                                      setState(() {
                                        radioValue = item.value.value;
                                      });
                                    }
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border.all(
                                        style: BorderStyle.solid,
                                        color: item.value.isDisabled
                                            ? UpStyle
                                                .getRadioButtonDisabledFilledColor(
                                                    context,
                                                    style: widget.style,
                                                    colorType: widget.colorType)
                                            : item.value.value == radioValue
                                                ? UpStyle
                                                    .getRadioButtonFilledColor(
                                                        context,
                                                        style: widget.style,
                                                        colorType:
                                                            widget.colorType)
                                                : isHovered[item.key]
                                                    ? UpStyle
                                                        .getRadioButtonHoverBorderColor(
                                                            context,
                                                            style: widget.style,
                                                            colorType: widget
                                                                .colorType)
                                                    : UpStyle
                                                        .getRadioButtonBorderColor(
                                                            context,
                                                            style: widget.style,
                                                            colorType: widget
                                                                .colorType),
                                        width:
                                            UpStyle.getRadioButtonBorderWidth(
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
                                    child: item.value.value == radioValue
                                        ? Align(
                                            alignment: Alignment.center,
                                            child: Icon(Icons.circle,
                                                color: UpStyle
                                                    .getRadioButtonFilledColor(
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
                          widget.labelDirection == UpTextDirection.right
                              ? Expanded(
                                  child: Container(
                                    child: Visibility(
                                      child: item.value.widget ??
                                          Text(
                                            item.value.label ?? "",
                                            style: TextStyle(
                                              color: UpStyle
                                                  .getRadioButtonLabelColor(
                                                context,
                                                style: widget.style,
                                                colorType: widget.colorType,
                                              ),
                                              fontSize: UpStyle
                                                  .getRadioButtonLabelSize(
                                                context,
                                                style: widget.style,
                                                colorType: widget.colorType,
                                              ),
                                            ),
                                          ),
                                    ),
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ))
                .toList(),
          );
  }
}
