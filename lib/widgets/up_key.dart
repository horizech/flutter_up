import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_input_type.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/validation/up_valdation.dart';
import 'package:flutter_up/widgets/up_textfield.dart';

class UpKey extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? valueChanged;
  final String? lable;
  final String? hint;
  final UpColorType? colorType;
  final UpStyle? style;
  final UpInputType? type;
  final UpValidation? validation;

  const UpKey({
    Key? key,
    this.type,
    this.validation,
    required this.controller,
    this.valueChanged,
    this.lable,
    this.hint,
    this.colorType,
    this.style,
  }) : super(key: key);

  @override
  UpKeyState createState() {
    return UpKeyState(); // (_UpKeyWidget);
  }
}

class UpKeyState extends State<UpKey> {
  bool _keyVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
      child: UpTextField(
        type: widget.type,
        colorType: widget.colorType,
        style: widget.style,
        controller: widget.controller,
        validation: widget.validation,
        label: widget.lable ?? "Password",
        hint: widget.hint ?? 'Password',
        suffixIcon: IconButton(
            icon: Icon(
              _keyVisible ? Icons.visibility : Icons.visibility_off,
              semanticLabel: _keyVisible ? 'Hide Password' : 'Show Password',
            ),
            onPressed: () {
              setState(() {
                _keyVisible = !_keyVisible;
              });
            }),
        keyboardType: TextInputType.visiblePassword,
        obscureText: !_keyVisible,
        onChanged: (input) {
          if (widget.valueChanged != null) {
            widget.valueChanged!(input ?? "");
          }
        },
      ),
    );
  }
}
