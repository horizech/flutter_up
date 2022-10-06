import 'package:flutter/material.dart';

class UpKeyWidget extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? valueChanged;

  const UpKeyWidget({Key? key, required this.controller, this.valueChanged})
      : super(key: key);

  @override
  UpKeyWidgetState createState() {
    return UpKeyWidgetState(); // (_UpKeyWidget);
  }
}

class UpKeyWidgetState extends State<UpKeyWidget> {
  bool _keyVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: "AES Encryption Key",
          hintText: 'AES Key',
          suffixIcon: IconButton(
              icon: Icon(
                _keyVisible ? Icons.visibility : Icons.visibility_off,
                semanticLabel: _keyVisible ? 'Hide key' : 'Show key',
              ),
              onPressed: () {
                setState(() {
                  _keyVisible = !_keyVisible;
                });
              }),
          // labelStyle: TextStyle(
          //   fontFamily: 'Roboto Medium',
          //   fontSize: 16.0,
          //   color: Color(0x99000000),
          //   letterSpacing: 0.4,
          // ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: !_keyVisible,

        // inputFormatters: <TextInputFormatter>[
        //   WhitelistingTextInputFormatter.
        // ], // Only numbers can be entered
        onChanged: (input) {
          widget.valueChanged!(input);
          // setState(() {});
        },
      ),
    );
  }
}
