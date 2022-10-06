import 'package:flutter/material.dart';

class UpDrawerItem {
  IconData icon;
  String title;
  Function onTap;

  UpDrawerItem({required this.icon, required this.title, required this.onTap});

  factory UpDrawerItem.fromJson(Map<String, dynamic> json) {
    UpDrawerItem drawerItem = UpDrawerItem(
      icon: json['icon'],
      title: json['title'],
      onTap: () {},
    );
    return drawerItem;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['title'] = title;
    data['onTap'] = null;
    return data;
  }
}
