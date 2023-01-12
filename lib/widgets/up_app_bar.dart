import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final UpColorType? colorType;
  final UpStyle? style;
  final List<Widget>? actions;
  final Widget? leading;
  final bool excludeHeaderSemantics;

  const UpAppBar({
    Key? key,
    this.title,
    this.style,
    this.colorType,
    this.actions,
    this.leading,
    this.excludeHeaderSemantics = false,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      excludeHeaderSemantics: excludeHeaderSemantics,
      title: Text(
        title ?? "",
        style: TextStyle(
          color: UpStyle.getAppBarTitleColor(
            context,
            style: style,
            colorType: colorType,
          ),
          fontSize: UpStyle.getAppBarTitleSize(
            context,
            style: style,
            colorType: colorType,
          ),
        ),
      ),
      backgroundColor: UpStyle.getAppBarColor(
        context,
        style: style,
        colorType: colorType,
      ),
      leading: leading,
      actions: actions,
    );
  }
}
