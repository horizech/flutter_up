import 'package:flutter/material.dart';
import 'package:flutter_up/dialogs/up_base.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/services/up_dialog.dart';

class UpActionsDialog extends UpBaseDialog {
  @override
  void show(BuildContext context, String completerId, {dynamic data}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
            title: Text(data['title']),
            content: Text(data['text']),
            actions: data['actions']
                .map<Widget>((action) => ElevatedButton(
                    child: Text(action['text']),
                    onPressed: () {
                      if (action['onPressed'] != null) {
                        action['onPressed']();
                      }
                      ServiceManager<UpDialogService>().completeDialog(
                          context: context,
                          completerId: completerId,
                          result: null);
                    }))
                .toList()));
  }
}
