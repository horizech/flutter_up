import 'package:flutter/material.dart';

class UpKey extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? valueChanged;
  final String? lableText;
  final String? hintText;

  const UpKey(
      {Key? key,
      required this.controller,
      this.valueChanged,
      this.lableText,
      this.hintText})
      : super(key: key);

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
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.lableText ?? "Password",
          hintText: widget.hintText ?? 'Password',
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
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: !_keyVisible,
        onChanged: (input) {
          widget.valueChanged!(input);
        },
      ),
    );
  }
}
