import 'package:flutter/material.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/services/up_dialog.dart';

class UpBaseDialog {
  final UpDialogService dialogService = ServiceManager<UpDialogService>();

  void show(BuildContext context, String completerId, {dynamic data}) {}
}
