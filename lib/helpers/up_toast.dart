import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_toast_type.dart';
import 'package:flutter_up/helpers/up_console.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:fluttertoast/fluttertoast.dart';

FToast fToast = FToast();

showUpToast({
  required BuildContext context,
  required String text,
  UpStyle? style,
  UpColorType? upColorType,
  bool isRounded = false,
  double borderRadius = 25.0,
  UpToastType upToastType = UpToastType.primary,
  EdgeInsetsGeometry? padding,
  Icon? icon,
  Duration? duration,
  double width = 300,
  double? height,
}) {
  try {
    // FlutterToastr.show(text, context);

    removeAllQueuedToasts();
    fToast.init(context);

    fToast.showToast(
      child: _upToast(
        context,
        style,
        upColorType,
        text,
        isRounded,
        borderRadius,
        upToastType,
        icon,
        padding,
        width,
        height,
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
  UpStyle? style,
  UpColorType? colorType,
  String text,
  bool isRounded,
  double borderRadius,
  UpToastType? upToastType,
  Icon? icon,
  EdgeInsetsGeometry? padding,
  double? width,
  double? height,
) {
  return Container(
    width: width,
    height: height,
    padding:
        padding ?? const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(
          UpStyle.getBorderRadius(
            context,
            style: style,
            colorType: colorType,
          ),
        ), //                 <--- border radius here
      ),
      color:
          getToast(context, upToastType ?? UpToastType.primary).backgroundColor,
    ),
    child: Row(
      children: [
        icon ??
            getToast(context, upToastType ?? UpToastType.primary).icon ??
            const SizedBox(
              width: 0,
              height: 0,
            ),
        const SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: SizedBox(
            child: Text(
              text,
              style: TextStyle(
                color: getToast(context, upToastType ?? UpToastType.primary)
                    .foregroundColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
