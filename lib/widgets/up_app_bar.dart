import 'package:flutter/material.dart';
import 'package:flutter_up/config/up_config.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/themes/up_theme_data.dart';

class UpAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final UpColorType? colorType;
  final UpStyle? style;
  final List<Widget>? actions;
  final Widget? leading;
  final bool excludeHeaderSemantics;
  final bool automaticallyImplyLeading;

  const UpAppBar({
    Key? key,
    this.title,
    this.style,
    this.colorType,
    this.actions,
    this.leading,
    this.excludeHeaderSemantics = false,
    this.automaticallyImplyLeading = true,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<UpAppBar> createState() => _UpAppBarState();
}

class _UpAppBarState extends State<UpAppBar> {
  @override
  Widget build(BuildContext context) {
    UpThemeData theme = UpConfig.of(context)!.theme;
    return AppBar(
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      excludeHeaderSemantics: widget.excludeHeaderSemantics,
      title: Text(
        widget.title ?? "",
        style: TextStyle(
          color: UpStyle.getAppBarTitleColor(
            context,
            style: widget.style,
            colorType: widget.colorType,
          ),
          fontSize: UpStyle.getAppBarTitleSize(
            context,
            style: widget.style,
            colorType: widget.colorType,
          ),
        ),
      ),
      backgroundColor: UpStyle.getAppBarColor(
        context,
        style: widget.style,
        colorType: widget.colorType,
      ),
      leading: widget.leading,
      actions: widget.actions,
    );
  }
}
