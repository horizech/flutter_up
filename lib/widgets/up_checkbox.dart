import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_text_direction.dart';

class UpCheckbox extends StatefulWidget {
  final String? label;
  final Function? onChange;
  final UpTextDirection labelDirection;
  bool? initialValue;
  final Color? activeColor;
  final Color? checkColor;
  final bool isRounded;
  final double roundedBorderRadius;
  final double borderWidth;
  final Color borderColor;
  final bool isDisable;

  UpCheckbox({
    Key? key,
    this.initialValue = false,
    this.label,
    this.onChange,
    this.labelDirection = UpTextDirection.right,
    this.activeColor,
    this.checkColor,
    this.isRounded = false,
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
            ? Checkbox(
                value: widget.initialValue ?? false,
                onChanged: null,
                shape: RoundedRectangleBorder(
                    borderRadius: widget.isRounded == true
                        ? BorderRadius.circular(widget.roundedBorderRadius)
                        : BorderRadius.zero),
              )
            : Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: widget.isRounded == true
                        ? BorderRadius.circular(widget.roundedBorderRadius)
                        : BorderRadius.zero),
                value: widget.initialValue,
                activeColor:
                    widget.activeColor ?? (Theme.of(context).primaryColor),
                checkColor: widget.checkColor ??
                    Theme.of(context).colorScheme.secondary,
                side: BorderSide(
                  width: widget.borderWidth,
                  color: widget.borderColor,
                ),
                // fillColor: MaterialStateProperty<Color>fillColor,
                onChanged: (bool? newCheck) {
                  setState(() {
                    widget.initialValue = newCheck ?? false;
                  });

                  if (widget.onChange != null) {
                    widget.onChange!(newCheck);
                  }
                }),
        widget.labelDirection == UpTextDirection.right
            ? Text(widget.label ?? "")
            : const Text(""),
      ],
    );
  }
}
