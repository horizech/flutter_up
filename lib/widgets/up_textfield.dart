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
  final Function(String)? onFieldSubmitted;
  final String? hint;
  final String? initialValue;
  final EdgeInsetsGeometry? contentPadding;

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
    this.initialValue,
    this.label = "",
    this.contentPadding,
    this.isFlexible = false,
    this.onSaved,
    this.onChanged,
    this.maxLines = 1,
    this.colorType,
    this.style,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.onFieldSubmitted,
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
                suffixIcon,
                initialValue,
                onFieldSubmitted,
                contentPadding))
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
            suffixIcon,
            initialValue,
            onFieldSubmitted,
            contentPadding,
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
  final String? initialValue,
  final Function(String)? onFieldSubmitted,
  EdgeInsetsGeometry? contentPadding,
) {
  //pattern for email
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);
  return TextFormField(
    onFieldSubmitted: onFieldSubmitted,
    onSaved: onSaved,
    onTap: onTap,
    focusNode: focusNode,
    initialValue: initialValue,
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
        if (value != null && value.isNotEmpty) {
          if (!regex.hasMatch(value)) {
            return 'Enter a valid email address';
          }
        }
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
      contentPadding: contentPadding ??
          EdgeInsets.only(
            left: 12.0,
            right: 3.0,
            bottom: 15.0,
            top: type == UpInputType.underline ? 0.0 : 15.0,
          ),
      label: Text(
        label ?? "",
        style: TextStyle(
          color: UpStyle.getTextfieldLabelColor(
            context,
            style: style,
            colorType: colorType,
          ),
          fontSize: UpStyle.getTextfieldLabelSize(
            context,
            style: style,
            colorType: colorType,
          ),
        ),
      ),
      filled: UpStyle.isTextfieldFilled(
        context,
        style: style,
        colorType: colorType,
      ),
      fillColor: UpStyle.getTextfieldFilledColor(
        context,
        style: style,
        colorType: colorType,
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hintText: hint,
      enabledBorder: UpStyle.getTextfieldBorderStyle(
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
      focusedBorder: UpStyle.getTextfieldBorderStyle(
        context,
        type: type ?? UpInputType.outline,
        style: style,
        colorType: colorType,
        isFocused: true,
      ),
      errorBorder: UpStyle.getTextfieldBorderStyle(
        context,
        type: type ?? UpInputType.outline,
        style: style,
        colorType: colorType,
        isError: true,
      ),
      border: UpStyle.getTextfieldBorderStyle(
        context,
        type: type ?? UpInputType.outline,
        style: style,
        colorType: colorType,
      ),
    ),
    cursorColor: UpStyle.getTextfieldCursorColor(context,
        style: style, colorType: colorType),
    controller: controller,
    maxLines: maxLines,
  );
}
