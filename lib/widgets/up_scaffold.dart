import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/helpers/up_layout.dart';
import 'package:flutter_up/locator.dart';
import 'package:flutter_up/services/key.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpScaffold extends StatefulWidget {
  final Widget? body;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final Widget? compactDrawer;
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
  final bool fixedDrawer;
  final bool showFixedDrawerToggleIcon;
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
    this.compactDrawer,
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
    this.fixedDrawer = false,
    this.showFixedDrawerToggleIcon = true,
  });

  @override
  State<UpScaffold> createState() => _UpScaffoldState();
}

class _UpScaffoldState extends State<UpScaffold> {
  late bool isLargeScreen = MediaQuery.of(context).size.width <=
      UpStyle.getScaffoldMaximumScreenWidthForCompactDrawer(context,
          style: widget.style, colorType: widget.colorType)!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: widget.scaffoldKey,
        bottomSheet: widget.bottomSheet,
        drawer: widget.fixedDrawer && !UpLayout.isPortrait(context)
            ? null
            : widget.drawer,
        drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
        drawerScrimColor: widget.drawerScrimColor,
        endDrawer: widget.endDrawer,
        extendBody: widget.extendBody,
        extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
        floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        onDrawerChanged: widget.onDrawerChanged,
        onEndDrawerChanged: widget.onEndDrawerChanged,
        persistentFooterAlignment: widget.persistentFooterAlignment,
        persistentFooterButtons: widget.persistentFooterButtons,
        primary: widget.primary,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
        drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
        restorationId: widget.restorationId,
        drawerDragStartBehavior:
            widget.drawerDragStartBehavior ?? DragStartBehavior.start,
        floatingActionButton: widget.floatingActionButton,
        appBar: widget.appBar,
        bottomNavigationBar: widget.bottomNavigationBar,
        backgroundColor: UpStyle.getAppBackgroundColor(context,
            style: widget.style, colorType: widget.colorType),
        body: StreamBuilder(
            stream: ServiceManager<KeyService>().toggleFixedDrawerstream$,
            builder: (context, snapshot) {
              return widget.fixedDrawer && !UpLayout.isPortrait(context)
                  ? (widget.compactDrawer != null
                      ? snapshot.data == false
                          ? Row(
                              children: [
                                Container(
                                    width: snapshot.data == true
                                        ? MediaQuery.of(context).size.width *
                                            (UpStyle.getScaffoldFixedDrawerWidthPercentage(
                                                    context,
                                                    style: widget.style,
                                                    colorType:
                                                        widget.colorType)! /
                                                100)
                                        : UpStyle.getScaffoldCompactDrawerWidth(
                                            context,
                                            style: widget.style,
                                            colorType: widget.colorType)!,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        color: UpStyle.getScaffoldBodyColor(
                                            context,
                                            style: widget.style,
                                            colorType: widget.colorType),
                                        gradient:
                                            UpStyle.getScaffoldBodyGradient(
                                                context,
                                                style: widget.style,
                                                colorType: widget.colorType),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            UpStyle.getScaffoldBodyRadius(
                                                context,
                                                style: widget.style,
                                                colorType: widget.colorType),
                                          ),
                                        )),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: [
                                          snapshot.data == true
                                              ? widget.drawer ??
                                                  const SizedBox()
                                              : widget.compactDrawer ??
                                                  const SizedBox()
                                        ],
                                      ),
                                    )),
                                Container(
                                    width: snapshot.data == true
                                        ? MediaQuery.of(context).size.width *
                                            (UpStyle.getScaffoldBodyWidthPercentage(
                                                    context,
                                                    style: widget.style,
                                                    colorType:
                                                        widget.colorType)! /
                                                100)
                                        : MediaQuery.of(context).size.width -
                                            UpStyle.getScaffoldCompactDrawerWidth(
                                                context,
                                                style: widget.style,
                                                colorType: widget.colorType)!,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        color: UpStyle.getScaffoldBodyColor(
                                            context,
                                            style: widget.style,
                                            colorType: widget.colorType),
                                        gradient:
                                            UpStyle.getScaffoldBodyGradient(
                                                context,
                                                style: widget.style,
                                                colorType: widget.colorType),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            UpStyle.getScaffoldBodyRadius(
                                                context,
                                                style: widget.style,
                                                colorType: widget.colorType),
                                          ),
                                        )),
                                    child: widget.body ?? const SizedBox())
                              ],
                            )
                          : Row(
                              children: [
                                Container(
                                    width: snapshot.data == true
                                        ? MediaQuery.of(context).size.width *
                                            (UpStyle.getScaffoldFixedDrawerWidthPercentage(
                                                    context,
                                                    style: widget.style,
                                                    colorType:
                                                        widget.colorType)! /
                                                100)
                                        : UpStyle.getScaffoldCompactDrawerWidth(
                                            context,
                                            style: widget.style,
                                            colorType: widget.colorType)!,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        color: UpStyle.getScaffoldBodyColor(
                                            context,
                                            style: widget.style,
                                            colorType: widget.colorType),
                                        gradient:
                                            UpStyle.getScaffoldBodyGradient(
                                                context,
                                                style: widget.style,
                                                colorType: widget.colorType),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            UpStyle.getScaffoldBodyRadius(
                                                context,
                                                style: widget.style,
                                                colorType: widget.colorType),
                                          ),
                                        )),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: [
                                          snapshot.data == true
                                              ? widget.drawer ??
                                                  const SizedBox()
                                              : widget.compactDrawer ??
                                                  const SizedBox()
                                        ],
                                      ),
                                    )),
                                Container(
                                    width: snapshot.data == true
                                        ? MediaQuery.of(context).size.width *
                                            (UpStyle.getScaffoldBodyWidthPercentage(
                                                    context,
                                                    style: widget.style,
                                                    colorType:
                                                        widget.colorType)! /
                                                100)
                                        : MediaQuery.of(context).size.width -
                                            UpStyle.getScaffoldCompactDrawerWidth(
                                                context,
                                                style: widget.style,
                                                colorType: widget.colorType)!,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        color: UpStyle.getScaffoldBodyColor(
                                            context,
                                            style: widget.style,
                                            colorType: widget.colorType),
                                        gradient:
                                            UpStyle.getScaffoldBodyGradient(
                                                context,
                                                style: widget.style,
                                                colorType: widget.colorType),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            UpStyle.getScaffoldBodyRadius(
                                                context,
                                                style: widget.style,
                                                colorType: widget.colorType),
                                          ),
                                        )),
                                    child: widget.body ?? const SizedBox())
                              ],
                            )
                      : Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width *
                                    (UpStyle.getScaffoldFixedDrawerWidthPercentage(
                                            context,
                                            style: widget.style,
                                            colorType: widget.colorType)! /
                                        100),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: UpStyle.getScaffoldBodyColor(context,
                                        style: widget.style,
                                        colorType: widget.colorType),
                                    gradient: UpStyle.getScaffoldBodyGradient(
                                        context,
                                        style: widget.style,
                                        colorType: widget.colorType),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        UpStyle.getScaffoldBodyRadius(context,
                                            style: widget.style,
                                            colorType: widget.colorType),
                                      ),
                                    )),
                                child: widget.drawer ?? const SizedBox()),
                            Container(
                                width: MediaQuery.of(context).size.width *
                                    (UpStyle.getScaffoldBodyWidthPercentage(
                                            context,
                                            style: widget.style,
                                            colorType: widget.colorType)! /
                                        100),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: UpStyle.getScaffoldBodyColor(context,
                                        style: widget.style,
                                        colorType: widget.colorType),
                                    gradient: UpStyle.getScaffoldBodyGradient(
                                        context,
                                        style: widget.style,
                                        colorType: widget.colorType),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        UpStyle.getScaffoldBodyRadius(context,
                                            style: widget.style,
                                            colorType: widget.colorType),
                                      ),
                                    )),
                                child: widget.body ?? const SizedBox())
                          ],
                        ))
                  : widget.body ?? const SizedBox();
            }));
  }
}
