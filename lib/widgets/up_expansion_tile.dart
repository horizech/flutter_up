import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/widgets/up_text.dart';

class UpExpansionTile extends StatelessWidget {
  final List<Widget> children;
  final UpStyle? style;
  final UpColorType? colorType;
  final String title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Function(bool)? onExpansionChanged;
  final bool maintainState;
  final bool initiallyExpanded;
  final ListTileControlAffinity? controlAffinity;
  final EdgeInsetsGeometry? childrenPadding;
  final EdgeInsetsGeometry? tilePadding;
  final CrossAxisAlignment? expandedCrossAxisAlignment;
  final Alignment? expandedAlignment;

  const UpExpansionTile({
    Key? key,
    required this.children,
    required this.title,
    this.colorType,
    this.style,
    this.onExpansionChanged,
    this.subtitle,
    this.leading,
    this.trailing,
    this.maintainState = false,
    this.initiallyExpanded = false,
    this.controlAffinity,
    this.childrenPadding,
    this.tilePadding,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: UpStyle.getExpansionTileCollapsedIconColor(
        context,
        style: style,
        colorType: colorType,
      ),
      collapsedTextColor: UpStyle.getExpansionTileCollapsedTextColor(
        context,
        style: style,
        colorType: colorType,
      ),
      iconColor: UpStyle.getExpansionTileIconColor(
        context,
        style: style,
        colorType: colorType,
      ),
      textColor: UpStyle.getExpansionTileTextColor(
        context,
        style: style,
        colorType: colorType,
      ),
      backgroundColor: UpStyle.getExpansionTileBackgroundColor(
        context,
        style: style,
        colorType: colorType,
      ),
      collapsedBackgroundColor:
          UpStyle.getExpansionTileCollapsedBackgroundColor(
        context,
        style: style,
        colorType: colorType,
      ),
      leading: leading,
      subtitle: subtitle,
      childrenPadding: childrenPadding,
      expandedAlignment: expandedAlignment,
      expandedCrossAxisAlignment: expandedCrossAxisAlignment,
      tilePadding: tilePadding,
      controlAffinity: controlAffinity,
      initiallyExpanded: initiallyExpanded,
      maintainState: maintainState,
      onExpansionChanged: onExpansionChanged,
      trailing: trailing,
      title: UpText(title),
      children: children,
    );
  }
}
