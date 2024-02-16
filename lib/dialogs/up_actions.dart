import 'package:flutter/material.dart';
import 'package:flutter_up/dialogs/up_base.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/services/up_dialog.dart';
import 'package:flutter_up/widgets/up_alert_dialog.dart';
import 'package:flutter_up/widgets/up_button.dart';
import 'package:flutter_up/widgets/up_text.dart';

class UpActionsDialog extends UpBaseDialog {
  @override
  void show(BuildContext context, String completerId, {dynamic data}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => UpAlertDialog(
        title: UpText(data['title']),
        content: UpText(data['text']),
        actions: data['actions']
            .map<Widget>((action) => SizedBox(
                  // width: 100,
                  child: UpButton(
                      text: action['text'],
                      onPressed: () {
                        if (action['onPressed'] != null) {
                          action['onPressed']();
                        }
                        ServiceManager<UpDialogService>().completeDialog(
                            context: context,
                            completerId: completerId,
                            result: null);
                      }),
                ))
            .toList(),
      ),
    );
  }
}
