import 'package:flutter/material.dart';
import 'package:flutter_up/dialogs/up_base.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/services/up_dialog.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/widgets/up_alert_dialog.dart';
import 'package:flutter_up/widgets/up_button.dart';
import 'package:flutter_up/widgets/up_text.dart';

class UpInfoDialog extends UpBaseDialog {
  @override
  void show(BuildContext context, String completerId, {dynamic data}) {
    showDialog(
        context: context,
        builder: (context) => UpAlertDialog(
              title: UpText(data['title']),
              content: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 15.0, bottom: 15.0, right: 8.0),
                child: UpText(
                  data['text'] ?? "Error",
                  style: UpStyle(
                    textSize: 16,
                  ),
                ),
              ),
              actions: <Widget>[
                SizedBox(
                  // width: 100,
                  child: UpButton(
                    text: "OK",
                    onPressed: () {
                      ServiceManager<UpDialogService>().completeDialog(
                        context: context,
                        completerId: completerId,
                        result: {'success': true},
                      );
                    },
                  ),
                )
              ],
            ));
  }
}
