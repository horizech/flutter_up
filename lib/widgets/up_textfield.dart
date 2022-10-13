import 'package:flutter/material.dart';

class UpTextField extends StatelessWidget {
  final InputDecoration? decoration;
  final bool obscureText;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int minLength;
  final List<int>? fixedLengths;
  final String? autofillHint;
  final String? label;
  final bool isFlexible;
  final Function(String?)? onSaved;

  const UpTextField({
    Key? key,
    this.decoration,
    this.obscureText = false,
    this.readOnly = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.minLength = 0,
    this.fixedLengths,
    this.autofillHint,
    this.label = "",
    this.isFlexible = false,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFlexible
        ? Flexible(
            fit: FlexFit.loose,
            child: _upTextField(
              decoration,
              obscureText,
              readOnly,
              controller,
              keyboardType,
              minLength,
              fixedLengths,
              autofillHint,
              label,
              onSaved,
            ),
          )
        : _upTextField(
            decoration,
            obscureText,
            readOnly,
            controller,
            keyboardType,
            minLength,
            fixedLengths,
            autofillHint,
            label,
            onSaved);
  }
}

Widget _upTextField(
  InputDecoration? decoration,
  bool obscureText,
  bool readOnly,
  TextEditingController? controller,
  TextInputType keyboardType,
  int minLength,
  List<int>? fixedLengths,
  String? autofillHint,
  String? label,
  Function(String?)? onSaved,
) {
  return TextFormField(
    onSaved: onSaved,
    keyboardType: keyboardType,
    autofillHints: autofillHint != null && autofillHint.isNotEmpty
        ? <String>[autofillHint]
        : null,
    validator: (value) {
      if (fixedLengths != null &&
          !fixedLengths.contains((controller!.text).length)) {
        String lengths = fixedLengths
            .map((x) => x.toString())
            .reduce((value, element) => ('$value,') + element.toString());
        if (fixedLengths.length == 1) {
          return 'Length should be $lengths';
        } else {
          return 'Length should be one of $lengths';
        }
      } else if (value!.length < minLength) {
        if (minLength == 1) {
          return 'Please enter $label';
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
  );
}
