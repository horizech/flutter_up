import 'package:flutter/material.dart';
import 'package:flutter_up/dialogs/up_base.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/services/up_dialog.dart';

class UpAboutAppDialog extends UpBaseDialog {
  Widget _getHeader(String title) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(32, 0, 16, 0),
              child: Image(
                image: AssetImage('assets/app_icon.png'),
                height: 64,
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: FittedBox(
                  child: Text(
                title,
                style: TextStyle(color: Colors.grey[600], fontSize: 24),
              )))
        ]);
  }

  @override
  void show(BuildContext context, String completerId, {dynamic data}) {
    showDialog(
        // barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: _getHeader(data['title']),
              content: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: data['text'] //Constants.ABOUT_TEXT
                        .split('\n')
                        .map<Widget>((text) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(text)))
                        .toList(),
                  )),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text("OK"),
                  onPressed: () {
                    // Navigator.of(context).pop();
                    ServiceManager<UpDialogService>().completeDialog(
                        context: context,
                        // pop: false,
                        completerId: completerId,
                        result: null);
                  },
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
