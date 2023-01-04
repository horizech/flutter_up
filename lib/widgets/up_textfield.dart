import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_input_type.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpTextField extends StatelessWidget {
  final UpInputType? type;
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
  final UpColorType? colorType;
  final UpStyle? style;
  final Function()? onTap;
  final IconData? suffixIcon;
  final IconData? icon;
  final IconData? prefixIcon;

  final String? hint;

  const UpTextField({
    Key? key,
    this.type,
    this.obscureText = false,
    this.readOnly = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.minLength = 0,
    this.fixedLengths,
    this.autofillHint,
    this.onTap,
    this.label = "",
    this.isFlexible = false,
    this.onSaved,
    this.onChanged,
    this.maxLines = 1,
    this.colorType,
    this.style,
    this.hint,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFlexible
        ? Flexible(
            fit: FlexFit.loose,
            child: _upTextField(
              context,
              type,
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
              onTap,
              maxLines,
              colorType,
              style,
              hint,
              icon,
              prefixIcon,
              suffixIcon,
            ))
        : _upTextField(
            context,
            type,
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
            onTap,
            maxLines,
            colorType,
            style,
            hint,
            icon,
            prefixIcon,
            suffixIcon,
          );
  }
}

Widget _upTextField(
  BuildContext context,
  UpInputType? type,
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
  Function()? onTap,
  int? maxLines,
  final UpColorType? colorType,
  final UpStyle? style,
  final String? hint,
  final IconData? icon,
  final IconData? prefixIcon,
  final IconData? suffixIcon,
) {
  return TextFormField(
    onSaved: onSaved,
    onTap: onTap,
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
    decoration: InputDecoration(
      label: Text(
        label ?? "",
        style: TextStyle(
          color: UpStyle.getForegroundColor(
            context,
            style: style,
            colorType: colorType,
          ),
        ),
      ),
      suffixIcon: Icon(
        suffixIcon,
        color: UpStyle.getIconColor(
          context,
          style: style,
          colorType: colorType,
        ),
        size: UpStyle.getIconSize(
          context,
          style: style,
          colorType: colorType,
        ),
      ),
      prefixIcon: Icon(
        prefixIcon,
        color: UpStyle.getIconColor(
          context,
          style: style,
          colorType: colorType,
        ),
        size: UpStyle.getIconSize(
          context,
          style: style,
          colorType: colorType,
        ),
      ),
      icon: Icon(
        icon,
        color: UpStyle.getIconColor(
          context,
          style: style,
          colorType: colorType,
        ),
        size: UpStyle.getIconSize(
          context,
          style: style,
          colorType: colorType,
        ),
      ),
      hintText: hint,
      enabledBorder: UpStyle.getBorderStyle(
        context,
        type: type ?? UpInputType.outline,
        style: style,
        colorType: colorType,
      ),
      labelStyle: TextStyle(
        color: UpStyle.getForegroundColor(
          context,
          style: style,
          colorType: colorType,
        ),
      ),
      focusedBorder: UpStyle.getBorderStyle(
        context,
        type: type ?? UpInputType.outline,
        style: style,
        colorType: colorType,
        isFocused: true,
      ),
      errorBorder: UpStyle.getBorderStyle(
        context,
        type: type ?? UpInputType.outline,
        style: style,
        colorType: colorType,
        isError: true,
      ),
      border: UpStyle.getBorderStyle(
        context,
        type: type ?? UpInputType.outline,
        style: style,
        colorType: colorType,
      ),
    ),
    controller: controller,
    maxLines: maxLines,
  );
}
