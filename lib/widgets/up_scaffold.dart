import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpScaffold extends StatelessWidget {
  final Widget? body;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final UpStyle? style;
  final UpColorType? colorType;
  final Widget? floatingActionButton;
  final String? restorationId;
  final DragStartBehavior? drawerDragStartBehavior;
  final double? drawerEdgeDragWidth;
  final Color? drawerScrimColor;
  final bool drawerEnableOpenDragGesture;
  final Widget? endDrawer;
  final bool endDrawerEnableOpenDragGesture;
  final bool? resizeToAvoidBottomInset;
  final void Function(bool)? onEndDrawerChanged;
  final bool extendBody;
  final List<Widget>? persistentFooterButtons;
  final bool extendBodyBehindAppBar;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final AlignmentDirectional persistentFooterAlignment;
  final void Function(bool)? onDrawerChanged;
  final bool primary;
  const UpScaffold({
    super.key,
    this.appBar,
    this.scaffoldKey,
    this.drawerScrimColor,
    this.endDrawerEnableOpenDragGesture = true,
    this.endDrawer,
    this.drawerEnableOpenDragGesture = true,
    this.body,
    this.style,
    this.colorType,
    this.bottomSheet,
    this.drawer,
    this.drawerEdgeDragWidth,
    this.bottomNavigationBar,
    this.restorationId,
    this.floatingActionButton,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.primary = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      bottomSheet: bottomSheet,
      drawer: drawer,
      body: body,
      drawerEdgeDragWidth: drawerEdgeDragWidth,
      drawerScrimColor: drawerScrimColor,
      endDrawer: endDrawer,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      floatingActionButtonLocation: floatingActionButtonLocation,
      onDrawerChanged: onDrawerChanged,
      onEndDrawerChanged: onEndDrawerChanged,
      persistentFooterAlignment: persistentFooterAlignment,
      persistentFooterButtons: const [],
      primary: primary,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
      drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
      restorationId: restorationId,
      drawerDragStartBehavior:
          drawerDragStartBehavior ?? DragStartBehavior.start,
      floatingActionButton: floatingActionButton,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: UpStyle.getAppBackgroundColor(context,
          style: style, colorType: colorType),
    );
  }
}
