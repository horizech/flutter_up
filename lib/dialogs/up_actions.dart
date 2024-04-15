import 'package:flutter/material.dart';
import 'package:flutter_up/dialogs/up_base.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/services/up_dialog.dart';
import 'package:flutter_up/themes/up_style.dart';
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
        content: Padding(
          padding: const EdgeInsets.only(
              left: 8.0, top: 20.0, bottom: 20.0, right: 8.0),
          child: UpText(
            data['text'],
            style: UpStyle(textSize: 16),
          ),
        ),
        actions: data['actions']
            .map<Widget>((action) => SizedBox(
                  child: UpButton(
                      text: action['text'],
                      onPressed: () {
                        if (action['onPressed'] != null) {
                          action['onPressed']();
                        }
                        ServiceManager<UpDialogService>().completeDialog(
                          context: context,
                          completerId: completerId,
                          result: null,
                        );
                      }),
                ))
            .toList(),
      ),
    );
  }
}
