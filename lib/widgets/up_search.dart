import 'package:flutter/material.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/services/up_search.dart';

class UpSearchWidget extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? valueChanged;

  const UpSearchWidget({Key? key, required this.controller, this.valueChanged})
      : super(key: key);

  @override
  UpSearchWidgetState createState() {
    return UpSearchWidgetState();
  }
}

class UpSearchWidgetState extends State<UpSearchWidget> {
  // String _curValue = "";

  // UpSearchWidgetState() {
  //   if (widget.controller != null) {
  //     _curValue = widget.controller.text;
  //   }
  // }

  FocusNode? searchFieldFocusNode;

  @override
  void initState() {
    super.initState();
    searchFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    searchFieldFocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: searchFieldFocusNode,
      controller: widget.controller,
      textInputAction: TextInputAction.search,
      autocorrect: false,
      decoration: InputDecoration(
        // labelText: "Search",
        hintText: "Search",
        prefixIcon: const Icon(
          Icons.search,
          semanticLabel: 'Search site',
        ),
        suffixIcon: IconButton(
          icon: Icon(
            widget.controller.text.isNotEmpty ? Icons.clear : null,
            semanticLabel: 'Clear Search text',
          ),
          onPressed: () {
            widget.controller.text = "";
            setState(() {
              ServiceManager<UpSearchService>().update("");
              if (widget.valueChanged != null) {
                widget.valueChanged!("");
              }
              searchFieldFocusNode!.requestFocus();
              // widget.controller?.text = value;
            });
          },
        ),
      ),
      keyboardType: TextInputType.text,
      obscureText: false,
      onChanged: (input) {
        setState(() {
          ServiceManager<UpSearchService>().update(input);
          if (widget.valueChanged != null) {
            widget.valueChanged!(input);
          }
          searchFieldFocusNode!.requestFocus();
          // widget.controller?.text = value;
        });
      },
    );
  }
}
