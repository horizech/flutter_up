import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_toast_type.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpToast {
  bool _isVisible = false;

  void showToast({
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
    // required BuildContext context,
    // required WidgetBuilder externalBuilder,
    // Duration duration = const Duration(seconds: 2),
    // Offset position = Offset.zero,
  }) async {
    if (_isVisible) {
      return;
    }

    _isVisible = true;

    final OverlayState overlayState = Overlay.of(context);
    final OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => _upToast(
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
        // widget: externalBuilder(context),
        // position: position,
      ),
    );
    overlayState.insert(overlayEntry);

    await Future.delayed(duration ?? const Duration(seconds: 2));

    overlayEntry.remove();

    _isVisible = false;
  }
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
  UpStyle params = getToastStyle(
    context,
    upToastType ?? UpToastType.primary,
    colorType: colorType,
    style: style,
  );

  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        width: width,
        height: height,
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
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
          gradient: params.toastBackgroundGradient,
          color: params.toastBackgroundColor,
        ),
        child: Row(
          children: [
            icon ??
                params.toastIcon ??
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
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    color: params.toastForegroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
