import 'package:flutter/material.dart';
import 'package:flutter_up/config/up_config.dart';
import 'package:flutter_up/dialogs/up_base.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/services/up_dialog.dart';
import 'package:flutter_up/widgets/up_button.dart';
import 'package:flutter_up/widgets/up_text.dart';

class UpInfoDialog extends UpBaseDialog {
  @override
  void show(BuildContext context, String completerId, {dynamic data}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: UpConfig.of(context).theme.baseColor.shade50,
              title: UpText(data['title']),
              content: UpText(data['text'] ?? "Error"),
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
    // Alert(
    //     context: context,
    //     title: "FilledStacks",
    //     desc: "My tutorials show realworld structures.",
    //     closeFunction: () => _dialogService.dialogComplete(),
    //     buttons: [
    //       DialogButton(
    //         child: Icon(Icons.add),
    //         onPressed: () {
    //           _dialogService.dialogComplete();
    //           Navigator.of(context).pop();
    //         },
    //       )
    //     ]).show();
  }
}
