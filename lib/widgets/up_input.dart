import 'package:flutter/material.dart';

class UpInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> valueChanged;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final int maxLines;
  final TextInputType keyboardType;

  const UpInputWidget(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.keyboardType,
      required this.obscureText,
      required this.maxLines,
      required this.controller,
      required this.valueChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: labelText,
            hintText: hintText,
            alignLabelWithHint: false),
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        // inputFormatters: <TextInputFormatter>[
        //   WhitelistingTextInputFormatter.
        // ], // Only numbers can be entered
        onChanged: (input) {
          valueChanged(input);
          // setState(() {});
        },
      ),
    );
  }
}
