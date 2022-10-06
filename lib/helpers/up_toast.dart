import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_up/helpers/up_console.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

FToast fToast = FToast();

showUpToast(BuildContext context, text) {
  try {
    FlutterToastr.show(text, context);
    /*
    removeAllQueuedToasts();
    fToast.init(context);

    fToast.showUpToast(
      child: UpToastWidget(text: text),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
      // positionedToastBuilder: (context, child) {
      //   return Positioned(
      //     child: child,
      //     top: 16.0,
      //     left: 16.0,
      //   );
      // }
    );
    */

  } catch (e) {
    console(UpConsoleLevel.error, e.toString());
  }
}

removeAllQueuedToasts() {
  fToast.removeQueuedCustomToasts();
}
