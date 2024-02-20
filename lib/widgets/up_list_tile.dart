import 'package:flutter/material.dart';
import 'package:flutter_up/enums/up_color_type.dart';
import 'package:flutter_up/themes/up_style.dart';
import 'package:flutter_up/widgets/up_icon.dart';
import 'package:flutter_up/widgets/up_text.dart';

class UpListTile extends StatelessWidget {
  final UpStyle? style;
  final UpColorType? colorType;
  final String? title;
  final Widget? titleWidget;
  final Widget? subtitle;
  final Widget? leading;
  final IconData? leadingIcon;
  final Widget? trailing;
  final bool isSelected;
  final IconData? trailingIcon;
  final ListTileTitleAlignment? listTileTitleAlignment;
  final Function()? onTap;
  final ShapeBorder? shape;
  final EdgeInsets? contentPadding;
  final bool isThreeLine;

  const UpListTile({
    Key? key,
    this.title,
    this.colorType,
    this.style,
    this.titleWidget,
    this.listTileTitleAlignment,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.shape,
    this.contentPadding,
    this.isSelected = false,
    this.isThreeLine = false,
    this.leadingIcon,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: isSelected
            ? UpStyle.getListTileSelectedTileColor(
                context,
                style: style,
                colorType: colorType,
              )
            : UpStyle.getListTileColor(
                context,
                style: style,
                colorType: colorType,
              ),
        child: ListTile(
          iconColor: UpStyle.getListTileIconColor(
            context,
            style: style,
            colorType: colorType,
          ),
          textColor: UpStyle.getListTileTextColor(
            context,
            style: style,
            colorType: colorType,
          ),
          focusColor: UpStyle.getListTileFocusedColor(
            context,
            style: style,
            colorType: colorType,
          ),
          hoverColor: UpStyle.getListTileHoveredColor(
            context,
            style: style,
            colorType: colorType,
          ),
          selectedColor: UpStyle.getListTileSelectedColor(
            context,
            style: style,
            colorType: colorType,
          ),
          tileColor: UpStyle.getListTileColor(
            context,
            style: style,
            colorType: colorType,
          ),
          selectedTileColor: UpStyle.getListTileSelectedTileColor(
            context,
            style: style,
            colorType: colorType,
          ),
          titleAlignment: listTileTitleAlignment,
          shape: shape,
          isThreeLine: isThreeLine,
          contentPadding: contentPadding,
          onTap: onTap,
          leading: leading ??
              UpIcon(
                icon: leadingIcon ?? Icons.menu,
                style: UpStyle(
                  iconColor: isSelected
                      ? UpStyle.getListTileSelectedColor(
                          context,
                          style: style,
                          colorType: colorType,
                        )
                      : UpStyle.getListTileTextColor(
                          context,
                          style: style,
                          colorType: colorType,
                        ),
                ),
              ),
          subtitle: subtitle,
          trailing: trailing,
          title: titleWidget ??
              UpText(
                title ?? "",
                style: UpStyle(
                  textColor: isSelected
                      ? UpStyle.getListTileSelectedColor(
                          context,
                          style: style,
                          colorType: colorType,
                        )
                      : UpStyle.getListTileTextColor(
                          context,
                          style: style,
                          colorType: colorType,
                        ),
                ),
              ),
        ));
  }
}
