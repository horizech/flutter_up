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
  final Function(String?)? onChanged;
  final int maxLines;
  final int? minLines;

  const UpTextField(
      {Key? key,
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
      this.onChanged,
      this.maxLines = 1,
      this.minLines})
      : super(key: key);

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
                onChanged,
                maxLines,
                minLines),
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
            onSaved,
            onChanged,
            maxLines,
            minLines);
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
  Function(String?)? onChanged,
  int? maxLines,
  int? minLines,
) {
  return TextFormField(
    onSaved: onSaved,
    onChanged: onChanged,
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
    maxLines: maxLines,
    minLines: minLines,
  );
}
