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
  final Function()? onBlur;

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
    this.onBlur,
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
            child: _UpTextField(
              type: type,
              obscureText: obscureText,
              readOnly: readOnly,
              controller: controller,
              keyboardType: keyboardType,
              autofillHint: autofillHint,
              label: label,
              onSaved: onSaved,
              onChanged: onChanged,
              onBlur: onBlur,
              onTap: onTap,
              maxLines: maxLines,
              colorType: colorType,
              style: style,
              hint: hint,
              focusNode: focusNode,
              validation: validation,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              initialValue: initialValue,
              onFieldSubmitted: onFieldSubmitted,
              contentPadding: contentPadding,
            ))
        : _UpTextField(
            type: type,
            obscureText: obscureText,
            readOnly: readOnly,
            controller: controller,
            keyboardType: keyboardType,
            autofillHint: autofillHint,
            label: label,
            onSaved: onSaved,
            onChanged: onChanged,
            onBlur: onBlur,
            onTap: onTap,
            maxLines: maxLines,
            colorType: colorType,
            style: style,
            hint: hint,
            focusNode: focusNode,
            validation: validation,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            initialValue: initialValue,
            onFieldSubmitted: onFieldSubmitted,
            contentPadding: contentPadding,
          );
  }
}

class _UpTextField extends StatefulWidget {
  final UpInputType? type;
  final FocusNode? focusNode;
  final UpValidation? validation;
  final bool obscureText;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? autofillHint;
  final String? label;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final Function()? onBlur;
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

  const _UpTextField({
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
    this.onSaved,
    this.onChanged,
    this.onBlur,
    this.maxLines = 1,
    this.colorType,
    this.style,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.onFieldSubmitted,
  }) : super(key: key);
  @override
  State<_UpTextField> createState() => __UpTextFieldState();
}

class __UpTextFieldState extends State<_UpTextField> {
  FocusNode myFocusNode = FocusNode();
  //pattern for email
  static const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);
  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      setState(() {});
      if (!myFocusNode.hasFocus) {
        if (widget.onBlur != null) {
          widget.onBlur!();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: UpStyle.getTextfieldTextColor(
          context,
          style: widget.style,
          colorType: widget.colorType,
        ),
      ),
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      onTap: widget.onTap,
      focusNode: myFocusNode,
      initialValue: widget.initialValue,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      autofillHints:
          widget.autofillHint != null && widget.autofillHint!.isNotEmpty
              ? <String>[widget.autofillHint ?? ""]
              : null,
      validator: (value) {
        if (widget.validation != null &&
            (widget.validation!.isRequired ?? false)) {
          if (value == null || value == "" || value.isEmpty) {
            return 'Please enter ${widget.label}';
          }
        }
        if (widget.validation?.minLength != null) {
          if (widget.validation != null &&
              widget.validation!.fixedLengths != null &&
              !widget.validation!.fixedLengths!
                  .contains((widget.controller!.text).length)) {
            String lengths = widget.validation!.fixedLengths!
                .map((x) => x.toString())
                .reduce((value, element) => ('$value,') + element.toString());
            if (widget.validation!.fixedLengths!.length == 1) {
              return 'Length should be $lengths';
            } else {
              return 'Length should be one of $lengths';
            }
          } else {
            if (widget.validation != null &&
                widget.validation!.minLength != null &&
                value!.length < (widget.validation!.minLength ?? 0)) {
              if (widget.validation!.minLength == 1) {
                return 'Please enter ${widget.label}';
              } else {
                return 'Length should be at least ${widget.validation!.minLength}';
              }
            }
          }
        }
        if (widget.validation != null &&
            (widget.validation!.isEmail ?? false)) {
          if (value != null && value.isNotEmpty) {
            if (!regex.hasMatch(value)) {
              return 'Enter a valid email address';
            }
          }
        }

        if (widget.validation != null &&
            widget.validation!.customValidation != null &&
            widget.validation!.customValidation?.rejex != null) {
          return UpCustomValidation.customValidation(
            value: value ?? "",
            validation: widget.validation!.customValidation,
          );
        }
        return null;
      },
      obscureText: widget.obscureText,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: UpStyle.getTextfieldHintColor(
            context,
            style: widget.style,
            colorType: widget.colorType,
          ),
          fontSize: UpStyle.getTextfieldHintSize(
            context,
            style: widget.style,
            colorType: widget.colorType,
          ),
        ),
        contentPadding: widget.contentPadding ??
            EdgeInsets.only(
              left: 12.0,
              right: 3.0,
              bottom: 15.0,
              top: widget.type == UpInputType.underline ? 0.0 : 15.0,
            ),
        label: Text(
          widget.label ?? "",
          style: TextStyle(
            color: myFocusNode.hasFocus
                ? UpStyle.getTextfieldFocusedLabelColor(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  )
                : UpStyle.getTextfieldLabelColor(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  ),
            fontSize: myFocusNode.hasFocus
                ? UpStyle.getTextfieldFocusedLabelSize(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  )
                : UpStyle.getTextfieldLabelSize(
                    context,
                    style: widget.style,
                    colorType: widget.colorType,
                  ),
          ),
        ),
        floatingLabelStyle: const TextStyle(fontSize: 20),
        filled: true,
        fillColor: myFocusNode.hasFocus
            ? UpStyle.getTextfieldFocusedFilledColor(
                context,
                style: widget.style,
                colorType: widget.colorType,
              )
            : UpStyle.getTextfieldFilledColor(
                context,
                style: widget.style,
                colorType: widget.colorType,
              ),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hint,
        enabledBorder: UpStyle.getTextfieldBorderStyle(
          context,
          type: widget.type ?? UpInputType.outline,
          style: widget.style,
          colorType: widget.colorType,
        ),
        labelStyle: TextStyle(
          color: UpStyle.getForegroundColor(
            context,
            style: widget.style,
            colorType: widget.colorType,
          ),
        ),
        focusedBorder: UpStyle.getTextfieldBorderStyle(
          context,
          type: widget.type ?? UpInputType.outline,
          style: widget.style,
          colorType: widget.colorType,
          isFocused: true,
        ),
        errorBorder: UpStyle.getTextfieldBorderStyle(
          context,
          type: widget.type ?? UpInputType.outline,
          style: widget.style,
          colorType: widget.colorType,
          isError: true,
        ),
        border: UpStyle.getTextfieldBorderStyle(
          context,
          type: widget.type ?? UpInputType.outline,
          style: widget.style,
          colorType: widget.colorType,
        ),
      ),
      cursorColor: UpStyle.getTextfieldCursorColor(context,
          style: widget.style, colorType: widget.colorType),
      controller: widget.controller,
      maxLines: widget.maxLines,
    );
  }
}
