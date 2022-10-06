import 'package:flutter/material.dart';

class UpDropDownItem {
  final String name;
  final Icon icon;
  UpDropDownItem(this.name, this.icon);
}

// Example for using UpDropDownItem
/*
UpDropDownItem selectedUser;

List<UpDropDownItem> users = <UpDropDownItem>[
  const UpDropDownItem(
      'Android',
      Icon(
        Icons.android,
        color: const Color(0xFF167F67),
      )),
  const UpDropDownItem(
      'Flutter',
      Icon(
        Icons.flag,
        color: const Color(0xFF167F67),
      )),
  const UpDropDownItem(
      'ReactNative',
      Icon(
        Icons.format_indent_decrease,
        color: const Color(0xFF167F67),
      )),
  const UpDropDownItem(
      'iOS',
      Icon(
        Icons.mobile_screen_share,
        color: const Color(0xFF167F67),
      )),
];

Widget getDropDown() {
  return DropdownButton<UpDropDownItem>(
    hint: Text("Select item"),
    value: selectedUser,
    onChanged: (UpDropDownItem value) {
      setState(() {
        selectedUser = value;
      });
    },
    items: users.map((UpDropDownItem user) {
      return DropdownMenuItem<UpDropDownItem>(
        value: user,
        child: Row(
          children: <Widget>[
            user.icon,
            SizedBox(
              width: 10,
            ),
            Text(
              user.name,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      );
    }).toList(),
  );
}
*/
