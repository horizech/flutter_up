import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_input_type.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/services/up_search.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/validation/up_valdation.dart';
import 'package:flutter_up/widgets/up_textfield.dart';

class UpSearch extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? valueChanged;
  final String? lable;
  final String? hint;
  final UpColorType? colorType;
  final UpStyle? style;
  final UpInputType? type;
  final UpValidation? validation;

  const UpSearch({
    Key? key,
    required this.controller,
    this.valueChanged,
    this.type,
    this.validation,
    this.lable,
    this.hint,
    this.colorType,
    this.style,
  }) : super(key: key);

  @override
  UpSearchState createState() {
    return UpSearchState();
  }
}

class UpSearchState extends State<UpSearch> {
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
    return UpTextField(
      type: widget.type,
      colorType: widget.colorType,
      style: widget.style,
      validation: widget.validation,
      focusNode: searchFieldFocusNode,
      controller: widget.controller,
      label: widget.lable ?? "Search",
      hint: widget.hint ?? "Search",
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
      keyboardType: TextInputType.text,
      obscureText: false,
      onChanged: (input) {
        setState(() {
          ServiceManager<UpSearchService>().update(input);
          if (widget.valueChanged != null) {
            widget.valueChanged!(input ?? "");
          }
          searchFieldFocusNode!.requestFocus();
          // widget.controller?.text = value;
        });
      },
    );
  }
}
