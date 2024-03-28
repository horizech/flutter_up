import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/helpers/up_layout.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/services/key.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final UpColorType? colorType;
  final UpStyle? style;
  final List<Widget>? actions;
  final Widget? leading;
  final bool excludeHeaderSemantics;
  final bool automaticallyImplyLeading;
  final bool showToggleButton;
  final Widget? titleWidget;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const UpAppBar({
    Key? key,
    this.title,
    this.style,
    this.colorType,
    this.actions,
    this.leading,
    this.excludeHeaderSemantics = false,
    this.automaticallyImplyLeading = true,
    this.titleWidget,
    this.showToggleButton = false,
    this.scaffoldKey,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<UpAppBar> createState() => _UpAppBarState();
}

class _UpAppBarState extends State<UpAppBar> {
  Widget? _getLeading() {
    if (widget.showToggleButton) {
      // Scaffold.of(context).
      // widget.scaffoldKey.currentState.
      if (!UpLayout.isPortrait(context)) {
        return InkWell(
          onTap: () {
            setState(() {
              ServiceManager<KeyService>().toggleFixedDrawerCallback();
            });
          },
          child: Icon(
            UpStyle.getAppBarToggleIcon(context,
                style: widget.style, colorType: widget.colorType),
            size: UpStyle.getAppBarToggleIconSize(context,
                style: widget.style, colorType: widget.colorType),
            color: UpStyle.getAppBarToggleIconColor(context,
                style: widget.style, colorType: widget.colorType),
          ),
        );
      } else {
        return InkWell(
          onTap: () {
            if (widget.scaffoldKey != null &&
                widget.scaffoldKey!.currentState != null) {
              if (widget.scaffoldKey!.currentState!.isDrawerOpen) {
                widget.scaffoldKey!.currentState!.openDrawer();
              } else {
                widget.scaffoldKey!.currentState!.openDrawer();
              }
            }
          },
          child: Icon(
            UpStyle.getAppBarToggleIcon(context,
                style: widget.style, colorType: widget.colorType),
            size: UpStyle.getAppBarToggleIconSize(context,
                style: widget.style, colorType: widget.colorType),
            color: UpStyle.getAppBarToggleIconColor(context,
                style: widget.style, colorType: widget.colorType),
          ),
        );
      }
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: UpStyle.getAppBarShape(
        context,
        style: widget.style,
        colorType: widget.colorType,
      ),
      foregroundColor: UpStyle.getAppBarForegroundColor(
        context,
        style: widget.style,
        colorType: widget.colorType,
      ),
      shadowColor: UpStyle.getAppBarShadowColor(
        context,
        style: widget.style,
        colorType: widget.colorType,
      ),
      surfaceTintColor: UpStyle.getAppBarSurfaceTintColor(
        context,
        style: widget.style,
        colorType: widget.colorType,
      ),
      iconTheme: IconThemeData(
        color: UpStyle.getIconColor(
          context,
          style: widget.style,
          colorType: widget.colorType,
        ),
      ),
      bottomOpacity: UpStyle.getAppBarBottomOpacity(
        context,
        style: widget.style,
        colorType: widget.colorType,
      ),
      systemOverlayStyle: UpStyle.getAppBarSystemOverlayStyle(
        context,
        style: widget.style,
        colorType: widget.colorType,
      ),
      actionsIconTheme: UpStyle.getAppBarActionsIconTheme(
        context,
        style: widget.style,
        colorType: widget.colorType,
      ),
      elevation: UpStyle.getAppBarElevation(
        context,
        style: widget.style,
        colorType: widget.colorType,
      ),
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      excludeHeaderSemantics: widget.excludeHeaderSemantics,
      title: widget.titleWidget ??
          Text(
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
      leading: _getLeading(),
      // leading: widget.leading,
      actions: widget.actions,
    );
  }
}
