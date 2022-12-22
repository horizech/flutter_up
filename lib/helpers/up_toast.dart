import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_toast_type.dart';
import 'package:flutter_up/helpers/up_console.dart';
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
      child: _upToast(
        context,
        text,
        isRounded,
        borderRadius,
        upToastType,
        icon,
        padding,
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

Widget _upToast(
  BuildContext context,
  String text,
  bool isRounded,
  double borderRadius,
  UpToastType? upToastType,
  Icon? icon,
  EdgeInsetsGeometry? padding,
) {
  return Container(
    padding:
        padding ?? const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius:
          isRounded ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
      color: getToast(context, upToastType!).backgroundColor,
    ),
    child: Wrap(
      // mainAxisSize: MainAxisSize.min,
      children: [
        icon ??
            getToast(context, upToastType).icon ??
            const SizedBox(
              width: 0,
              height: 0,
            ),
        const SizedBox(
          width: 12.0,
        ),
        Center(
          child: Text(
            text,
            style: TextStyle(
              color: getToast(context, upToastType).foregroundColor,
            ),
          ),
        ),
      ],
    ),
  );
}
