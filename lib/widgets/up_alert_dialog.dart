import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';

class UpAlertDialog extends StatelessWidget {
  final Widget? title;
  final Widget? icon;
  final MainAxisAlignment? actionsAlignment;
  final OverflowBarAlignment? actionsOverflowAlignment;
  final List<Widget>? actions;
  final Widget? content;
  final double? elevation;
  final bool scrollable;
  final UpStyle? style;
  final double? actionsOverflowButtonSpacing;
  final UpColorType? colorType;
  final String? semanticLabel;
  final AlignmentGeometry? alignment;
  final VerticalDirection? actionsOverflowDirection;
  final Clip clipBehavior;
  const UpAlertDialog({
    super.key,
    this.title,
    this.actions,
    this.content,
    this.elevation,
    this.icon,
    this.semanticLabel,
    this.style,
    this.colorType,
    this.clipBehavior = Clip.none,
    this.scrollable = false,
    this.actionsAlignment,
    this.actionsOverflowButtonSpacing,
    this.actionsOverflowDirection,
    this.alignment,
    this.actionsOverflowAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: UpStyle.getAlertDialogTitleTextStyle(
        context,
        style: style,
        colorType: colorType,
      ),
      contentTextStyle: UpStyle.getAlertDialogContentTextStyle(
        context,
        style: style,
        colorType: colorType,
      ),
      semanticLabel: semanticLabel,
      clipBehavior: clipBehavior,
      elevation: elevation,
      iconPadding: UpStyle.getAlertDialogIconPadding(
        context,
        style: style,
        colorType: colorType,
      ),
      icon: icon,
      scrollable: scrollable,
      iconColor: UpStyle.getAlertDialogIconColor(
        context,
        style: style,
        colorType: colorType,
      ),
      shadowColor: UpStyle.getAlertDialogShadowColor(
        context,
        style: style,
        colorType: colorType,
      ),
      surfaceTintColor: UpStyle.getAlertDialogSurfaceTintColor(
        context,
        style: style,
        colorType: colorType,
      ),
      actionsPadding: UpStyle.getAlertDialogActionsPadding(
        context,
        style: style,
        colorType: colorType,
      ),
      titlePadding: UpStyle.getAlertDialogTitlePadding(
        context,
        style: style,
        colorType: colorType,
      ),
      contentPadding: UpStyle.getAlertDialogContentPadding(
        context,
        style: style,
        colorType: colorType,
      ),
      insetPadding: UpStyle.getAlertDialogInsetPadding(
        context,
        style: style,
        colorType: colorType,
      ),
      shape: UpStyle.getAlertDialogShape(
        context,
        style: style,
        colorType: colorType,
      ),
      buttonPadding: UpStyle.getAlertDialogButtonPadding(
        context,
        style: style,
        colorType: colorType,
      ),
      backgroundColor: UpStyle.getAlertDialogBackgroundColor(
        context,
        style: style,
        colorType: colorType,
      ),
      actionsAlignment: actionsAlignment,
      actionsOverflowAlignment: actionsOverflowAlignment,
      actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
      actionsOverflowDirection: actionsOverflowDirection,
      alignment: alignment,
      title: title,
      content: content,
      actions: actions,
    );
  }
}
