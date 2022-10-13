import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_text_direction.dart';

class UpRadio extends StatefulWidget {
  final String? label;
  final Function onChange;
  final UpTextDirection labelDirection;
  final String value;
  bool isSelected;
  final String groupValue;
  final Color fillColor;

  UpRadio({
    Key? key,
    required this.value,
    this.label,
    required this.onChange,
    this.labelDirection = UpTextDirection.right,
    this.isSelected = false,
    required this.groupValue,
    this.fillColor = Colors.black,
  }) : super(key: key);

  @override
  State<UpRadio> createState() => _UpRadioState();
}

class _UpRadioState extends State<UpRadio> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        widget.labelDirection == UpTextDirection.left
            ? Text(widget.label ?? "")
            : const Text(""),
        Radio(
            value: widget.value,
            fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              return widget.fillColor;
            }),
            // fillColor: MaterialStateProperty.resolveWith<Color>(
            //     (Set<MaterialState> states) {
            //   return widget.isSelected ? Colors.grey : Colors.black;
            // }),
            groupValue: widget.groupValue,
            onChanged: (radioValue) {
              widget.onChange(radioValue);
              if (radioValue == widget.value) {
                setState(() {
                  widget.isSelected = true;
                });
              }
            }),
        widget.labelDirection == UpTextDirection.right
            ? Text(widget.label ?? "")
            : const Text(""),
      ],
    );
  }
}
