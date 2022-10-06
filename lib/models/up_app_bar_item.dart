import 'package:flutter/material.dart';

class UpAppBarItem {
  IconData? icon;
  String? title;

  UpAppBarItem({this.icon, this.title});

  factory UpAppBarItem.fromJson(Map<String, dynamic> json) {
    UpAppBarItem appBarItem = UpAppBarItem(
      icon: json['icon'],
      title: json['title'],
    );
    return appBarItem;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['title'] = title;
    return data;
  }
}
