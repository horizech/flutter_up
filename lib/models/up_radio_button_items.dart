import 'package:flutter/cupertino.dart';

class UpRadioButtonItem {
  final String? label;
  final dynamic value;
  final Widget? widget;
  final bool isDisabled;

  UpRadioButtonItem({
    this.label,
    required this.value,
    this.widget,
    this.isDisabled = false,
  });
}
