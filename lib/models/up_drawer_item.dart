import 'package:flutter/material.dart';

class UpDrawerItem {
  IconData icon;
  String title;
  Function onTap;
  String? path;

  UpDrawerItem(
      {required this.icon,
      required this.title,
      required this.onTap,
      this.path});

  factory UpDrawerItem.fromJson(Map<String, dynamic> json) {
    UpDrawerItem drawerItem = UpDrawerItem(
      icon: json['icon'],
      title: json['title'],
      path: json['path'],
      onTap: () {},
    );
    return drawerItem;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['title'] = title;
    data['onTap'] = null;
    data['path'] = null;
    return data;
  }
}
