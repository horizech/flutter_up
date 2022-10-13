import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_text_direction.dart';

class UpCheckbox extends StatefulWidget {
  final String? label;
  final Function onChange;
  final UpTextDirection labelDirection;
  final bool value;
  final Color activeColor;
  final Color checkColor;
  final bool isRounded;
  final Color? fillColor;
  final double roundedBorderRadius;
  final double borderWidth;
  final Color borderColor;
  final bool isDisable;

  const UpCheckbox({
    Key? key,
    required this.value,
    this.label,
    required this.onChange,
    this.labelDirection = UpTextDirection.right,
    this.activeColor = Colors.black,
    this.checkColor = Colors.white,
    this.isRounded = false,
    this.fillColor,
    this.isDisable = false,
    this.roundedBorderRadius = 10,
    this.borderWidth = 1,
    this.borderColor = Colors.black,
  }) : super(key: key);

  @override
  State<UpCheckbox> createState() => _UpCheckboxState();
}

class _UpCheckboxState extends State<UpCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        widget.labelDirection == UpTextDirection.left
            ? Text(widget.label ?? "")
            : const Text(""),
        widget.isDisable == true
            ? const Checkbox(value: false, onChanged: null)
            : Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: widget.isRounded == true
                        ? BorderRadius.circular(widget.roundedBorderRadius)
                        : BorderRadius.zero),
                value: widget.value,
                activeColor: widget.activeColor,
                checkColor: widget.checkColor,
                side: BorderSide(
                  width: widget.borderWidth,
                  color: widget.borderColor,
                ),
                // fillColor: MaterialStateProperty<Color>fillColor,
                onChanged: (bool? newcheck) {
                  widget.onChange(newcheck);
                }),
        widget.labelDirection == UpTextDirection.right
            ? Text(widget.label ?? "")
            : const Text(""),
      ],
    );
  }
}
