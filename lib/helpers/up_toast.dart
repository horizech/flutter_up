import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/enums/up_toast_type.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpToast {
  static bool _isVisible = false;

  static void showToast({
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
  }) async {
    if (_isVisible) {
      return;
    }

    _isVisible = true;

    final OverlayState overlayState = Overlay.of(context);
    final OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => _UpToast(
        style: style,
        colorType: upColorType,
        text: text,
        isRounded: isRounded,
        borderRadius: borderRadius,
        upToastType: upToastType,
        icon: icon,
        padding: padding,
        width: width,
        height: height,
      ),
    );
    overlayState.insert(overlayEntry);

    await Future.delayed(duration ?? const Duration(seconds: 2));

    overlayEntry.remove();

    _isVisible = false;
  }
}

class _UpToast extends StatefulWidget {
  final UpStyle? style;
  final UpColorType? colorType;
  final String text;
  final bool isRounded;
  final double borderRadius;
  final UpToastType? upToastType;
  final Icon? icon;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  const _UpToast({
    Key? key,
    this.upToastType,
    this.style,
    required this.isRounded,
    this.colorType,
    this.icon,
    this.padding,
    this.width,
    this.height,
    required this.borderRadius,
    required this.text,
  }) : super(key: key);

  @override
  State<_UpToast> createState() => __UpToastState();
}

class __UpToastState extends State<_UpToast> with TickerProviderStateMixin {
  // late AnimationController _controller;
  // late Animation<double> _animation;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(
  //       duration: const Duration(milliseconds: 500), vsync: this);
  //   _animation = Tween(begin: 0.0, end: 1.0).animate(
  //       CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5)))
  //     ..addListener(() {
  //       if (mounted) {
  //         setState(() {
  //           // Refresh
  //         });
  //       }
  //     })
  //     ..addStatusListener((AnimationStatus status) {
  //       if (status == AnimationStatus.completed) {
  //         _controller.reverse().orCancel;
  //       } else if (status == AnimationStatus.dismissed) {
  //         _controller.forward().orCancel;
  //       }
  //     });
  //   _controller.forward().orCancel;
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    UpStyle params = getToastStyle(
      context,
      widget.upToastType ?? UpToastType.primary,
      colorType: widget.colorType,
      style: widget.style,
    );
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding ??
              const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                UpStyle.getBorderRadius(
                  context,
                  style: widget.style,
                  colorType: widget.colorType,
                ),
              ), //                 <--- border radius here
            ),
            gradient: params.toastBackgroundGradient,
            color: params.toastBackgroundColor,
          ),
          child: Row(
            children: [
              widget.icon ??
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
                    widget.text,
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
}
