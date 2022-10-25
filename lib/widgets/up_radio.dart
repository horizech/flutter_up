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
    required this.onChange,
    this.labelDirection = UpTextDirection.right,
    this.groupValue,
    this.fillColor = Colors.black,
  }) : super(key: key);

  @override
  State<UpRadio> createState() => _UpRadioState();
}

class _UpRadioState extends State<UpRadio> {
  // String? _groupValue;
  // @override
  // void initState() {
  //   super.initState();
  //   _groupValue = widget.groupValue;
  // }

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
            toggleable: widget.toggleable,
            groupValue: widget.groupValue,
            onChanged: (radioValue) {
              widget.onChange!(radioValue.toString());
              setState(() {
                widget.groupValue = radioValue.toString();
              });
              // setState(() {
              //   widget.groupValue = radioValue.toString();
              // });
              //  else {
              //     setState(() {
              //       _groupValue = "";
              //     });
              //   }
            }),
        widget.labelDirection == UpTextDirection.right
            ? Text(widget.label ?? "")
            : const Text(""),
      ],
    );
  }
}


// class UpRadio extends StatefulWidget {
//   final String? label;
//   final Function onChange;
//   final UpTextDirection labelDirection;
//   final String value;
//   bool isSelected;
//   final String groupValue;
//   final Color fillColor;

//   UpRadio({
//     Key? key,
//     required this.value,
//     this.label,
//     required this.onChange,
//     this.labelDirection = UpTextDirection.right,
//     this.isSelected = false,
//     required this.groupValue,
//     this.fillColor = Colors.black,
//   }) : super(key: key);

//   @override
//   State<UpRadio> createState() => _UpRadioState();
// }

// class _UpRadioState extends State<UpRadio> {
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       alignment: WrapAlignment.center,
//       crossAxisAlignment: WrapCrossAlignment.center,
//       children: [
//         widget.labelDirection == UpTextDirection.left
//             ? Text(widget.label ?? "")
//             : const Text(""),
//         Radio(
//             value: widget.value,
//             fillColor: MaterialStateProperty.resolveWith<Color>(
//                 (Set<MaterialState> states) {
//               return widget.fillColor;
//             }),
//             groupValue: widget.groupValue,
//             onChanged: (radioValue) {
//               widget.onChange(radioValue);
//               if (radioValue == widget.value) {
//                 setState(() {
//                   widget.isSelected = true;
//                 });
//               }
//             }),
//         widget.labelDirection == UpTextDirection.right
//             ? Text(widget.label ?? "")
//             : const Text(""),
//       ],
//     );
//   }
// }
