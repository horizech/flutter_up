import 'package:flutter/material.dart';
import 'package:flutter_up/models/up_label_value.dart';

class UpDropDownMenuWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String value;
  final List<UpLabelValuePair> itemList;

  const UpDropDownMenuWidget({
    Key? key,
    required this.value,
    required this.itemList,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<UpDropDownMenuWidget> createState() => UpDropDownMenuWidgetState();
}

class UpDropDownMenuWidgetState extends State<UpDropDownMenuWidget> {
  String? _curValue;

  changeValue(value) {
    widget.onChanged(value);
    setState(() {
      _curValue = value;
    });
  }

  List<DropdownMenuItem<dynamic>> getDropDownMenuItems() {
    return widget.itemList
        .map<DropdownMenuItem<dynamic>>((item) => DropdownMenuItem<dynamic>(
            value: item.value, child: Text(item.label)))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    if (widget.value.isNotEmpty) {
      _curValue = widget.value;
    } else {
      _curValue = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        // icon: Icon(Icons.folder),
        value: _curValue,
        iconSize: 24,
        elevation: 8,
        underline: Container(height: 2, color: Colors.deepPurple),
        items: getDropDownMenuItems(),
        onChanged: changeValue);
  }
}
