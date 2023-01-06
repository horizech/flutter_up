import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_input_type.dart';

import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/validation/up_custom_validation.dart';
import 'package:flutter_up/validation/up_valdation.dart';

class UpTextField extends StatelessWidget {
  final UpInputType? type;
  final FocusNode? focusNode;

  final UpValidation? validation;
  final bool obscureText;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? autofillHint;
  final String? label;

  final bool isFlexible;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final int maxLines;
  final UpColorType? colorType;
  final UpStyle? style;
  final Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final String? hint;

  const UpTextField({
    Key? key,
    this.type,
    this.focusNode,
    this.validation,
    this.obscureText = false,
    this.readOnly = false,
    this.controller,
    this.keyboardType = TextInputType.text,
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
                autofillHint,
                label,
                onSaved,
                onChanged,
                onTap,
                maxLines,
                colorType,
                style,
                hint,
                focusNode,
                validation,
                prefixIcon,
                suffixIcon))
        : _upTextField(
            context,
            type,
            obscureText,
            readOnly,
            controller,
            keyboardType,
            autofillHint,
            label,
            onSaved,
            onChanged,
            onTap,
            maxLines,
            colorType,
            style,
            hint,
            focusNode,
            validation,
            prefixIcon,
            suffixIcon);
  }
}

Widget _upTextField(
  BuildContext context,
  UpInputType? type,
  bool obscureText,
  bool readOnly,
  TextEditingController? controller,
  TextInputType keyboardType,
  String? autofillHint,
  String? label,
  Function(String?)? onSaved,
  Function(String?)? onChanged,
  Function()? onTap,
  int? maxLines,
  final UpColorType? colorType,
  final UpStyle? style,
  final String? hint,
  final FocusNode? focusNode,
  final UpValidation? validation,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
) {
  return TextFormField(
    onSaved: onSaved,
    onTap: onTap,
    focusNode: focusNode,
    onChanged: onChanged,
    keyboardType: keyboardType,
    autofillHints: autofillHint != null && autofillHint.isNotEmpty
        ? <String>[autofillHint]
        : null,
    validator: (value) {
      if (validation != null && (validation.isRequired ?? false)) {
        if (value == null || value == "" || value.isEmpty) {
          return 'Please enter $label';
        }
      }
      if (validation?.minLength != null) {
        if (validation != null &&
            validation.fixedLengths != null &&
            !validation.fixedLengths!.contains((controller!.text).length)) {
          String lengths = validation.fixedLengths!
              .map((x) => x.toString())
              .reduce((value, element) => ('$value,') + element.toString());
          if (validation.fixedLengths!.length == 1) {
            return 'Length should be $lengths';
          } else {
            return 'Length should be one of $lengths';
          }
        } else {
          if (validation != null &&
              validation.minLength != null &&
              value!.length < (validation.minLength ?? 0)) {
            if (validation.minLength == 1) {
              return 'Please enter $label';
            } else {
              return 'Length should be at least ${validation.minLength}';
            }
          }
        }
      }
      if (validation != null && (validation.isEmail ?? false)) {
        return UpValidation.emailValidation(value ?? "");
      }
      if (validation != null &&
          validation.customValidation != null &&
          validation.customValidation?.rejex != null) {
        return UpCustomValidation.customValidation(
          value: value ?? "",
          validation: validation.customValidation,
        );
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
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
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
