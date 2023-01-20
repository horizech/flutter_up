import 'package:flutter/material.dart';
import 'package:flutter_up/dialogs/up_base.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/services/up_dialog.dart';
import 'package:flutter_up/widgets/up_button.dart';

class UpAboutAppDialog extends UpBaseDialog {
  Widget _getHeader(String title) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // const Padding(
        //     padding: EdgeInsets.fromLTRB(32, 0, 16, 0),
        //     child: Image(
        //       image: AssetImage('assets/app_icon.png'),
        //       height: 64,
        //     )),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: FittedBox(
            child: Text(
              title,
              style: TextStyle(color: Colors.grey[600], fontSize: 24),
            ),
          ),
        )
      ],
    );
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
                    children: data['text']
                        .split('\n')
                        .map<Widget>(
                          (text) => Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(text),
                          ),
                        )
                        .toList(),
                  )),
              actions: <Widget>[
                SizedBox(
                  width: 100,
                  child: UpButton(
                    text: "OK",
                    onPressed: () {
                      ServiceManager<UpDialogService>().completeDialog(
                        context: context,
                        completerId: completerId,
                        result: null,
                      );
                    },
                  ),
                )
              ],
            ));
  }
}
