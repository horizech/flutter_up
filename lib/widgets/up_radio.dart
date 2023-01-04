import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_text_direction.dart';

class UpRadio extends StatefulWidget {
  final String? label;
  final Function? onChange;
  final UpTextDirection labelDirection;
  final String value;
  String? groupValue;
  final Color fillColor;
  final bool toggleable;

  UpRadio({
    Key? key,
    required this.value,
    this.label,
    this.toggleable = false,
    this.onChange,
    this.labelDirection = UpTextDirection.right,
    this.groupValue,
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
              },
            ),
            toggleable: widget.toggleable,
            groupValue: widget.groupValue,
            onChanged: (radioValue) {
              if (widget.onChange != null) {
                widget.onChange!(radioValue.toString());
              }
              setState(() {
                widget.groupValue = radioValue.toString();
              });
            }),
        widget.labelDirection == UpTextDirection.right
            ? Text(widget.label ?? "")
            : const Text(""),
      ],
    );
  }
}
