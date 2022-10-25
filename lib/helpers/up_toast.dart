import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_toast_type.dart';
import 'package:flutter_up/helpers/up_console.dart';
import 'package:flutter_up/widgets/up_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

FToast fToast = FToast();

showUpToast({
  required BuildContext context,
  required String text,
  bool isRounded = false,
  double borderRadius = 25.0,
  UpToastType upToastType = UpToastType.primary,
  EdgeInsetsGeometry? padding,
  Icon? icon,
  Duration? duration,
}) {
  try {
    // FlutterToastr.show(text, context);

    removeAllQueuedToasts();
    fToast.init(context);

    fToast.showToast(
      child: UpToastWidget(
        text: text,
        isRounded: isRounded,
        borderRadius: borderRadius,
        icon: icon,
        padding: padding,
        upToastType: upToastType,
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: duration ?? const Duration(seconds: 2),
      // positionedToastBuilder: (context, child) {
      //   return Positioned(
      //     child: child,
      //     top: 16.0,
      //     left: 16.0,
      //   );
      // }
    );
  } catch (e) {
    upConsole(UpConsoleLevel.error, e.toString());
  }
}

removeAllQueuedToasts() {
  fToast.removeQueuedCustomToasts();
}
