import 'package:flutter/material.dart';

class UpTextField extends StatelessWidget {
  final InputDecoration? decoration;
  final bool obscureText;
  final bool readOnly;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int minLength;
  final List<int>? fixedLengths;
  final String? autofillHint;
  final String? lable;

  const UpTextField({
    Key? key,
    this.decoration,
    this.obscureText = false,
    this.readOnly = false,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.minLength = 0,
    this.fixedLengths,
    this.autofillHint,
    this.lable = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.loose,
        child: TextFormField(
          keyboardType: keyboardType,
          autofillHints: autofillHint != null && autofillHint!.isNotEmpty
              ? <String>[autofillHint!]
              : null,
          validator: (value) {
            if (fixedLengths != null &&
                !fixedLengths!.contains(controller.text.length)) {
              String lengths = fixedLengths!
                  .map((x) => x.toString())
                  .reduce((value, element) => ('$value,') + element.toString());
              if (fixedLengths!.length == 1) {
                return 'Length should be $lengths';
              } else {
                return 'Length should be one of $lengths';
              }
            } else if (value!.length < minLength) {
              if (minLength == 1) {
                return 'Please enter $lable';
              } else {
                return 'Length should be at least $minLength';
              }
            }
            return null;
          },
          obscureText: obscureText,
          readOnly: readOnly,
          decoration: decoration,
          controller: controller,
        ));
  }
}
