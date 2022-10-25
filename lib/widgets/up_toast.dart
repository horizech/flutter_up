import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_toast_type.dart';

class UpToastWidget extends StatelessWidget {
  final String text;
  final bool isRounded;
  final double borderRadius;
  final UpToastType? upToastType;
  final Icon? icon;
  final EdgeInsetsGeometry? padding;

  const UpToastWidget({
    Key? key,
    required this.text,
    this.upToastType = UpToastType.primary,
    this.isRounded = false,
    this.borderRadius = 25.0,
    this.padding,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius:
            isRounded ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
        color: getToast(context, upToastType!).backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? icon!
              : getToast(context, upToastType!).icon ??
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
                color: getToast(context, upToastType!).foregroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
